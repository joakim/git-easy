# Gitano

Smart git commands to make life a little bit easier.

Inspired by [Legit](http://www.git-legit.org/) which in turn was inspired by [GitHub for Mac](https://mac.github.com/). Complements [git-extras](https://github.com/visionmedia/git-extras) and [gh](http://owenou.com/gh/).

## Installation

Clone / Tarball:

```bash
$ make install
```

One-liner:

```bash
$ (cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && sudo make install)
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

### git start [branch]

Creates a new branch off of the current branch and switches to it.

```bash
$ git start my-branch
$ git start feature fancy-stuff
```

### git finish [branch]

Merges a branch into the mainline (`master` by default) and deletes/unpublishes it. Asks for confirmation before doing so. It creates a merge bubble by default, which can be changed to a rebase using `git config gitano.finishmethod "rebase"`.

```bash
$ git finish my-branch
$ git finish feature fancy-stuff
```

### git sync

Syncronizes the current branch. Stashes any local changes, fetches and rebases remote changes, and unstashes. Prevents merge bubbles. If you [do like bubbles](https://blog.glyphobet.net/essay/2504), change to normal merge using `git config gitano.syncmethod "merge"`.

```bash
$ git sync
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

Wherever `branch` is an argument, one can either specify a direct branch name, e.g. `fancy-branch`. Or one can specify a branch within a group as two arguments, e.g. `features new-stuff` resulting in the branch `features/new-stuff`. This feels just as nice as the number of milliseconds saved when typing the command – try it!

```bash
$ git start feature fun-experiment
$ git switch bug nasty-bug
$ git finish
```

As the last example shows, all commands except `git start` assume the current branch if none is specified, in this case the branch `bug/nasty-bug` would be finished off.

Grouping you branches makes for a tidy branch structure in both the terminal and some UI applications for Git:

![Branches displayed as a directory structure](https://s3.amazonaws.com/f.cl.ly/items/1037020o2r322P320c1Z/Image%202014-04-28%20at%2011.44.38%20PM.png)


## Configuration

Configuration values may be set using the `git config` command, e.g. `git config gitano.mainline "production"`.

### gitano.mainline

The branch which branches are merged into when finished. Defaults to `master`.

### gitano.finishmethod

The merge method used when finishing branches. Defaults to `merge`, as in clearly visible merge bubbles.

### gitano.syncmethod

The merge method used when syncing branches. Defaults to `rebase`, as in a tidy linear history. ([Which to use?](http://blog.sourcetreeapp.com/2012/08/21/merge-or-rebase/))
