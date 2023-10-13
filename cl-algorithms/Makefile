RUN_LISP=sbcl --noinform --non-interactive
LISP=sbcl --noinform

test:
	$(RUN_LISP) --non-interactive --eval '(asdf:test-system :cl-algorithms)'

repl:
	$(LISP)	--eval '(ql:quickload :cl-algorithms)'

.PHONY: test repl
