a db2 console with with history and autocomplete support
====================================

DB2 console mode does not support readline and autocomplete, this is a wrapper for the db2 command with support for both.

Install
-------

  $ apt-get install [rlwrap][0]
  $ gem install db2c

Contributing
------------

Once you've made your great commits:

1. [Fork][1] db2c
2. Create a topic branch - `git checkout -b my_branch`
3. Push to your branch - `git push origin my_branch`
4. Create an [Issue][2] with a link to your branch
5. That's it!

Acknowledgement
------------

The initial script was inspired by [defunkt's repl][3], for a genenral purpose repl/wrapper, this is your friend.

Meta
----

* Code: `git clone git://github.com/on-site/db2c.git`
* Home: <https://github.com/on-site/db2c>
* Bugs: <https://github.com/on-site/db2c/issues>
* Gems: <http://rubygems.org/gems/db2c>

Author
------

Samer Abukhait <samer@on-siteNOSPAM.com>, @s4mer

[0]: http://utopia.knoware.nl/~hlub/rlwrap/
[1]: http://help.github.com/forking/
[2]: https://github.com/on-site/db2c/issues
[3]: https://github.com/defunkt/repl
