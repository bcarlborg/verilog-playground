# iverilog is the Verilog compiler
IVERILOG = iverilog
IVERILOG_FLAGS = -Wall
# vvp is the verilog simulator
VVP = vvp

# Directories
SRC_DIR = circuits
BUILD_DIR = build

#######################################################################
# Derived Variables
# Use shell commands to find the relevant source files and generate the
# corresponding paths for the compiled VVP test bench files
#######################################################################

SRCS = $(shell find $(SRC_DIR) -name '*.v')


# Find all testbench files (_tb.v) in circuits subdirectories
TEST_SRCS := $(shell find $(SRC_DIR) -name '*_tb.v')

# Generate corresponding paths for compiled VVP test bench files
# that we want to create
TEST_VVPS := $(TEST_SRCS:$(SRC_DIR)/%.v=$(BUILD_DIR)/%.vvp)

# Generate makefiles that have rules for the testbench vvp files
TEST_DEPS := $(TEST_SRCS:$(SRC_DIR)/%.v=$(BUILD_DIR)/%.mk)

#######################################################################
# Phony Rules
#######################################################################

build-tests: $(TEST_VVPS)

.PHONY: run-tests
run-tests: $(TEST_VVPS)
	@for test in $^; do \
		echo "============== Running $$(test) =============="; \
		$(VVP) $$test; \
	done

clean:
	rm -rf $(BUILD_DIR)

#######################################################################
# Rules
#######################################################################

# Include rules from dependency files
# If the dependency files do not exist, the rule below for *.mk
# targets will generate them
-include $(TEST_DEPS)

# Catch all compile Verilog source files into VVP test bench files
# Will catch all rules with targets ending in .vvp from the dependency files
$(BUILD_DIR)/%.vvp:
	@echo "[make]: Compiling $@"
	@mkdir -p $(dir $@)
	@$(IVERILOG) $(IVERILOG_FLAGS) -o $@ $<

# Rule to generate dependency files for Verilog source files
# You can invoke iverilog with the -M flag to get the dependencies
# for any verilog file. We use this recipe to transform the output
# from that iverilog command into a file with a proper rule
$(BUILD_DIR)/%.mk: $(SRC_DIR)/%.v
	@echo "[make]: Generating dependency file for $<"
	@mkdir -p $(dir $@)
	@# Add a target and colon to a tmp file
	@echo "$(@:.mk=.vvp):" > $@.tmp1
	@# Add the dependencies to the tmp file
	@$(IVERILOG) -M $@.tmp2 $<
	@# Concatenate the target and colon with the dependencies
	@cat $@.tmp1 $@.tmp2 > $@.tmp3
	@# Remove newlines and replace with spaces so that we have a proper rule
	@tr '\n' ' ' < $@.tmp3 > $@
	# Remove temporary files
	@rm $@.tmp*
