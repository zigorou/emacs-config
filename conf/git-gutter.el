;; https://github.com/syohex/emacs-git-gutter

(require 'git-gutter)

; グローバルマイナーモードとしてON
(global-git-gutter-mode +1)

;; ; キーバインド
;; (global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; ;; Jump to next/previous hunk
;; (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
;; (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; ;; Stage current hunk
;; (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; ;; Revert current hunk
;; (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

; look and feel
(setq git-gutter:separator-sign "|")
(setq git-gutter:modified-sign "=") ;; two space
(setq git-gutter:added-sign "+")    ;; multiple character is OK
(setq git-gutter:deleted-sign "-")

(set-face-foreground 'git-gutter:separator "gray")
(set-face-background 'git-gutter:modified "purple") ;; background color
(set-face-foreground 'git-gutter:added "green")
(set-face-foreground 'git-gutter:deleted "red")

; git diffの呼び出し回数を減らす
(setq git-gutter:update-threshold 2)
(setq git-gutter:update-hooks '(after-save-hook after-revert-hook))

;; Don't need log/message.
(setq git-gutter:verbosity 0)
