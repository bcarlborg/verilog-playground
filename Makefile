# Directory Variables
SRC_DIR := circuits
BUILD_DIR := build

# Find all testbench files (_tb.v) in circuits subdirectories
TESTBENCH_SOURCES := $(wildcard $(SRC_DIR)/*/*_tb.v)

# Generate corresponding paths for compiled VVP files
TESTBENCH_TARGETS := $(patsubst $(SRC_DIR)/%.v, $(BUILD_DIR)/%.vvp, $(TESTBENCH_SOURCES))

# Default target
all: $(TESTBENCH_TARGETS)

# Rule to compile testbenches
$(BUILD_DIR)/%.vvp: $(SRC_DIR)/%.v
	@mkdir -p $(dir $@)
	iverilog -o $@ $< $(filter-out $<, $(wildcard $(dir $<)*.v))

# Run a specific testbench (usage: make run TB=mux/mux_tb)
run: $(BUILD_DIR)/$(TB).vvp
	vvp $<


# Clean build directory
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
