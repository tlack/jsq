//@generator:jsq

// only lines with q) are filtered
var N=require('net'),Q=require('node-q');
var D1=function(x,y,z){console.log(x); return x;}; D0=function(x,y,z){return x;} // debug
var TE=function(e,x,cb){return function(e,x){if(e)throw e;cb(x);}} //trap errors
var qcon=function(x,y,z){x.ks('.z.pc:{exit 1};online[]');}
var boot=function(x,y,z){D1('jsboot');Q.connect({host:'localhost',port:5999},TE(qcon))};
boot();



