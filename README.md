[semaphore]: https://semaphoreci.com/includebraga/secret_santa
<!--
[errors]: https://example.org
[logs]: https://example.org
-->

Secret Santa
============

[![Build Status](https://semaphoreci.com/api/v1/includebraga/secret_santa/branches/master/badge.svg)][semaphore]
<!--
[![Error Tracker](https://img.shields.io/badge/sentry-errors-blue.svg?style=flat-square)][errors]
[![Production Logs](https://img.shields.io/badge/logs-production-blue.svg?style=flat-square)][logs]
-->

Secret Santa is a surprise for this Christmas. It's a secret. It's also a santa. \*You\* are also a santa.

**Table of Contents**

* [Contributing](#contributing)
* [Setup](#setup)
* [Deploys](#deploys)

Contributing
------------

Everyone is welcome to contribute. If you found a bug, please report it in the [issues page](https://github.com/includebraga/secret_santa/issues). After reporting it, you are free to make a pull request to fix it.

Please be aware that this project follows a set of rules and recommendations described in the [CONTRIBUTING.md](https://github.com/includebraga/secret_santa/blob/master/CONTRIBUTING.md).

There is a public roadmap available on our [Trello][trello] board which is constantly updated. Feel free to try and implement features described there.

## Setup

We use scripts for pretty much everything. To clone and setup the project, use `bin/setup`:

```
git clone git@github.com:includebraga/secret_santa.git
cd secret_santa
bin/setup
```

To start the development server run:

```
bin/server
```

This will start the Rails application.

## Deploys

Deploys are run through [Semaphore][semaphore]. They are deployed automatically to staging when the build on master is green and manually to production.

You can also add `production` and `staging` remotes to manage it through the Heroku CLI. We recommend using [`parity`](https://github.com/thoughtbot/parity) to manage it.

```shell
git remote add production <production_git_url>

# deploying with parity:
production deploy

# deploying through git:
git push production master
```
