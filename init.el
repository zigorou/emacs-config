
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let* (
       (user-emacs-directory (substring (or load-file-name "~/.emacs.d/init.el") 0 -7))
       (conf-list (list
                   "init.el"
                   "exec-path.el"
                   "el-get.el"
                   ;; "cperl-mode.el"
                   ;; "flymake.el"
                   ;; "adoc-mode.el"
                   ;; "cc-mode.el"
                   ;; "clang-complete.el"
                   ;; "go-mode.el"
                   ;; "json-mode.el"
                   ;; "plantuml-mode.el"
                   ;; "markdown-mode.el"
                   ;; "git-gutter.el"
		   )))
  (progn (dolist (conf conf-list)
	   (load (concat user-emacs-directory "conf/" conf)))
	 (and (or (equal window-system 'ns) (equal window-system 'mac))
	      (dolist (conf (list "cocoa-init.el"
                              "cocoa-el-get.el"
                              "cocoa-theme.el"
                              "cocoa-font.el"
                              "cocoa-server.el"
                         ))
		(load (concat user-emacs-directory "conf/" conf))))
	 (and (null window-system)
	      (dolist (conf (list "nw-init.el"))
		(load (concat user-emacs-directory "conf/" conf)))))
)
