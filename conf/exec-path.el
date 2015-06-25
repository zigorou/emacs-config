(setq shell-file-name "/bin/sh")

(let*
    ((path (list "~/.plenv/shims"
                 "~/.rbenv/shims"
                 "~/go/bin")))
  (dolist (p path)
    (add-to-list 'exec-path (expand-file-name p))
    (setenv "PATH" (concat (expand-file-name p) ":" (getenv "PATH")))))


