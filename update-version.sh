#!/bin/bash

set -e

LAST_COMMIT_DATE=$(git log -1 --format=%cd --date=format:'%y%m%d')
COMMIT_HASH=$(git rev-parse --short=8 HEAD)
revision=$LAST_COMMIT_DATE-$COMMIT_HASH
echo "$revision"

