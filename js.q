if[not 1=count .z.x;[show "usage: q js.q [file.jsq]";exit 1;]];
c:read0 `$fn:":",.z.x 0;                              /contents
mlidx:where c like\: "q)*";                           /matching lines
ii:{ssr[x;y 0;y 1]}
interp:{
	if[0=type x;:interp each x];
	x ii/ (
	("q)";"var ");
	("::{";"=function(x,y,z){"); ("::(";"=function(");
	("; ::";"; return "); (";::" ;";return ");
	("{ ::" ;"{ return "); ("{::" ;"{return ");
	("::";"="))
	};
j:enlist["//@generator:jsq\n"],@[c;mlidx;interp];
$[`;fno:ssr[fn;".jsq";".js"]] 0: j
show "saved to ",1 _ fno;
exit 0




