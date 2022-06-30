#!/bin/bash
set -euo pipefail

hugo -e production --cleanDestinationDir --gc --verbose --debug --minify
