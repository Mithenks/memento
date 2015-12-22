NAME
    memento

VERSION
    version 0.7.1

SYNOPSIS
    memento [-OPTIONS [-MORE_OPTIONS]] [--] [PROGRAM_ARG1 ...]

    The following single-character options are accepted: Boolean (without
    arguments): --version --help

DESCRIPTION
    memento is a modular step by step command line tool. By default it
    provides the following commands:

      - features
      - git
      - history
      - paymo
      - redmine
      - schema
      - workflow

    Memento, for each command, provides by default a fallback helper if a
    required argument is missing. For example you can get your last executed
    command via direct input:

      $ memento history last
      memento git status

    or via progressive input:

      $ memento
      Enter the tool name to be used:
      - features
      - git
      - history
      - redmine
      - schema
      - workflow
      » history

      Choose a command:
      - bookmark
      - bookmarks
      - clear
      - exec
      - last
      - list
      - unbookmark
      » last

      memento git status

    If you want to extend Memento with your own tools, put them into
    Memento/Tool directory, with a leading underscore (eg.
    Memento/Tool/_my_awesome_tool). The best tools will be added into
    Memento core tools, so feel free to send us your tool!

INSTALLATION
    Open a terminal and run *./install.pl* inside memento directory. If you
    have permissions problems try to run the same command with *sudo*.

    In order to be able to manage third party perl modules Memento requires
    cpan (http://www.cpan.org/).

FEATURES
    *memento features* allows you to export and import all your tools
    configurations.

    It provides the following operations:

    *export*
      Export configurations of your tools (features). You can choose to
      export all of them or just one by one. By default the export will be
      printed to the standard output. If you want you can save your
      configurations into a file by using ">" as follows:

      `memento features export all > memento_all.cfg'

    *import [--file]*
      Import your features using a previously exported config file. You can
      choose to import all of them or just one by one. Use --file option to
      specify the file path (in direct input mode), otherwise memento will
      remember you to specify it later (progressive input mode):

      `memento features import git --file memento_all.cfg'

GIT
    *memento git* is a configurable tool with the main purpose to help
    developers creating branches, following git-flow-like (but divergent)
    flows. This is not a wrapper around git core features, but just
    something like an extension.

    *memento git* provides the following operations:

    *config*
      Manages Memento Git configurations providing the following operations:

      *init*
        Initialize your git repository storing configurations that will be
        used for branches creation, project name configuration and git hooks
        management.

      *list*
        Lists all Memento Git configurations.

      *delete*
        Delete all Memento Git configurations affecting your current
        repository.

    *root*
      Utitlity command used to show the repository root.

    *start [--source]*
      Creates a new branch starting from the configured source branch. Use
      --source option to override the default one. If during the
      configuration operation, the Issue Tracker support was enabled, you
      will be asked to insert an Issue Id. It will be used to build the new
      branch, following the configured branch pattern. Via the *workflow*
      tool, is possible to create a rule for updating issue status and done
      ratio on git flow start, automatically assigning it to current user,
      and optionally add a comment.

    *finish [--safe]*
      Use this command to merge current branch into the configure
      destination branch. Current branch will also be deleted if the delete
      configuration has been set. If you are not familiar with this command,
      use the --safe option to avoid unwanted behaviors (you will be asked
      to confirm destination and deletion options). Via the *workflow* tool,
      is possible to create a rule for updating issue status and done ratio
      on git flow finish and optionally add a comment.

HISTORY
    Every command executed is logged into the memento history and can be
    bookmarked as a shortcut.

    *memento history* provides the following operations:

    *bookmark*
      Bookmarks a command creating a new shortcut.

    *bookmarks*
      Lists all available bookmarks.

    *clear*
      Clear the command history.

    *exec*
      Executes a command previously logged into the command history.

    *last [--execute]*
      Get last executed command. Use --execute option to execute it.

    *list*
      Lists all commands logged into the command history.

    *unbookmark*
      Deletes a bookmarked command.

PAYMO
    You can easily integrate Memento with multiple instances of Paymo, with
    the *memento paymo config add* command, and switch from one to another
    simply by using the *memento paymo config switch [paymo_api_id]*
    command.

    *memento paymo* provides the following operations:

    *config*
      Manages Paymo API configurations providing the following options:

      *add*
        Adds a new configurations set for a Paymo instance.

      *delete [paymo_api_id]*
        Deletes a configurations set for a Paymo instance.

      *list*
        Lists all Paymo configurations.

      *switch [paymo_api_id]*
        Sets a Paymo instance as the default one. All queries will be
        executed to the default one. Otherwise, you can change on the fly
        the active Paymo instance by using the --api-id option, for each
        memento paymo command.

    *clients*
      Renders a table containing info about all available Paymo clients.

    *projects*
      Renders a table containing info about all available Paymo projects.

    *users*
      Renders a table containing info about all available Paymo users.

    *user*
      Renders a table containing info about current user referring to the
      active api.

REDMINE
    You can easily integrate Memento with multiple instances of Redmine,
    with the *memento redmine config add* command, and switch from one to
    another simply by using the *memento redmine config switch
    [redmine_api_id]* command.

    *memento redmine* provides the following operations:

    *config*
      Manages Redmine API configurations providing the following options:

      *add*
        Adds a new configurations set for a Redmine instance.

      *delete [redmine_api_id]*
        Deletes a configurations set for a Redmine instance.

      *list*
        Lists all Redmine configurations.

      *switch [redmine_api_id]*
        Sets a Redmine instance as the default one. All queries will be
        executed to the default one. Otherwise, you can change on the fly
        the active Redmine instance by using the --api-id option, for each
        memento redmine command.

    *issue [redmine_issue_id [--open]]*
      Shows the details of an issue. If the --open boolean option has been
      provided, the issue will not be rendered, but opened into your default
      web browser.

    *projects*
      Renders a table containing info about all available Redmine projects.

    *queries*
      Renders a table containing info about all available Redmine custom
      queries.

    *query [redmine_query_id]*
      Renders a table containing info about all available Redmine issue
      extracted from the custom query.

    *user*
      Renders a table containing info about current user referring to the
      active api.

SCHEMA
    *memento schema* is the automatic update manager for Memento codebase.

    It provides the following operations:

    *check*
      Check, for code updates automatically, with the frequency specified
      via config.

      Insert *memento schema check* entry into your bash profile in order to
      automatically execute the command whenever you open a new terminal
      window.

    *config*
      Manages Memento schema configurations, allowing user to enable/disable
      automatic updates or to set frequency of update check.

WORKFLOW
    *memento workflow* is the dedicated tool for workflows management.

    It provides the following operations:

    *rules*
      Add, delete and list workflow rules in order to create event driven
      automations.

USAGE
    memento [-OPTIONS [-MORE_OPTIONS]] [--] [PROGRAM_ARG1 ...]

    The following single-character options are accepted: Boolean (without
    arguments): -v -h

    Options may be merged together. -- stops processing of options.

BUGS
    None known as of release, but...

AUTHOR
    Adriano Cori <adriano.cori@bmeme.com>

COPYRIGHT
    Copyright (c) 2015 Adriano Cori. All rights reserved. This program is
    free software; you can redistribute it and/or modify it under the terms
    of the GPL2 license.

    The full text of the license can be found in the LICENSE file included
    with this module.

AUTHOR
    Bonsaimeme S.r.l. <http://www.bmeme.com>

COPYRIGHT AND LICENSE
    This software is Copyright (c) 2105 by Adriano Cori and Bonsaimeme
    S.r.l.

    This is free software, licensed under:

      The GPL2 License

