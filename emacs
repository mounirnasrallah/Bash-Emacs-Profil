
;; Path
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



;; Colored buffers
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)



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



(setq user-mail-address "mounir@nasrallah.co")
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


(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode 'easy)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'merlin-company-backend))

(add-hook 'merlin-mode-hook 'company-mode)
