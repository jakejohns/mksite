# mksite - static site generator

Generate a static website with [make][make] and [pandoc][pandoc].

`mksite` can also:

- sign the generated html documents with [gpg][gpg],
- compile css with [sassc][sassc],
- deploy the site with [rsync][rsync]
- serve generated site with either php or python

## Usage

```

# generate all html files, signatures, and css
$ make

# deploy
$ make deploy REMOTE=host:./www

# get help
$ make help
```

## Config

Edit `Makefile` and only include the tasks you want to do. For example, if you
don't want to sign the html files, don't include `sign-html.mk`. You can also
edit `config/make/config.mk` and override settings and set a value for the
`REMOTE` variable if you want to use `make deploy` without setting it on the
command line. Include one of `config/make/serve-{php,python}.mk` and `make
serve` will use built-in web server of the selected language.


[make]: https://www.gnu.org/software/make/
[pandoc]: https://pandoc.org/
[gpg]: https://gnupg.org/
[sassc]: https://github.com/sass/sassc
[rsync]: https://rsync.samba.org/
