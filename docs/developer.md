# Developer Docs

## Dependencies

The only dependencies to build and run this project should be

- [OSS CAD Suite](https://github.com/YosysHQ/oss-cad-suite-build): Although, currently, this project only makes use of `iverilator` and `vpp`. So you could probably get away with just adding those to your path.
- [GNU Make](https://www.gnu.org/software/make/manual/): I am using version 3.81

## Running the project

At the moment, the only runnable code in this project are the test files. Those can be built and executed by running `make run-tests` from the root of this project directory.

To clean the build directory run `make clean`.

Look in the Makefile of the project's root directory for additional targets make can build.
