(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))

(setq
 el-get-dir (concat user-emacs-directory "el-get")
 el-get-verbose t
 el-get-user-package-directory (concat user-emacs-directory "conf/init")
 el-get-generate-autoloads nil)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "recipes"))

(el-get 'sync
        '(el-get
          let-alist
          emacs-powerline
          auto-complete
          flymake
          flycheck
          c-eldoc
          auto-complete-c-headers
          auto-complete-clang
          cperl-mode
          perl-debug
          perl-completion
          set-perl5lib
          ruby-mode
          enh-ruby-mode
          ruby-electric
          ruby-block
          auto-complete-ruby
          go-mode
          go-eldoc
          go-autocomplete
          go-flymake
          lua-mode
          js3-mode
          json-mode
          json-reformat
          scala-mode2
          lua-mode
          yaml-mode
          markdown-mode
          plantuml-mode
          git-gutter
          auto-complete-emacs-lisp
          ))

(if (locate-file "llvm-config" exec-path)
    (el-get 'sync '(clang-complete-async)))
