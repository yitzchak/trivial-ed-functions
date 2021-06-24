# trivial-ed-functions

A compatibility layer for the `ED` hook extensions of various Common Lisp
implementations.

## Usage

The main export is `trivial-ed-functions:*ed-functions*` which is a list of
hook functions. If supported by the current lisp implementation then functions
from the list `trivial-ed-functions:*ed-functions*` are called in order by
`cl:ed` with `X` as an argument until one of them returns non-`nil`; these 
functions are responsible for signalling a `file-error` to indicate failure to 
perform an operation on the file system.

If the current implementation supports `*ed-functions*` then `:ed-functions`
will be present in `*features*`. If the current implementation does not support
`*ed-functions*` then it is still safe to add a function to the list, but this
function will never be invoked.

## Supported Implementations

Recent versions of ABCL, ACL, CCL, CLASP, ECL, Mezzano, and SBCL all support
`*ed-functions*` in some way. ABCL, CLASP, ECL, and SBCL include native support. 
ACL, CCL, and Mezzano support a single hook function, not a list
of functions. In this case, a hook function is automatically installed that
emulates the behavior of `*ed-functions*`.
