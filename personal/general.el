  ;;; code

;;
(setq default-frame-alist
      (append (list '(alpha . (95 85))) default-frame-alist))

(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Work around a bug on OS X where system-name is a fully qualified
;; domain name
(setq system-name (car (split-string system-name "\\.")))

(setq system-uses-terminfo nil)

;; multi-term
(define-key global-map (kbd "C-x M-m") 'multi-term)

(setq multi-term-program "/bin/zsh")

;;in termail we should coment it
(scroll-bar-mode -1)
;;
;;(setq-default cursor-type 'bar)
(setq prelude-whitespace nil)

(global-set-key (kbd "C-S-v") 'scroll-down-command)
;; (global-set-key (kbd "M-c") 'kill-ring-save)
;; (global-set-key (kbd "M-v") 'yank)

;;set default shortcut key of ace is query char
(define-key global-map (kbd "C-x j") 'ace-jump-char-mode)
(global-set-key (kbd "C-x M-r") 'rename-buffer)

(key-chord-define-global "jj" nil)

(set-language-environment "UTF-8")

;;tpl html 用html-mode
(add-to-list 'auto-mode-alist '("\\.[tpl | html]$" . html-mode))
;;js json
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.[md | markdown]$" . markdown-mode))

(require 'livedown)
(custom-set-variables
 '(livedown:autostart nil) ; automatically open preview when opening markdown files 
 '(livedown:open t)        ; automatically open the browser window
 '(livedown:port 1337))    ; port for livedown server

;;yasnippet
;; (require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/personal/snippets" ;; personal snippets
;;         ))
;; (yas-global-mode 1)

;;
(setq-default indent-tabs-mode t)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(setq whitespace-line-column 180)

;;companay
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; bigger popup window
(setq company-tooltip-limit 20)

;; decrease delay before autocompletion popup shows
(setq company-idle-delay .3)

;;remove annoying blinking
(setq company-echo-delay 0)

;;disable prelude-flyspell
(setq prelude-flyspell nil)

;;font
(set-face-attribute 'default nil :height 130)
(set-default-font "Monaco-13")
(set-fontset-font "fontset-default" 'gb18030'("Yuppy SC" . "unicode-bmp")) ;;gb18030

;;
;;(global-set-key "/C-x/C-m" 'execute-extended-command)
;;(global-set-key "/C-c/C-m" 'execute-extended-command)

;;nxml-mode indent use 2
(setq
 nxml-child-indent 2
 nxml-attribute-indent 2
 nxml-slash-auto-complete-flag t)

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
