# dbt demo

## Talking points

### Writing models

SQL and Jinja

Easy to search in

Easy to integrate with git
GitHub actions to lint and run PR in a separate environment before approval

Easy to learn (given that you know SQL)

Free: dbt-core
Paid: dbt Cloud

### `dbt init`

Creates folders and files needed
Almost all of them, `packages.yml` is not created

### Packages and `dbt deps`

`packages.yml` contains packages needed for the project

`dbt deps` installs packages defined in `packages.yml`

### Defining models

Schemas and tests can be defined in Yaml files. Not necessary.

Can enforce contracts and versioning if wanted/needed

Can define exposures

### Compiling, running, testing and building models

When running several models, dbt creates a DAG (Directed Acyclical Graph) and runs models in correct order.
Need to use `source` and `ref` to get the correct DAG.

`dbt [compile|run|build|test] -s [space separated list of models]`

`compile` compiles and outputs compiled SQL

`run` compiles the model and runs the SQL in the target database

`test` compiles and tests the model

`build` compiles, runs and tests the model

### Documentation and explore

`dbt docs generate` generates `manifest.json` which contains all info about project, models and columns

`dbt docs serve` serves the documentation as web pages

With dbt Cloud, documentation and explore can be viewed there
- Lineage
- Code
- Compiled code
- Column lineage (closed beta)

### dbt Cloud

Orchestration
- Cron schedule
- Completion triggers

Exploration

Statistics

## Other

- When you run dbt Core from the command line, it reads your `dbt_project.yml` file to find the profile name, and then looks for a profile with the same name in your `profiles.yml` file
  - dbt will search the current working directory for the `profiles.yml` file and will default to the `~/.dbt/` directory if not found.
- If you do have multiple targets in your profile, and want to use a target other than the default, you can do this using the `--target` option when issuing a dbt command.

## `profiles.yml`

Usually contained outside the project folder (e.g. `~\.dbt`)

Contains connection information
Authentication methods, for Snowflake, are:
- Username and password
  - Can use environment variables
- Key Pair
- Snowflake OAuth

## Custom schemas

The `schema` in `profiles.yml` is a prefix. When defining `schema` in `dbt_project.yml` that schema will be prefixed with the schema from `profiles.yml` and `_`.
If a model does not have a schema defined in `dbt_project.yml` it will be created in the schema defined in `profile.yml` (e.g. `dev`)

## Granting privileges in Snowflake

Create a user
Create a role
Grant the role to the user
Grant privileges to the role

## References

- [dbt docs](https://docs.getdbt.com/docs/introduction)
- [About profiles.yml](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml)
- [Connection profiles](https://docs.getdbt.com/docs/core/connect-data-platform/connection-profiles)
