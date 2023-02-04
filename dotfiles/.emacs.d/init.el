;; ## Prerequisites
;; 
;; * auto-complete
;; * go-mode
;; * haskell-mode
;; * lsp-mode
;; * python-mode
;; * tuareg

;;;
;;; [Package manager]
;;;

;; MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;;
;;; [Utilities]
;;;

;; zenkaku-hankaku
;; Needs Mozc
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
(add-hook 'mozc-mode-hook
  (lambda ()
    (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

;; Moving window
;; NOTE: C-x <right> is overrided
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(setq windmove-wrap-around t)
(global-set-key (kbd "C-c <deletechar>") 'delete-window)
(global-set-key (kbd "C-x <right>") 'split-window-horizontally)
(global-set-key (kbd "C-x <down>") 'split-window-vertically)

;; Line numbers
(setq column-number-mode t)

;; TAB to auto-complete
;; https://github.com/auto-complete/auto-complete
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

;;;
;;; [Programming languages & local softwares]
;;;

;; OCaml and Merlin
;; You need `opam install merlin tuareg`.
(setq auto-mode-alist (cons '("\\.ml\\w?\\'" . tuareg-mode) auto-mode-alist))
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'tuareg-mode "tuareg-site-file" nil t nil)
    (autoload 'merlin-mode "merlin" nil t nil)
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    (setq merlin-command 'opam)))
(setq merlin-ac-setup 'easy)

; Disable electric-indent-mode
(add-hook
  'tuareg-mode-hook
  (lambda ()
    (set (make-local-variable 'electric-indent-mode) nil)))

(if (and (boundp 'window-system) window-system)
  (when (string-match "XEmacs" emacs-version)
    (if (not (and (boundp 'mule-x-win-initted) mule-x-win-initted))
  (require 'sym-lock))
    (require 'font-lock)))

;; Haskell
;; http://futurismo.biz/archives/2662
(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs\\'" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(setq haskell-program-name "/usr/bin/ghci")
(add-hook 'haskell-mode-hook 'inf-haskell-mode)

;; Go
;;
;; ```sh
;; go install golang.org/x/tools/cmd/goimports@latest
;; go install golang.org/x/tools/gopls@latest
;; ```
;;
;; https://godoc.org/golang.org/x/tools/cmd/goimports
;; https://github.com/golang/tools/blob/master/gopls/doc/emacs.md
(autoload 'go-mode "go-mode" nil t)
(setq auto-mode-alist (cons '("\\.go\\'" . go-mode) auto-mode-alist))
(setq gofmt-command "goimports")
(add-hook 'go-mode-hook 
  (lambda ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    (setq tab-width 4)
    (setq indent-tabs-mode 1)))
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook
  (lambda ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)))

;; Python
(add-hook 'python-mode-hook
  (lambda()
    (setq indent-tabs-mode nil)
    (setq indent-level 2)
    (setq python-indent 2)
    (setq tab-width 2)))
