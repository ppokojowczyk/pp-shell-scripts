#!/bin/bash

set -e 

srv=black-srv
cnt=0

for repo in $(ls -1); do
    # skip if file
    if [[ -f "$repo" ]]; then
        continue
    fi

    # skip if it not a git repo
    if [[ ! -d "$repo/.git" ]]; then
        continue
    fi

    # check if repo is already defined
    res=$(git -C "$repo" remote -v | { grep "$srv" || :; })

    # skip if already defined
    if [[ ! -z $res ]]; then
        # push
        if [[
            $repo == "novatms"
            || $repo == "nova-mobile-api"
            || $repo == "nova-mobile-manager"
            || $repo == "nova-tms-docker"
            || $repo == "nova-webapps-manager"
            || $repo == "win-nova-tms"
        ]]; then
            echo "  - skipping push for $repo"
            continue
        fi

        echo "* $repo"

        target_remote_repo=$(git -C "$repo" remote -v | grep push | grep "$srv" | cut -f 1)

        if [ -z "$target_remote_repo" ]; then
            echo "  - (!) target remote repo not found"
            exit 1
        fi

        if [[ $target_remote_repo != "$srv" ]]; then
            echo "  - not $srv repo, so not pushing"
            continue
        fi

        echo "  - pushing to $target_remote_repo"
        git -C "$repo" push black-srv --all
        continue
    fi

    echo "* $repo"

    # name of remote bare repo
    bare_repo=$repo

    # make sure remote repo has .git suffix
    if [[ -z $(echo $bare_repo | grep "\.git") ]]; then
        bare_repo="$bare_repo.git"
    fi

    # check if remote bare repo exists
    no_bare=$(git ls-remote --exit-code "$srv:git/$bare_repo" 2>&1 || :;)

    # if does not exist then init
    if [[ $no_bare ]]; then
        echo "  - bare $bare_repo does not exist, init a new bare repo"
        ssh $srv "git init -b main --bare git/$bare_repo"
    fi

    # check if remote repo was created and add it to local repo
    if ! git ls-remote --exit-code "$srv:git/$bare_repo" &>/dev/null; then
        echo "  - remote repo exists and is reachable, adding to local repo"
        git -C $repo remote add "$srv" "$srv:git/$bare_repo"
        continue
    fi

    # last check
    origin=$(git -C "$repo" remote -v | head -n 1 | sed 's/\t/ /g' | tr -s ' ' | cut -d " " -f 2 | sed 's/.*\/\(.*\)/\1/')
    echo "  - $bare_repo is not on $srv -> $origin"
    let cnt+=1
done
if [[ $cnt -gt 0 ]]; then
    echo "Total: $cnt"
fi
echo "Done."
