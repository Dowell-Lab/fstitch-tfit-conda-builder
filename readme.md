# Conda Builder for FStitch

This repository contains an alpha quality setup for building conda
using either vagrant or docker. Currently, using Docker is the
preferred method for building these images, as occasionally the
vagrant image will run into an irreconcilable build issue that
prevents the process from completing.

## Dependencies

- make
- docker

## Instructions for use

All you need to do is run:

```
make
```

This will automatically build a docker image containing the conda
build requirements and then execute the conda build commands inside an
instance of that container. At this time, uploading functionality is
not implemented, and will have to be added to the configuration at a
later date.

## Commentary

Building a C++ Package with conda is a massive pain, and I don't
recommend it.

The biggest issue is configuring setup.sh. You need to properly set
environment variables so that conda uses its own libraries. Unless you
do this, g++ will try to use the system /lib/ path and get confused,
giving you linking errors. The code snippet below outlines the biggest
issues that I encountered when building this repository.

```bash
#!/bin/bash
# FILE: setup.sh

# Export proper environment variables using conda's $PREFIX
export CPLUS_INCLUDE_PATH=${PREFIX}/include
export C_INCLUDE_PATH=${PREFIX}/include

# Override hard-coded g++ values with conda's own compiler
sed -i=.bak -e "s|g++|$GXX|g" src/Makefile

# Run your makefile in this new environment
bash setup.sh

# If your makefile doesn't do it, copy your final binary to
# $PREFIX/bin, conda's internal binary location.
cp src/TFit ${PREFIX}/bin/tfit
```

Unfortunately, no detailed documentation exists with instructions on
how to modify C++ or other non-python code in order to build on Conda.

## License

MIT
