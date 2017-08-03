" HEADER: -h
" Class: tempclass
" Author: lymslive
" Description: VimL class frame
" Create: 2017-02-10
" Modify: 2017-08-03

"LOAD: -l
if exists('s:load') && !exists('g:DEBUG')
    finish
endif

" CLASS:
let s:class = class#old()
let s:class._name_ = 'tempclass'
let s:class._version_ = 1

function! tempclass#class() abort "{{{
    return s:class
endfunction "}}}

" NEW: -n
function! tempclass#new(...) abort "{{{
    let l:obj = class#new(s:class, a:000)
    return l:obj
endfunction "}}}
" CTOR: -c
function! tempclass#ctor(this, ...) abort "{{{
endfunction "}}}

" DECTOR: -D
function! tempclass#dector(this) abort "{{{
endfunction "}}}

" OLD: -O
function! tempclass#old() abort "{{{
    let l:class = class#old(s:class)
    return l:class
endfunction "}}}

" MASTER: -M
function! tempclass#master(that) abort "{{{
    call class#extend(a:that, s:class, class#master)
endfunction "}}}

" FATHER: -F
function! tempclass#father(that) abort "{{{
    call class#extend(a:that, s:class, class#father)
endfunction "}}}

" ISOBJECT: -s
function! tempclass#isobject(that) abort "{{{
    return class#isobject(s:class, a:that)
endfunction "}}}

" ISA: -S
function! tempclass#isa(that) abort "{{{
    return class#isa(s:class, a:that)
endfunction "}}}

" INSTANCE: -I
" let s:instance = {}
function! tempclass#instance() abort "{{{
    if !exists(s:instance)
        let s:instance = class#new(s:class)
    endif
    return s:instance
endfunction "}}}

" CONVERSION: -X
function! s:class.string() dict abort "{{{
    return self._class_._name_
endfunction "}}}
function! s:class.number() dict abort "{{{
    return self._class_._version_
endfunction "}}}

" VIEW: -V
function! s:class.disp() dict abort "{{{
    echo self.string() . ':' . self.number()
endfunction "}}}

" IMPORT: -Z
function! tempclass#import() abort "{{{
    let l:class = {}
    let l:class.class = s:class
    let l:class.new = function('tempclass#new')
    return l:class
endfunction "}}}

" LOAD: -l
let s:load = 1
function! tempclass#load(...) abort "{{{
    if a:0 > 0 && !empty(a:1)
        unlet! s:load
    endif
endfunction "}}}

" TEST: -t
function! tempclass#test(...) abort "{{{
    let l:obj = tempclass#new()
    call l:obj.disp()
    return 0
endfunction "}}}
