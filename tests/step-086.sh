#!/bin/sh
# Test:
#   Cli tool: list Githooks configuration

if ! sh /var/lib/githooks/install.sh; then
    echo "! Failed to execute the install script"
    exit 1
fi

# Unknown configuration

! git hooks config set unknown || exit 2

# List configuration

mkdir -p /tmp/test086 && cd /tmp/test086 || exit 3

! git hooks config list --local || exit 4 # not a Git repo

git init || exit 4

git hooks config enable update || exit 7
git hooks config list --global | grep 'githooks.autoupdate.enabled' || exit 8
git hooks config list | grep 'githooks.autoupdate.enabled' || exit 9

# Check the Git alias
! git hooks config set unknown || exit 10

git hooks config enable update &&
    git hooks config list --global | grep 'githooks.autoupdate.enabled' || exit 12
git hooks config list | grep 'githooks.autoupdate.enabled' ||
    exit 13
