#!/bin/sh
# Test:
#   Cli tool: shared hook repository management failures

if ! sh /var/lib/githooks/install.sh; then
    echo "! Failed to execute the install script"
    exit 1
fi

git hooks shared unknown && exit 2
rm -rf ~/.githooks/shared &&
    git hooks shared purge && exit 3
git hooks shared add && exit 4
git hooks shared remove && exit 5
git hooks shared add --local /tmp/some/repo.git && exit 6
git hooks shared remove --local /tmp/some/repo.git && exit 7
git hooks shared clear && exit 8
git hooks shared clear unknown && exit 9
git hooks shared list unknown && exit 10
if git hooks shared list --local; then
    exit 11
fi

# Check the Git alias
git hooks shared unknown && exit 12
rm -rf ~/.githooks/shared &&
    git hooks shared purge && exit 13
git hooks shared add && exit 14
git hooks shared remove && exit 15
git hooks shared add --local /tmp/some/repo.git && exit 16
git hooks shared remove --local /tmp/some/repo.git && exit 17
git hooks shared clear && exit 18
git hooks shared clear unknown && exit 19
git hooks shared list unknown && exit 20
if git hooks shared list --local; then
    exit 21
fi
