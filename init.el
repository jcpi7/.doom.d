;;; init.el -*- lexical-binding: t; -*-

(doom! :completion company ivy

       :ui
       doom doom-dashboard (modeline +light)
       nav-flash ophints hl-todo
       (popup +all +defaults) workspaces
       treemacs vc-gutter window-select

       :editor
       (evil +everywhere) ; come to the dark side, we have cookies
       snippets           ; my elves. They type so I don't have to
       rotate-text        ; cycle region at point between text candidates
       file-templates     ; auto-snippets for empty files

       :emacs
       (dired +ranger)
       (undo +tree)
       electric ibuffer vc

       :term
       eshell vterm

       :tools
       ; Stuff I use
       (eval +overlay)   ; run code, run (also, repls)
       (lookup +docsets) ; TODO Configure lookup for nixos
       magit             ; a git porcelain for Emacs
       pass              ; password manager for nerds

       :checkers
       syntax

       :lang
       sh nix

       ; Emacs stuff to keep in mind
       emacs-lisp
       (org +gnuplot +dragndrop +pandoc +present +roam)
       markdown          ; writing docs for people to ignore
       data              ; config/data formats

       :email
       (mu4e +gmail)

       :app
       (rss +org)        ; emacs as an RSS reader
       irc

       :config
       (default +bindings +smartparens))
