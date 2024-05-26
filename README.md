# dbt fagkveld

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
