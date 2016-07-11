Alt-Tab for command line directory manipulation.
```sh
test $ dirs # to check the stack
/tmp/test
test $ pushd foo # push foo to top of stack
/tmp/test/foo /tmp/test
foo $ pushd ../bar/
/tmp/test/bar /tmp/test/foo /tmp/test
bar $ dirs
/tmp/test/bar /tmp/test/foo /tmp/test
bar $ dirs -p # to list per line.
/tmp/test/bar
/tmp/test/foo
/tmp/test
bar $ pushd # swap top two
/tmp/test/foo /tmp/test/bar /tmp/test
foo $ pushd # swaps back
/tmp/test/bar /tmp/test/foo /tmp/test
bar $ popd # to remove
/tmp/test/foo /tmp/test
foo $ pushd ../baz/
/tmp/test/baz /tmp/test/foo /tmp/test
baz $ pushd ../bar/
/tmp/test/bar /tmp/test/baz /tmp/test/foo /tmp/test
bar $ pushd +2 # go to 3rd in stack; rotate the stack
/tmp/test/foo /tmp/test /tmp/test/bar /tmp/test/baz
foo $ dirs -p
/tmp/test/foo
/tmp/test
/tmp/test/bar
/tmp/test/baz
foo $ pushd -1 # go to bottom. ofcourse this rotates stack
/tmp/test/bar /tmp/test/baz /tmp/test/foo /tmp/test
bar $ dirs -c # to clear stack
bar $ dirs
/tmp/test/bar
```

Source: https://www.gnu.org/software/bash/manual/html_node/Directory-Stack-Builtins.html
