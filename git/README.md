# X.0 GIT Aliases

## X.1 git s
Shorthand for checking git status, nothing more nothing less.

## X.2 git crb
Abbreviation meaning: git create release branch

With this alias you can create a new release branch. What you type after git crb will be parsed as a variable into the following string: "release/$1" where $1 is the variable.

## X.3 git cfb
Abbreviation meaning: git create feature branch

With this alias you can create a new feature branch. What you type after git cab will be parsed as a variable into the following string: "feature.$1" where $1 is the variable.

## X.4 git cbb
Abbreviation meaning: git create bug branch

With this alias you can create a new bug branch. What you type after git cbb will be parsed as a variable into the following string: "bug/$1" where $1 is the variable.

## X.5 git su
Abbreviation meaning: git set upstream

With this alias you can set the upstream for a local branch you have created. What this command does is check the name of your local branch and piping that string into the following command: git push -u "origin $1" where $1 is the name of your local branch.

## X.6 git ulb
Abbreviation meaning: git update local branch

With this alias you can easily update your local branch with its remote. What this command does is check the name of your local branch and piping that string into the following command: git pull "origin $1" where $1 is the name of your local branch.
