#!/bin/bash
set -euo pipefail

hugo -e staging --cleanDestinationDir --gc --verbose --debug --minify
