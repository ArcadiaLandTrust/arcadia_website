#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset


celery -A arcadia_website.taskapp worker -l INFO
