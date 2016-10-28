
(load-theme 'monokai t t)
(enable-theme 'monokai)

(setq coq-prog-name "/Users/mouns/.opam/4.02.3/bin/coqtop")

;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; Path
(add-to-list 'load-path "/Users/mouns/.emacs.d/llvm")
(add-to-list 'load-path "/Users/mouns/.emacs.d/lisp")
(add-to-list 'load-path "/Users/mouns/.opam/system/share/emacs/site-lisp")

;; MELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; Tuareg
(load "/Users/mouns/.opam/4.02.3/share/emacs/site-lisp/tuareg-site-file")
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu"
  "Configuration of imenu for tuareg" t)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
		("\\.topml$" . tuareg-mode))
	      auto-mode-alist))


;; OPAM
(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))


;; Shebangs
(defun insert-shebang (bin)
  (interactive "sBin: ")
  (save-excursion
    (goto-char (point-min))
    (insert "#!" bin "\n\n")))

(defun insert-shebang-if-empty (bin)
  (when (buffer-empty-p)
    (insert-shebang bin)))

;; OPTIONS
(setq frame-title-format "%b")          ; titlebar shows buffer's name
(setq line-number-mode 't)              ; line number
(setq column-number-mode 't)            ; column number
(setq delete-auto-save-files t)         ; delete unnecessary autosave files
(setq delete-old-versions t)            ; delete oldversion file
(setq normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)           ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)    ; change default major mode to text
(setq ring-bell-function 'ignore)       ; turn the alarm totally off
(setq make-backup-files nil)            ; no backupfile

;; HOOKS
;; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Insert shebang for sh files
(add-hook 'sh-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/bin/sh")))

;; Insert shebang for ruby files
(add-hook 'ruby-mode-hook
	  (lambda ()
	      (insert-shebang-if-empty "/usr/bin/ruby")))



(setq user-mail-address "mounir.nasrallah@centralesupelec.fr")
(setq user-full-name "Mounir NASR ALLAH")
(setq gnus-article-date-headers 'original)
(setq gnus-article-update-date-headers nil)

(setq-default show-trailing-whitespace t)
(setq-default next-line-add-newlines nil)

(setq-default fill-column 80)
(column-number-mode t)
(line-number-mode t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(put 'upcase-region 'disabled nil)


;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)



(require 'llvm-mode)
(require 'tablegen-mode)


(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
	              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
		                    (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4294fa1b78ee65d076a1302f6ed34d42e34f637aae918b7691835adef69bd4cc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
