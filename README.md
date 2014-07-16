Natural Rename
==============

Why?
----

http://blog.codinghorror.com/sorting-for-humans-natural-sort-order/

Occasionally you may have the misfortune of having to work around certain systems or applications using ASCII ordering
in order to preserving natural file name ordering for consumption by that system.

For example, exported image files from a presentation (Slide01, Slide02 ... Slide 50 etc) for use in a digital
signage system which uses ASCII order to determine display order.

Uses the [naturally](https://github.com/dogweather/naturally/) to perform the sorting.

Installation
------------
1. Build natural_rename

        $ gem build natural_rename.gemspec

2. Install natural_rename and runtime dependencies

        $ bundle install

Testing
-------

Uses Fakefs to stub the filesystem and perform IO in memory instead of littering the fs with test files.

1. Run the specs

        $ bundle exec rspec --color

There is currently only a slide themed spec but all the heavy lifting in terms of sorting is done by the Naturally
gem which has a fairly comprehensive set of specs anyway.
