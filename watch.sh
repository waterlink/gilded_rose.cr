#!/usr/bin/env bash

AUTO_COMMIT=${AUTO_COMMIT:-""}
COMMIT_ON_FAILURE=${COMMIT_ON_FAILURE:-""}
FUNNY_COMMIT=${FUNNY_COMMIT:-""}

os="$(uname)"

next_change() {
  x=$(cat .change-count)
  echo $((x+1)) | tee .change-count
}

watch() {
  if [[ "$os" = "Linux" ]]; then
    # to install: apt-get install inotify-tools
    inotifywait --quiet --recursive --monitor --event modify --format "%w%f" "$@"
  elif [[ "$os" = "Darwin" ]]; then
    # to install: brew install fswatch
    fswatch -o "$@"
  else
    echo "Unknown OS $os"
    exit 1
  fi
}

notify() {
  if [[ "$os" = "Linux" ]]; then
    notify-send "$@"
  elif [[ "$os" = "Darwin" ]]; then
    # to install: brew install terminal-notifier
    if [[ "$1" == --expire-time=* ]]; then
      shift
    fi
    echo terminal-notifier -message "$@"
    terminal-notifier -message "$@"
  else
    echo "Unknown OS $os"
    exit 1
  fi
}

commit_message() {
  ! [[ -z "$FUNNY_COMMIT" ]] && echo -n " " && curl http://whatthecommit.com/index.txt
}

watch src spec \
  | while read change; do
    crystal spec --no-color --fail-fast > .watch.out
    res=$?
    committed=

    if [[ $res -eq 0 ]]; then
      ! [[ -z "$AUTO_COMMIT" ]] && git add . && git commit -m "[GREEN] Change $(next_change)$(commit_message)" && committed="(committed)"
      notify --expire-time=1000 "SUCCESS $committed"
    else
      failure=$(cat .watch.out | grep 'Failure\|expected:\|got:\|Error in')
      cat .watch.out
      ! [[ -z "$AUTO_COMMIT" ]] && ! [[ -z "$COMMIT_ON_FAILURE" ]] && git add . && git commit -m "[RED] Change $(next_change)$(commit_message)" && committed="(committed)"
      notify --expire-time=3000 "FAILURE:$failure $committed"
    fi
done
