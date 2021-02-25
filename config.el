;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t
      tab-width 4)

;; Some themes just don't play well in terminal mode.
;; FIXME This also disables themes in gui frames under emacs-daemon
(when window-system
    (setq doom-theme 'doom-tomorrow-night
          doom-font (font-spec :family "Inconsolata Nerd Font Mono"
                               :size 14)))


(after! eww (setq eww-download-directory "~/usr/tmp")) ;; RESEARCH Consider implementing a 'quickswitch' from desktop to mobile

(after! ranger
  (map! :map ranger-normal-mode-map
        "."  #'ranger-toggle-dotfiles))

(pushnew! +lookup-provider-url-alist
          '("Gitlab"     "https://gitlab.com/explore?name=%s&sort=latest_activity_desc")
          '("IETF RFCs"  "https://www.rfc-editor.org/search/rfc_search_detail.php?title=%s"))

(when (featurep! :tools lookup +docsets)
  (setq +lookup-open-url-fn #'eww)
  (set-docsets! '(python-mode) "Python 3")
  (set-docsets! 'c-mode "C")
  (set-docsets! 'sh-mode "Bash"))

(after! em-term ;;RESEARCH Can't use "eshell" or else this block will load on elisp startup hook ?
  (pushnew! eshell-visual-commands "nnn" "htop" "mpv" "tmux"))

;; Programming

(setq! projectile-project-search-path '("~/src" "~/cfg"))

(setq-hook! '(python-mode rust-mode sh-mode) ;; Prefer tab characters
           indent-tabs-mode t)

;; Org-mode Stuff
(when (featurep! :lang org) (setq org-directory "~/usr/org/"))

(after! org
  (setq! +org-capture-todo-file "todo.org"
         +org-capture-notes-file "notes.org"
         org-log-done 'time))

(setq-hook! 'org-mode-hook org-indent-mode nil)

(after! org-roam
  (setq! org-roam-directory (concat org-directory "roam/")
         org-roam-db-location (concat org-roam-directory "org-roam.db")))

(when (featurep! :lang (org +roam))
  (map! :leader
        :n "n f" #'org-roam-find-file
        :n "n c" #'org-roam-capture
        :n "n i" #'org-roam-insert))

;; Secrets
;; Features dependent on data that can't be public are loaded in separate files.
(load! "secrets/creds" nil t)
(when (featurep! :app rss) (setq elfeed-feeds '()) (load! "secrets/feeds" nil t))
(when (featurep! :app irc) (load! "secrets/irc" nil t))
(when (featurep! :email)   (load! "secrets/mail" nil t))

(provide 'config)
;;; config.el ends here
