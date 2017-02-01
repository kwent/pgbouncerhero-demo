# PgBouncerHero-Demo

This is the demo app running on https://pgbouncerhero-demo.herokuapp.com demonstrating the usage of [pgbouncerhero](https://github.com/kwent/pgbouncerhero).

## Installation

### One PgBouncer

```bash
export PGBOUNCERHERO_DATABASE_URL=postgres://user:password@host:port/pgbouncer
```

### Multiple PgBouncers

Create `config/pgbouncerhero.yml` with:

```yml
default: &default
  pgbouncers:
    production:
      master:
        url: <%= ENV["PGBOUNCER_MASTER_DATABASE_URL"] %>
      slave:
        url: <%= ENV["PGBOUNCER_SLAVE_DATABASE_URL"] %>

development:
  <<: *default

production:
  <<: *default
```

## Heroku

This demo app is using following buildpacks:

```bash
# You need to fork your own to set the allow your database username to access pgbouncer database.
heroku buildpacks:add https://github.com/kwent/heroku-buildpack-pgbouncer
# Regular ruby buildpack
heroku buildpacks:add https://github.com/heroku/heroku-buildpack-ruby
```

and config:

```bash
heroku config:set PGBOUNCER_PREPARED_STATEMENTS=false
heroku config:set PGBOUNCERHERO_DATABASE_URL=postgres://user:password@127.0.0.1:6000/pgbouncer
```

# Authors

- [Quentin Rousseau](https://github.com/kwent)

# License

```plain
Copyright (c) 2017 Quentin Rousseau <contact@quent.in>

MIT License

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```
