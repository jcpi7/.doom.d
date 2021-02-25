;;; init.el -*- lexical-binding: t; -*-

(doom! :completion company ivy

       :ui
       doom
       doom-dashboard
       (modeline)
       hl-todo
       (popup +all +defaults)
       workspaces
       window-select

       :editor
       (evil +everywhere) ; come to the dark side, we have cookies
       snippets           ; TODO setup
       rotate-text
       file-templates

       :emacs
       (dired +ranger)
       (undo +tree)
       electric ibuffer vc

       :term
       eshell vterm

       :os tty

       :tools
       ; Stuff I use
       (eval +overlay)   ; run code, run (also, repls)
       (lookup +docsets) ; TODO Configure lookup for nixos
       magit             ; a git porcelain for Emacs
       pass              ; password manager for nerds
       direnv

       :checkers
       syntax

       :lang
       sh nix

       ; Emacs stuff to keep in mind
       emacs-lisp
       (org +pandoc +roam)
       markdown          ; writing docs for people to ignore
       data              ; config/data formats

       :email
       (mu4e +gmail)

       :app
       (rss +org)        ; emacs as an RSS reader
       irc

       :config
       (default +bindings +smartparens))
