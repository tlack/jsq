# Q-Flavored Javascript Preprocessor

Use this handy filter to vomit 25% less often while writing Javascript. 

I am distrustful of the newer JS standards and this lets me avoid learning
(parts of) them for as long as possible.

# status

just a bunch of search and replace filters, really rough

# example

Input Q-flavored JS (jsq):
```
// only lines with q) are filtered
q)N::require('net'),Q::require('node-q');
q)D1::{console.log(x); ::x;}; D0::{::x;} // debug
q)TE::(e,x,cb){return function(e,x){if(e)throw e;cb(x);}} //trap errors
q)qcon::{x.ks('.z.pc:{exit 1};online[]');}
q)boot::{D1('jsboot');Q.connect({host:'localhost',port:5999},TE(qcon))};
boot();
```
Output vanilla flavored JS:
```
//@generator:jsq
// only lines with q) are filtered
var N=require('net'),Q=require('node-q');
var D1=function(x,y,z){console.log(x); return x;}; D0=function(x,y,z){return x;} // debug
var TE=function(e,x,cb){return function(e,x){if(e)throw e;cb(x);}} //trap errors
var qcon=function(x,y,z){x.ks('.z.pc:{exit 1};online[]');}
var boot=function(x,y,z){D1('jsboot');Q.connect({host:'localhost',port:5999},TE(qcon))};
boot();
```

# features

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

Also comes with vim syntax config for jsq.

# use

```$ q js.q myfile.jsq```

# tbd/future

`q js.q myfile lib run ipc`:

lib.jsq /each(left|right|both) over scan exhaust

ipc.jsq /auto-ipc link to/from host kdb server - tbd

run.jsq /automatically start node and run code then exit q repl

net.jsq /tick? workers?

# discuss

http://t.me/qkdbfans

