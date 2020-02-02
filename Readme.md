# Gitano

Smart git commands to make life a little bit easier.

Inspired by [Legit](https://frostming.github.io/legit/) which in turn was inspired by [GitHub for Mac](https://mac.github.com/). Works great with [the GitHub Flow](https://guides.github.com/introduction/flow/index.html) and complements [git-extras](https://github.com/tj/git-extras) and [gh](https://github.com/node-gh/gh).


## Installation

Clone / Tarball:

```bash
$ make install
```

One-liner:

```bash
$ (cd /tmp && git clone --depth 1 https://github.com/joakim/gitano.git && cd gitano && sudo make install)
```


## Commands

### git branches

Pretty list of branches + publication status (coming).

### git switch &lt;branch&gt;

Switches to a branch. Stashes any uncommitted changes before switching, restores when switching back.

```bash
$ git switch my-branch
$ git switch feature fancy-stuff
```

### git sync

Synchronizes the current branch. Stashes any local changes, fetches and rebases remote changes, and unstashes. Prevents merge bubbles by default. If you [do like bubbles](https://www.youtube.com/watch?v=ludEngkwMu8), see [Configuration](#configuration) for how to use normal merging.

```bash
$ git sync
```

### git start [branch]

Creates a new branch off of the current branch and switches to it.

```bash
$ git start my-branch
$ git start feature fancy-stuff
```

### git finish [branch]

Merges a branch into the mainline (`master` by default) and deletes/unpublishes it. Asks for confirmation before doing so. It creates a merge bubble by default, see [Configuration](#configuration) for how to use a rebase instead.

```bash
$ git finish my-branch
$ git finish feature fancy-stuff
```

### git publish [branch]

Publishes a branch to remote server.

```bash
$ git publish my-branch
$ git publish feature fancy-stuff
```

### git unpublish [branch]

Removes a branch from remote server.

```bash
$ git unpublish my-branch
$ git unpublish feature fancy-stuff
```


## Tricks

Wherever `branch` is an argument, one can either specify a direct branch name, e.g. `fancy-branch`. Or one can specify a branch within a group as two arguments, e.g. `feature new-stuff` resulting in the branch `feature/new-stuff`. This feels just as nice as the number of milliseconds saved when typing the command – try it!

```bash
$ git start feature fun-experiment
Switched to a new branch 'feature/fun-experiment'
$ git switch bug nasty-bug
Switched to branch 'bug/nasty-bug'
$ git finish
This will merge 'bug/nasty-bug' into 'master' and delete/unpublish 'bug/nasty-bug'. Do you want to do this (y/n)? y
Branch 'bug/nasty-bug' merged into 'master' and deleted
```

The structure of all branch related commands is always `git verb (group) branch-name`, which even makes grammatical sense ("start the feature fun-experiment").

Grouping you branches also makes for a tidy branch structure in both the terminal and certain UI applications:

![Branches displayed as a directory structure](https://s3.amazonaws.com/f.cl.ly/items/1037020o2r322P320c1Z/Image%202014-04-28%20at%2011.44.38%20PM.png)

As the last command in the example above shows, all commands taking `branch` as an argument (except `git start`) assume the current branch if none is specified.


## Configuration

Configuration values are set using the `git config` command, e.g. `git config gitano.mainline "production"`.

### gitano.mainline

The branch which branches are merged into when finished. Defaults to `master`.

### gitano.finishmethod

The merge method used when finishing branches. Defaults to `merge`, as in clearly visible merge bubbles.

### gitano.syncmethod

The merge method used when syncing branches. Defaults to `rebase`, as in a tidy linear history. ([Which to use?](http://blog.sourcetreeapp.com/2012/08/21/merge-or-rebase/))
