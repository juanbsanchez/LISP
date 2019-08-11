;;;; hello-world-Web-Application.lisp

(ql:quickload "restas") ;; RESTAS web framework. (Install before quicklisp)

(restas:define-module #:hello-world
    (:use :cl :restas)) ;; RESTAS application live in modules, which are similar to ordinary common lisp packages.

(in-package #:hello-world) ;;Symbols starting with #: are uninterned, meaning they have no package, we just want to use its namestring, which is "HELLO-WORLD". 

(define-route hello-world ("")
    "Hello World") ;; RESTAS apps are based on uri handlers called routes. Routes in their simplest form shown here, have: *A name (hello-world in this case)* An uri template. in this case the empty string "", meaning it will match the / uri * A body generating a response, in this case the string "hello world" returned to the client.

(start '#:hello-world :port 8080) ;; The RESTAS function start is used to initializes a module, and start a hunchentoot web server. As a first argument we give it the symbol naming our module with our application defined in it and pass a port number as a keyword parameter.