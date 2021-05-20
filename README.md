# MySQL GitHub Action

This GitHub action allows you to set up a MySQL instance via Docker.

## Features

* Specify MySQL version
* Specify initial database
* Specify ports
* Specify root password or username/password
* Specify character set
* Specify collation
* Specify sql-mode

## Usage

```yaml
# ...
    steps:
    - name: Set up MySQL
      uses: cweinberger/github-actions-mysql@1.0.0
      with:
        version: 5.7 # Optional, default version is `latest`
        hostPort: 33069 # Optional, default host port is `3306`
        containerPort: 3306 # Optional, default container port is `3306`
        rootPassword: # Required
        characterSet: utf8mb4 # Optional, default is `utf8mb4`
        collation: utf8mb4_general_ci # Optional, default is `utf8mb4_general_ci`
        sqlMode: NO_ENGINE_SUBSTITUTION # Optional, default is `empty`
# ...
```

## Other

This action is inspired by https://github.com/mirromutth/mysql-action (@mirromutth)
