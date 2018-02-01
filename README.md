# Q-Flavored Javascript Preprocessor

Use this handy filter to vomit 25% less often while writing Javascript.

I am distrustful of the newer JS standards and this lets me avoid learning
(parts of) them for as long as possible.

# status

just a bunch of search and replace filters, really rough

# features

This thing is really rough right now.

Only lines beginning with q) are interpreted.

All of the behavior right now relies on overloading `::`, a meaningless Javascript construct (I think?), which we take to
serve the purpose of `:` in Q.

To define a variable:

```q)X::1```

A function with arguments:

```q)F::(x,y,z){return x*y+z}```

A function with unnamed arguments - these are called x, y, and z by default:

```q)F::{return x*y+z}```

Return something from a function without all that `return` cruft:

```q)F::{:: x*y*z}```

# use

```$ q js.q myfile.jsq```


