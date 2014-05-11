;; load-path
(add-to-list 'load-path (concat user-emacs-directory "/elisp"))

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; ヴィジュアルベル無効
(setq visible-bell nil)

;; ビープ音も無効
(setq ring-bell-function '(lambda ()))

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; バックアップしない
(setq make-backup-files nil)

;; 自動保存したファイルを削除する
(setq delete-auto-save-files t)

;; 自動セーブしない
(setq auto-save-default nil)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)
;; タブ幅は4
(setq-default tab-width 4)

;; C-hでバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; 透明度
(modify-frame-parameters (selected-frame) '((alpha  . 95)))

;; フリンジ(左右の折り返し表示領域)はいらない
(fringe-mode 0)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; % で対応する括弧に移動
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))
(define-key global-map (kbd "%") 'match-paren)

;; 色つける
(require 'font-lock)
(global-font-lock-mode t)
(setq-default transient-mark-mode t)

;; utf-8優先
(prefer-coding-system 'utf-8)

;; 一行ずつスクロール
(setq scroll-step 1)

;; 縦分割とかでも行を折り返す
(setq truncate-partial-width-windows nil)
;; 折り返しトグル
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; recenf-mode
(recentf-mode t)

;; C-t でother-window、分割されてなかったら分割
(defun other-window-or-split () ; http://d.hatena.ne.jp/rubikitch/20100210/emacs
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(define-key global-map (kbd "C-t") 'other-window-or-split)

;; M-i でdabbrev
(define-key global-map (kbd "M-i") 'dabbrev-expand)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; カーソル点滅しないように
(blink-cursor-mode 0)

;; local-variables safe なのは自動で適用
(setq enable-local-variables :safe)

;; start server
(require 'server)
(unless (server-running-p)
  (server-start))

; emacsclient で Buffer `hogehoge' still has clients; kill it? (yes or no) とかいわれるのがうざいのをなおす
; http://aki.issp.u-tokyo.ac.jp/itoh/hiChangeLog/html/2007-04.html#2007-04-09-1
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; C-x k は current-buffer 専用にしちゃう
(defun kill-current-buffer ()
  (interactive)
  (kill-buffer))
(define-key global-map (kbd "C-x k") 'kill-current-buffer)

;; orgとかで日付が日本語になると変なのでこうしちゃう
(setq system-time-locale "C")

;;; cocoa-* だと最後によみこまれて、helmとかのキーもきえてしまうので、C-zの無効はここでやる
;(if (or (equal window-system 'ns) (equal window-system 'mac))
;    (define-key global-map (kbd "C-z") nil))

