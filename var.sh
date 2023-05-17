export LAST_COMMIT_DATE=$(git log -1 --format=%cd --date=format:'%y%m%d')
export COMMIT_HASH=$(git rev-parse --short=8 HEAD)
export  IMAGE_TAG="$LAST_COMMIT_DATE-$COMMIT_HASH"
echo "$IMAGE_TAG"  
