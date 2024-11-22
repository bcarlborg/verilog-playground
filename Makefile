# Iverilog is the Verilog compiler
IVERILOG = iverilog
# VVP is the Verilog simulator
VVP = vvp
IVERILOG_FLAGS = -Wall

# Directories
SRC_DIR = circuits
BUILD_DIR = build

#######################################################################
# Derived Variables
# Use shell commands to find the relevant source files and generate the
# corresponding paths for the compiled VVP test bench files
#######################################################################

# Find all testbench files (_tb.v) in circuits subdirectories
TEST_SRCS := $(shell find $(SRC_DIR) -name '*_tb.v')

# Generate corresponding paths for dependency files for the testbenches
# that we want to create
TEST_DEPS := $(TEST_SRCS:$(SRC_DIR)/%.v=$(BUILD_DIR)/%.mk)

# Generate corresponding paths for compiled VVP test bench files
# that we want to create
TEST_VVPS := $(TEST_SRCS:$(SRC_DIR)/%.v=$(BUILD_DIR)/%.vvp)

#######################################################################
# Rules
#######################################################################

build-tests: $(TEST_VVPS)

.PHONY: run-tests
run-tests: $(TEST_VVPS)
	@for test in $^; do \
		echo "============== Running $$test =============="; \
		$(VVP) $$test; \
	done

# Include rules from dependency files
# If the dependency files do not exist, the rule below will be executed
# to generate them
-include $(TEST_DEPS)

# Rule to compile Verilog source files into VVP test bench files
$(BUILD_DIR)/%.vvp:
	mkdir -p $(dir $@)
	$(IVERILOG) -o $@ $<


# Rule to generate dependency files for Verilog source files
$(BUILD_DIR)/%.mk: $(SRC_DIR)/%.v
	mkdir -p $(dir $@)
	@# Add a target and colon to a tmp file
	echo "$(@:.mk=.vvp):" > $@.tmp1
	@# Add the dependencies to the tmp file
	$(IVERILOG) -M $@.tmp2 $<
	@# Concatenate the target and colon with the dependencies
	cat $@.tmp1 $@.tmp2 > $@.tmp3
	@# Remove newlines and replace with spaces so that we have a proper rule
	tr '\n' ' ' < $@.tmp3 > $@
	@# Remove temporary files
	rm $@.tmp*

clean:
	rm -rf $(BUILD_DIR)

