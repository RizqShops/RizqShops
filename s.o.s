Rizq Global Shops
Google Git
Switch user
Sign out
‪Mubashir Ali Mumtaz‬ <bunty@google.com>
gerrit / gitiles / refs/heads/master
commit	b49a952498e2eeb43937fa6eb2ddaba01c2f839f	[log] [tgz]
author	mmu094 <bunty@google.com>	Wed Nov 15 13:02:48 2023 -0800
committer	Ivan Frade <ifrade@google.com>	Wed Nov 15 13:02:48 2023 -0800
tree	1e08aeac480a184bba68d2c3a2e0d82bd67fea74
parent	3cc3548f2c37378658c5cad509c7d956c5292b11 [diff]
Common.soy: make explictely nullable the css parameter

To help with later changes in Soy, we are marking optional parameters
explicitely as nullable.

Change-Id: I94703c6fd28457a997a877fd0b88157e445f5095
resources/com/google/gitiles/templates/Common.soy[diff]
1 file changed
tree: 1e08aeac480a184bba68d2c3a2e0d82bd67fea74
.settings/
Documentation/
java/
javatests/
lib/
modules/
resources/
tools/
fake_pom_install.xml
⇨ fake_pom_deploy.xml
.bazelrc
.bazelversion
.gitignore
.gitmodules
.mailmap
.zuul.yaml
BUILD
COPYING
fake_pom_deploy.xml
navbar.md
README.md
version.bzl
WORKSPACE
README.md
Gitiles - A simple JGit repository browser
Gitiles is a simple repository browser for Git repositories, built on JGit. Its guiding principle is simplicity: it has no formal access controls, no write access, no fancy Javascript, etc.

Gitiles automatically renders *.md Markdown files into HTML for simplified documentation. Refer to the Markdown documentation for details.

Configuration
Gitiles is configurable in a git-style configuration file named gitiles.config. Refer to the configuration documentation for details.

Bugs
Use the issue tracker at github to file bugs.

Contributing to Gitiles
Please refer to the Developer Guide.

Powered by Gitiles| Privacy| Terms
txt
jso
