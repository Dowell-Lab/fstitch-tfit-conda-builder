#!/bin/bash

set -euo pipefail

anaconda login --username $ANACONDA_USER --password $ANACONDA_PASSWORD
conda config --set anaconda_upload yes

conda build /to_build/fstitch

conda build /to_build/tfit
