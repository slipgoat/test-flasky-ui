## Run tests
Execute `./run.sh` to run tests

Report generates into `results` directory

## Used dependencies:
- **python 3.9**
- **poetry** for dependencies management and virtual envs
- **robotframework** - as a test framework
- **robotframework-pabot** as a test runner
- **robotframework-seleniumlibrary** for interacting with browser
- **webdrivermanager** as webdrivers manager
- **requests** for api requests execution
- **names** for generate human-readable names
- **pydantic** for typing and work with models

### Found bugs
1. It is possible to open User Information page without log in

Here is also the same input validation bugs as in the api tests
