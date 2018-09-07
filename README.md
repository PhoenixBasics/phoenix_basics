# Basics

This is an example app built to demonstrate the app built during the ElixirConf
Phoenix Basics class.  This version does not follow the instructions covered
during the class. Instead it's intended as a way to show an approach to build the
app in a manner a little closer to how we'd approach a build in the real world.

I tried to keep my use of Elixir simplified. That said this version adds tests,
mix aliases, credo for linting, and a few other new concepts. The commit history
on the project shows the generators I used and should generally give a good idea
for how I approached writing my code.

## S3 integration

Change `config :arc, bucket: "bucket_name"` in dev config as well as `config :arc, bucket: "fawkesapp-test"` in test config to refer to your S3 buckets.

I highly recommend faking S3 during tests: https://github.com/jubos/fake-s3

You will also need `dev.secret.exs` and text.secret.exs config files.  These
files should contain:

```
config :ex_aws,
  access_key_id: ["key_id", :instance_role],
  secret_access_key: ["secret_key", :instance_role]
```

Where key_id is you AWS IAM user's key_id
and where secret_key is you AWS IAM user's secret_key

(this user should have s3-admin rights)

## With that done...

To start your the Phoenix Basics app:

  * Install dependencies with `mix deps.get`
  * Ensure postgres credentials are correct in your env config
  * [PROD] be sure to set the GUARDIAN_KEY env var
  * Create and migrate your database with `mix ecto.reset`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

