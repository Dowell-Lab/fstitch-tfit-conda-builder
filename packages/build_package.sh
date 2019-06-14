#!/bin/bash

set -euo pipefail

cd /to_build/fstitch || exit

conda build .

cd /to_build/tfit || exit

conda build .
