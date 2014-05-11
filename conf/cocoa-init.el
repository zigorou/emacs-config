;; custom-file
;; (setq custom-file (concat user-emacs-directory "conf/cocoa-customize.el"))
;; (load custom-file)

;; tool-bar off
(tool-bar-mode 0)

;; scroll-bar off
(scroll-bar-mode 0)

;; metaキーを入れ替える
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; full screen toggle
(define-key global-map (kbd "M-RET") 'ns-toggle-fullscreen)

;; 関連づけなどからファイルを開く場合に新規ウィンドウを開かない
(setq ns-pop-up-frames nil)

;; C-z で最小化するのうざいのでころす
(define-key global-map (kbd "C-z") nil)
;(define-key global-map (kbd "C-x C-z") nil)  ;; init/init-howm.el でhowmのprefixとして指定してる

;; タイトルバー
(setq frame-title-format "Emacs")

;; http://qiita.com/h12o@github/items/f4f16a3d1c7162f3cb51
(setq inhibit-splash-screen t)
(defun cd-to-homedir-all-buffers ()
  "Change every current directory of all buffers to the home directory."
  (mapc
   (lambda (buf) (set-buffer buf) (cd (expand-file-name "~"))) (buffer-list)))
(add-hook 'after-init-hook 'cd-to-homedir-all-buffers)
