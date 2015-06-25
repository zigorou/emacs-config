(setenv "GOPATH" (expand-file-name "~/go"))

;; gocode
(require 'go-autocomplete)
(require 'auto-complete-config)
(add-to-list 'ac-modes 'go-mode)

;;; flycheck
(require 'flycheck)
(add-hook 'go-mode-hook 'flycheck-mode)

;; go-eldoc
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook 'go-mode-hook
          '(lambda()
            (setq c-basic-offset 4)
            (setq indent-tabs-mode t)
            (local-set-key (kbd "M-.") 'godef-jump)
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
            (local-set-key (kbd "C-c i") 'go-goto-imports)
            (local-set-key (kbd "C-c d") 'godoc)))

(add-hook 'before-save-hook 'gofmt-before-save)
