(in-package :asdf-user)

(defsystem "aoc"
  :description "Me doing advent of code"
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/cl-stuff.git")
  :serial t
  :depends-on (:serapeum :alexandria :str :lisp-unit2)
  :components
  ((:module "2023"
    :components
    ((:file "packages")
     (:file "utils")
     (:file "day1")))))
