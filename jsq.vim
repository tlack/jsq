" Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/javascript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2006 Jun 19

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet javaScript_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'jsq'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("jsq_fold")
  unlet jsq_fold
endif

syn case ignore


syn keyword jsqCommentTodo      TODO FIXME XXX TBD contained
syn match   jsqLineComment      "\/\/.*" contains=@Spell,jsqCommentTodo
syn match   jsqCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  jsqComment	       start="/\*"  end="\*/" contains=@Spell,jsqCommentTodo
syn match   jsqSpecial	       "\\\d\d\d\|\\."
syn region  jsqStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=jsqSpecial,@htmlPreproc
syn region  jsqStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=jsqSpecial,@htmlPreproc

syn match   jsqSpecialCharacter "'\\.'"
syn match   jsqNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn match   jsqOperator         "::" 
syn match   jsqOperator         "q)" 
syn region  jsqRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword jsqConditional	if else switch
syn keyword jsqRepeat		while for do in
syn keyword jsqBranch		break continue
syn keyword jsqOperator		new delete instanceof typeof
syn keyword jsqType		Array Boolean Date Function Number Object String RegExp
syn keyword jsqStatement	return with
syn keyword jsqBoolean		true false
syn keyword jsqNull		null undefined
syn keyword jsqIdentifier	arguments this var
syn keyword jsqLabel		case default
syn keyword jsqException		try catch finally throw
syn keyword jsqMessage		alert confirm prompt status
syn keyword jsqGlobal		self window top parent
syn keyword jsqMember		document event location 
syn keyword jsqDeprecated	escape unescape
syn keyword jsqReserved		abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

if exists("jsq_fold")
    syn match	jsqFunction      "\<function\>"
    syn region	jsqFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match jsqSync	grouphere jsqFunctionFold "\<function\>"
    syn sync match jsqSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword	jsqFunction      function
    syn match	jsqBraces	   "[{}\[\]]"
    syn match	jsqParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "jsq"
  syn sync ccomment jsqComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_jsq_syn_inits")
  if version < 508
    let did_jsq_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink jsqComment		Comment
  HiLink jsqLineComment		Comment
  HiLink jsqCommentTodo		Todo
  HiLink jsqSpecial		Special
  HiLink jsqStringS		String
  HiLink jsqStringD		String
  HiLink jsqCharacter		Character
  HiLink jsqSpecialCharacter	jsqSpecial
  HiLink jsqNumber		jsqValue
  HiLink jsqConditional		Conditional
  HiLink jsqRepeat		Repeat
  HiLink jsqBranch		Conditional
  HiLink jsqOperator		Operator
  HiLink jsqType			Type
  HiLink jsqStatement		Statement
  HiLink jsqFunction		Function
  HiLink jsqBraces		Function
  HiLink jsqError		Error
  HiLink javaScrParenError		jsqError
  HiLink jsqNull			Keyword
  HiLink jsqBoolean		Boolean
  HiLink jsqRegexpString		String

  HiLink jsqIdentifier		Identifier
  HiLink jsqLabel		Label
  HiLink jsqException		Exception
  HiLink jsqMessage		Keyword
  HiLink jsqGlobal		Keyword
  HiLink jsqMember		Keyword
  HiLink jsqDeprecated		Exception 
  HiLink jsqReserved		Keyword
  HiLink jsqDebug		Debug
  HiLink jsqConstant		Label

  delcommand HiLink
endif

let b:current_syntax = "jsq"
if main_syntax == 'jsq'
  unlet main_syntax
endif

" vim: ts=8
