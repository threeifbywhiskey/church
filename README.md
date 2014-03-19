# Church

[![Gem Version](https://badge.fury.io/rb/church.png)](http://badge.fury.io/rb/church)
[![Build Status](https://travis-ci.org/threeifbywhiskey/church.png?branch=master)](https://travis-ci.org/threeifbywhiskey/church)


**Church** is a module that wraps a bunch of constant Procs that do various functional programming tricks.

### Examples

``` ruby
MAP[[1, 2, 3], &-> c { c * 2 }]
```

``` ruby
EACH[[1, 2, 3], &-> e { p e } ]
```

### Why?

The point of writing everything using Procs, for me at least, is to eventually transform programs into [non-alphanumeric](https://threeifbywhiskey.github.io/2014/03/05/non-alphanumeric-ruby-for-fun-and-not-much-else/) versions of themselves. Church's design goal is to make that an easier process.
