## DB2 console with history, autocomplete support and few other goodies

DB2 console mode does not support readline and autocomplete, this is a wrapper for the db2 command mode that adds support for both.
It also tries to make using db2 a little bit more tolerable, adding support for interactive editing and psql-like meta commands and other shortcuts.

### Install

```
apt-get install rlwrap
gem install db2c
```

### Examples

```
db2 => use testdb
db2(testdb) => current date
db2(testdb) => -107
db2(testdb) => history
db2(testdb) => select * from table.with.many.columns | less -S
db2(testdb) => edit
db2(testdb) => ls ~
db2(testdb) => irb
db2(testdb) => \l
db2(testdb) => \lt schema
db2(testdb) => \dv | grep -v SYS
db2(testdb) => \d schema.table
db2(testdb) => help
```

### Acknowledgement

* Chris Jester-Young ([CKY][0]) found out the problem of using shell metacharacters when executing commands from Ruby.
* The initial script was inspired by [defunkt's repl][1], for a genenral purpose repl/wrapper, this is your friend.
* Ben Ellis ([benissimo][2]) did all the beta testing

### See

* rlwrap: <http://utopia.knoware.nl/~hlub/rlwrap/>
* Gem: <http://rubygems.org/gems/db2c>
* Help page: <https://github.com/on-site/db2c/wiki/db2c-help>

[0]: https://github.com/cky
[1]: https://github.com/defunkt/repl
[2]: https://github.com/benissimo
