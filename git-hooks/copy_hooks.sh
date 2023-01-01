#/bin/bash

repo_dir=$(git rev-parse --show-toplevel)
cp $repo_dir/git-hooks/hooks/* $repo_dir/.git/hooks
chmod +x $repo_dir/.git/hooks/*