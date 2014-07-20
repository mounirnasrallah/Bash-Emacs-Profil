;;
;; emacs configuration
;;

(if (file-exists-p "~/.myemacs")
    (load-file "~/.myemacs"))

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Mode majeur pour éditer du code Caml" t)
(autoload 'camldebug "camldebug" "Exécuter le débogueur Caml" t)
(setq auto-mode-alist (cons '("\\.eliom$" . tuareg-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Makefile.options" . makefile-mode) auto-mode-alist))

(defun may-load (path)
  "Load a file iff it exists."
  (when (file-readable-p path)
    (load-file path)))

;; Load local distribution configuration file
(may-load "~/.emacs.site")

;; Load caml mode

(setq load-path (cons "~/.emacs.conf/tuareg" load-path))
;;(setq load-path (cons "~/.emacs.conf/auto-complete-config" load-path))
(setq load-path (cons "~/.emacs.d/tiger.el" load-path))
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)


 (defconst conf-dir "~/.emacs.conf/"
   "Location of the configuration files")
 (add-to-list 'load-path conf-dir)

;; (load-library "clang-completion-mode")

;; (require 'linum)

;;(require 'auto-complete-config)

;; (setq warning-suppress-types nil)


;; ;; CEDET
;; (load-file "~/.emacs.d/cedet/common/cedet.el")
;; (require 'eieio)


;; (global-ede-mode 'nil)                  ; do NOT use project manager

;; (semantic-load-enable-excessive-code-helpers)

;; (require 'semantic-ia)          ; names completion and display of tags
;; (require 'semantic-gcc)         ; auto locate system include files

;; (semantic-add-system-include "~/3rd-party/boost-1.43.0/include/" 'c++-mode)
;; (semantic-add-system-include "~/3rd-party/protobuf-2.3.0/include" 'c++-mode)

;; (require 'semanticdb)
;; (global-semanticdb-minor-mode 1)

;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
;;   (local-set-key "\C-c=" 'semantic-decoration-include-visit)
;;   (local-set-key "\C-cj" 'semantic-ia-fast-jump)
;;   (local-set-key "\C-cq" 'semantic-ia-show-doc)
;;   (local-set-key "\C-cs" 'semantic-ia-show-summary)
;;   (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
;;   (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
;;   (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
;;   (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
;;   (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
;;   )
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)

;; (global-semantic-tag-folding-mode 1)

;; (require 'eassist)

;; ;(concat essist-header-switches ("hh" "cc"))
;; (defun alexott/c-mode-cedet-hook ()
;;   (local-set-key "\C-ct" 'eassist-switch-h-cpp)
;;   (local-set-key "\C-xt" 'eassist-switch-h-cpp)
;;   (local-set-key "\C-ce" 'eassist-list-methods)
;;   (local-set-key "\C-c\C-r" 'semantic-symref)
;;   )
;; (add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; ;; gnu global support
;; (require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)

;; ;; ctags
;; (require 'semanticdb-ectag)
;; (semantic-load-enable-primary-exuberent-ctags-support)





;; (setq ac-auto-start nil)
;; (setq ac-quick-help-delay 0.5)
;; ;; (ac-set-trigger-key "TAB")
;; ;; (define-key ac-mode-map [(control tab)] 'auto-complete)
;; (define-key ac-mode-map [(control tab)] 'auto-complete)
;; (defun my-ac-config ()
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))
;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ;; ac-source-gtags
;; (my-ac-config)





;;(setq-default gdb-many-windows t)
;;(global-linum-mode 1)
;;(xterm-mouse-mode t)
;;(global-auto-complete-mode t)
;;(define-key global-map "\C-h" 'backward-delete-char)
;;(highlight-80+-mode t)
(custom-set-variables '(pc-selection-mode t nil (pc-select)))
;;(global-set-key [(control h)] 'delete-backward-char)
;;(keyboard-translate ?\C-h ?\C-?)
;;(normal-erase-is-backspace-mode 1)

(defconst has-gnuserv
  (fboundp 'gnuserv-start)
  "Whether gnuserv is available")

;; Version detection
(defconst xemacs (string-match "XEmacs" emacs-version)
  "non-nil iff XEmacs, nil otherwise")

(defconst emacs23 (string-match "^23." emacs-version)
  "non-nil iff Emacs 23, nil otherwise")

;; CUSTOM FUNCTIONS

;; Reload conf
(defun reload ()
  (interactive)
  (load-file "~/.emacs"))

;; Compilation
(defvar cpu-number 1
  "Number of parallel processing units on this system")

;;(setq linum-format "%d ")
(setq compile-command "make")


;; highlight when > 80 cols
;;(defun eightycols nil
;;  (defface line-overflow
;;    '((t (:background "red" :foreground "black")))
;;    "Face to use for `hl-line-face'.")
;;  (highlight-regexp "^.\\{80,\\}$" 'line-overflow)
;;  )
;;(add-hook 'find-file-hook 'eightycols)


;; Edition
(defun c-switch-hh-cc ()
  (interactive)
  (let ((other
         (let ((file (buffer-file-name)))
           (if (string-match "\\.hh$" file)
	       (let ((file (replace-regexp-in-string "\\.hh$" ".cc" file)))
		 (if (file-readable-p file)
		     (replace-regexp-in-string "\\.hh$" ".cc" file)
		   (let ((file (replace-regexp-in-string "\\.cc$" ".hxx" file)))
		     (if (file-readable-p file)
			 (replace-regexp-in-string "\\.cc$" ".hxx" file)
		       (replace-regexp-in-string "\\.hxx$" ".cc" file)))))
	     (if (string-match "\\.cc$" file)
		 (let ((file (replace-regexp-in-string "\\.cc$" ".hxx" file)))
		   (if (file-readable-p file)
		       (replace-regexp-in-string "\\.cc$" ".hxx" file)
		     (let ((file (replace-regexp-in-string "\\.hxx$" ".hh" file)))
		       (if (file-readable-p file)
			   (replace-regexp-in-string "\\.hxx$" ".hh" file)
			 (replace-regexp-in-string "\\.hh$" ".cc" file)))))
	       (if (string-match "\\.hxx$" file)
		   (let ((file (replace-regexp-in-string "\\.hxx$" ".hh" file)))
		     (if (file-readable-p file)
			 (replace-regexp-in-string "\\.hxx$" ".hh" file)
		       (let ((file (replace-regexp-in-string "\\.hh$" ".cc" file)))
			 (if (file-readable-p file)
			     (replace-regexp-in-string "\\.hh$" ".cc" file)
			   (replace-regexp-in-string "\\.cc$" ".hxx" file)))))
		 ()))))))
    (find-file other)))


;; BEGIN
;;(define-key ac-complete-mode-map "\t" 'ac-expand)
;;(define-key ac-complete-mode-map "\r" 'ac-complete)
;;(define-key ac-complete-mode-map "\M-n" 'ac-next)
;;(define-key ac-complete-mode-map "\M-p" 'ac-previous)
;;(setq ac-auto-start 3)
;;(setq ac-dwim t)

;;(setq ac-modes
;;      (append ac-modes
;;	      '(eshell-mode)))
					;(add-to-list 'ac-trigger-commands 'org-self-insert-command)

(defun count-word (start end)
  (let ((begin (min start end))(end (max start end)))
    (save-excursion
      (goto-char begin)
      (re-search-forward "\\W*") ; skip blank
      (setq i 0)
      (while (< (point) end)
        (re-search-forward "\\w+")
        (when (<= (point) end)
          (setq i (+ 1 i)))
        (re-search-forward "\\W*"))))
  i)

(defun stat-region (start end)
  (interactive "r")
  (let
      ((words (count-word start end)) (lines (count-lines start end)))
    (message
     (concat "Lines: "
             (int-to-string lines)
             "  Words: "
             (int-to-string words)))
    )
  )

(defun ruby-command (cmd &optional output-buffer error-buffer)
  "Like shell-command, but using ruby."
  (interactive (list (read-from-minibuffer "Ruby command: "
					   nil nil nil 'ruby-command-history)
		     current-prefix-arg
		     shell-command-default-error-buffer))
  (shell-command (concat "ruby -e '" cmd "'") output-buffer error-buffer))

;; Shebangs

(defun insert-shebang (bin)
  (interactive "sBin: ")
  (save-excursion
    (goto-char (point-min))
    (insert "#!" bin "\n\n")))

(defun insert-shebang-if-empty (bin)
  (when (buffer-empty-p)
    (insert-shebang bin)))

;; C/C++

;; Comment boxing

(defun insert-header-guard ()
  (interactive)
  (save-excursion
    (when (buffer-file-name)
      (let*
	  ((name (file-name-nondirectory buffer-file-name))
	   (macro (replace-regexp-in-string
		   "\\." "_"
		   (replace-regexp-in-string
		    "-" "_"
		    (upcase name)))))
	(goto-char (point-min))
	(insert "#ifndef " macro "_\n")
	(insert "# define " macro "_\n\n")
	(goto-char (point-max))
	(insert "\n#endif /* !" macro "_ */\n")))))

(defun insert-header-inclusion ()
  (interactive)
  (when (buffer-file-name)
    (let
        ((name
          (replace-regexp-in-string ".c$" ".h"
				    (replace-regexp-in-string ".cc$" ".hh"
							      (file-name-nondirectory buffer-file-name)))))
      (insert "#include \"" name "\"\n\n"))))


(defun sandbox ()
  "Opens a C++ sandbox in current window."
  (interactive)
  (cd "/tmp")
  (let ((file (make-temp-file "/tmp/" nil ".cc")))
    (find-file file)
    (insert "int main()\n{\n\n}\n")
    (line-move -2)
    (save-buffer)
    (compile (concat "g++ -W -Wall -I /usr/include/qt4/ -I /usr/include/qt4/QtCore/ -L /usr/lib/qt4 -lQtCore " file " && ./a.out"))))

(defun c-insert-debug (&optional msg)
  (interactive)
  (when (not (looking-at "\\W*$"))
    (beginning-of-line)
    (insert "\n")
    (line-move -1))
  (c-indent-line)
  (insert "std::cerr << \"\" << std::endl;")
  (backward-char 15))

(defun c-insert-text (&optional msg)
  (interactive)
  (when (not (looking-at "\\W*$"))
    (beginning-of-line)
    (insert "\n")
    (line-move -1))
  (c-indent-line)
  (insert "std::cout << \"\" << std::endl;")
  (backward-char 15))

(defun c-insert-block (&optional r b a)
  (interactive "P")
  (unless b (setq b ""))
  (unless a (setq a ""))
  (if r
      (progn
        (save-excursion
          (goto-char (rbegin))
          (beginning-of-line)
          (insert "\n")
          (line-move -1)
          (insert b "{")
          (c-indent-line))
        (save-excursion
          (goto-char (- (rend) 1))
          (end-of-line)
          (insert "\n}" a)
          (c-indent-line)
          (line-move -1)
          (end-of-line))
        (indent-region (rbegin) (rend)))
    (progn
      (beginning-of-line)

      (setq begin (point))

      (insert b "{\n")
      (end-of-line)
      (insert "\n}" a)

      (indent-region begin (point))

      (line-move -1)
      (end-of-line))))

(defun c-insert-braces (&optional r)
  (interactive "P")
  (c-insert-block r))

(defun c-insert-ns (name r)
  (interactive "sName: \nP")
  (c-insert-block r (concat "namespace " name "\n")))

(defun c-insert-switch (value r)
  (interactive "sValue: \nP")
  (c-insert-block r (concat "switch (" value ")\n")))

(defun c-insert-if (c r)
  (interactive "sCondition: \nP")
  (c-insert-block r (concat "if (" c ")\n")))

(defun c-insert-class (name)
  (interactive "sName: ")
  (c-insert-block () (concat "class " name "\n") ";")
  (insert "public:")
  (c-indent-line)
  (insert "\n")
  (c-indent-line))

(defvar ac-c++-sources
  '(ac-source-c++-keywords))

;; (ac-define-dictionary-source
;;  ac-source-c++-keywords
;;  '("and" "bool" "compl" "do" "export" "goto" "namespace" "or_eq" "return"
;;    "struct" "try" "using" "xor" "and_eq" "break" "const" "double" "extern"
;;    "if" "new" "private" "short" "switch" "typedef" "virtual" "xor_eq" "asm"
;;    "case" "const_cast" "dynamic_cast" "false" "inline" "not" "protected"
;;    "signed" "template" "typeid" "void" "auto" "catch" "continue" "else"
;;    "float" "int" "not_eq" "public" "sizeof" "this" "typename" "volatile"
;;    "bitand" "char" "default" "enum" "for" "long" "operator" "register"
;;    "static" "throw" "union" "wchar_t" "bitor" "class" "delete" "explicit"
;;    "friend" "mutable" "or" "reinterpret_cast" "static_cast" "true"
;;    "unsigned" "while"))

(defun ac-c++-setup ()
  (setq ac-sources (append ac-c++-sources ac-sources)))

(defun ac-c++-init ()
  (add-hook 'c++-mode-hook 'ac-c++-setup))

(defun ac-semantic-candidate (prefix)
  (if (memq major-mode
            '(c-mode c++-mode jde-mode java-mode))
      (mapcar 'semantic-tag-name
              (ignore-errors
                (or (semantic-ia-get-completions
                     (semantic-analyze-current-context) (point))
                    (senator-find-tag-for-completion (regexp-quote prefix)))))))

(defvar ac-source-semantic
  '((candidates . (lambda () (all-completions ac-prefix (ac-semantic-candidate ac-prefix)))))
  "Source for semantic.")


;; OPTIONS

(setq inhibit-startup-message t)        ; don't show the GNU splash screen
(setq frame-title-format "%b")          ; titlebar shows buffer's name
					;(setq transient-mark-mode 't)          ; highlight selection
(setq line-number-mode 't)              ; line number
(setq column-number-mode 't)            ; column number
(when (display-graphic-p)
  (progn
    (scroll-bar-mode -1)                ; no scroll bar
    (menu-bar-mode -1)                  ; no menu bar
    (tool-bar-mode -1)                  ; no tool bar
    (mouse-wheel-mode t)))              ; enable mouse wheel


(setq delete-auto-save-files t)         ; delete unnecessary autosave files
(setq delete-old-versions t)            ; delete oldversion file
(setq normal-erase-is-backspace-mode t) ; make delete work as it should
(fset 'yes-or-no-p 'y-or-n-p)           ; 'y or n' instead of 'yes or no'
(setq default-major-mode 'text-mode)    ; change default major mode to text
(setq ring-bell-function 'ignore)       ; turn the alarm totally off
(setq make-backup-files nil)            ; no backupfile

;; FIXME: wanted 99.9% of the time, but can cause your death 0.1% of
;; the time =). Todo: save buffer before reverting
					;(global-auto-revert-mode t)            ; auto revert modified files

					;(pc-selection-mode)                    ; selection with shift
(auto-image-file-mode)                  ; to see picture in emacs
					;(dynamic-completion-mode)              ; dynamic completion
(show-paren-mode t)			; match parenthesis
(setq-default indent-tabs-mode nil)	; don't use fucking tabs to indent
(setq-default indent-tabs-mode nil)

;; HOOKS

					; Delete trailing whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

					; Auto insert C/C++ header guard
(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.hh?" (buffer-file-name)))
	      (insert-header-guard)
	      (goto-line 3)
	      (insert "\n"))))
(add-hook 'find-file-hooks
	  (lambda ()
	    (when (and (memq major-mode '(c-mode c++-mode)) (equal (point-min) (point-max)) (string-match ".*\\.cc?" (buffer-file-name)))
	      (insert-header-inclusion))))

(add-hook 'sh-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/bin/sh")))

(add-hook 'ruby-mode-hook
	  (lambda ()
            (insert-shebang-if-empty "/usr/bin/ruby")))

					; Start code folding mode in C/C++ mode
(add-hook 'c-mode-common-hook (lambda () (hs-minor-mode 1)))

;; file extensions
(add-to-list 'auto-mode-alist '("\\.l$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.y$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.yy$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xcc$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.xhh$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pro$" . sh-mode)) ; Qt .pro files
(add-to-list 'auto-mode-alist '("configure$" . sh-mode))
(add-to-list 'auto-mode-alist '(".mybashrc$" . sh-mode))
(add-to-list 'auto-mode-alist '("Drakefile$" . c++-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . change-log-mode))

;; Ido

(defconst has-ido emacs23)

;;(when has-ido
(ido-mode t)

;; tab means tab, i.e. complete. Not "open this file", stupid.
(setq ido-confirm-unique-completion t)
;; If the file doesn't exist, do try to invent one from a transplanar
;; directory. I just want a new file.
(setq ido-auto-merge-work-directories-length -1)

;; GNUSERV

(when has-gnuserv
  (gnuserv-start)
					;  (global-set-key [(control x) (control c)] 'gnuserv-close-session)
  (add-hook 'gnuserv-visit-hook 'configure-frame)
  )

;; BINDINGS

;;(global-set-key (read-kbd-macro "DEL") 'delete-char)

;; BINDINGS
;;(when has-ido
;;(global-set-key [(control b)] 'ido-switch-buffer))

;; BINDINGS :: isearch
(global-set-key [(control s)] 'isearch-forward-regexp)  ; search regexp
;;(global-set-key [(control r)] 'query-replace-regexp)    ; replace regexp

;; (define-key
;;   isearch-mode-map
;;   [(control n)]
;;   'isearch-repeat-forward)                              ; next occurence
;; (define-key
;;   isearch-mode-map
;;   [(control p)]
;;   'isearch-repeat-backward)                             ; previous occurence
;; (define-key
;;   isearch-mode-map
;;   [(control z)]
;;   'isearch-cancel)                                      ; quit and go back to start point
;; (define-key
;;   isearch-mode-map
;;   [(control f)]
;;   'isearch-exit)                                        ; abort
;; (define-key
;;   isearch-mode-map
;;   [(control r)]
;;   'isearch-query-replace)                               ; switch to replace mode
;; (define-key
;;   isearch-mode-map
;;   [S-insert]
;;   'isearch-yank-kill)                                   ; paste
;; (define-key
;;   isearch-mode-map
;;   [(control e)]
;;   'isearch-toggle-regexp)                               ; toggle regexp
;; (define-key
;;   isearch-mode-map
;;   [(control l)]
;;   'isearch-yank-line)                                   ; yank line from buffer
;; (define-key
;;   isearch-mode-map
;;   [(control w)]
;;   'isearch-yank-word)                                   ; yank word from buffer
;; (define-key
;;   isearch-mode-map
;;   [(control c)]
;;   'isearch-yank-char)                                   ; yank char from buffer

;; BINDINGS :: Ruby

					;(define-key
					;  ruby-mode-map
					;  [(control c) (control f)]
					;  'insert-fixme)                                      ; insert fixme

;; BINDINGS :: C/C++

(require 'cc-mode)

(define-key
  c-mode-base-map
  [(control c) (w)]
  'c-switch-hh-cc)                              ; switch between .hh and .cc
(define-key
  c-mode-base-map
  [(control c) (f)]
  'hs-hide-block)                                       ; fold code
(define-key
  c-mode-base-map
  [(control c) (s)]
  'hs-show-block)                                       ; unfold code
(define-key
  c-mode-base-map
  [(control c) (control n)]
  'c-insert-ns)                                         ; insert namespace
(define-key
  c-mode-base-map
  [(control c) (control s)]
  'c-insert-switch)                                     ; insert switch
(define-key
  c-mode-base-map
  [(control c) (control i)]
  'c-insert-if)                                         ; insert if
(define-key
  c-mode-base-map
  [(control c) (control b)]
  'c-insert-braces)                                     ; insert braces
(define-key
  c-mode-base-map
  [(control c) (control f)]
  'insert-fixme)                                      ; insert fixme
(define-key
  c-mode-base-map
  [(control c) (control d)]
  'c-insert-debug)                                      ; insert debug
(define-key
  c-mode-base-map
  [(control c) (control t)]
  'c-insert-text)                                     ; insert text
(define-key
  c-mode-base-map
  [(control c) (control l)]
  'c-insert-class)                                      ; insert class

;; ;; BINDINGS :: C/C++ :: XRefactory

;; (define-key
;;   c-mode-base-map
;;   [(control c) (d)]
;;   'xref-push-and-goto-definition)                       ; goto definition
;; (define-key
;;   c-mode-base-map
;;   [(control c) (b)]
;;   'xref-pop-and-return)                                 ; go back
;; (define-key
;;   c-mode-base-map
;;   [C-return]
;;   'xref-completion)                                     ; complete

;; BINDINGS :: misc

(global-set-key [(meta =)]
                'stat-region)

(global-set-key [(control q)] 'mark-whole-buffer)       ; select whole buffer
;; (global-set-key [(control return)] 'dabbrev-expand)     ; auto completion
(global-set-key [C-home] 'beginning-of-buffer)          ; go to the beginning of buffer
(global-set-key [C-end] 'end-of-buffer)                 ; go to the end of buffer
(global-set-key [(meta g)] 'goto-line)                  ; goto line #
(global-set-key [M-left] 'windmove-left)                ; move to left windnow
(global-set-key [M-right] 'windmove-right)              ; move to right window
(global-set-key [M-up] 'windmove-up)                    ; move to upper window
(global-set-key [M-down] 'windmove-down)
(global-set-key [(control c) (c)] 'recompile)
(global-set-key [(control c) (e)] 'next-error)
(global-set-key [(control tab)] 'other-window)          ; Ctrl-Tab = Next buffer
(global-set-key [(control \;)] 'other-window)          ; Ctrl-Tab = Next buffer
(global-set-key [C-S-iso-lefttab]
                '(lambda () (interactive)
                   (other-window -1)))                  ; Ctrl-Shift-Tab = Previous buffer
;;(global-set-key [(control delete)]
;;              'kill-word)			        ; kill word forward
(global-set-key [(meta ~)] 'ruby-command)               ; run ruby command

;; COLORS

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "green")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Lisp mode

(require 'lisp-mode)

(define-key
  lisp-mode-shared-map
  [(control c) (control c)]
  'comment-region)                                      ; comment


;; C / C++ mode

(require 'cc-mode)
(add-to-list 'c-style-alist
             '("epita"
               (c-basic-offset . 2)
               (c-comment-only-line-offset . 0)
               (c-hanging-braces-alist     . ((substatement-open before after)))
               (c-offsets-alist . ((topmost-intro        . 0)
                                   (substatement         . +)
                                   (substatement-open    . 0)
                                   (case-label           . +)
                                   (access-label         . -)
                                   (inclass              . ++)
                                   (inline-open          . 0)))))





(c-add-style
 "haypo"
 (quote
  (
   ;; Indentation de base = 2 espaces
   (c-basic-offset . 2)
   (c-backslash-column . 48)
   (c-cleanup-list scope-operator)
   (c-comment-only-line-offset . 0)
   (c-electric-pound-behavior)
   (c-hanging-braces-alist
    (brace-list-open)
    (brace-entry-open)
    (substatement-open after)
    (block-close . c-snug-do-while)
    (extern-lang-open after)
    (inexpr-class-open after)
    (inexpr-class-close before))
   (c-hanging-colons-alist)
   (c-hanging-comment-starter-p . t)
   (c-hanging-comment-ender-p . t)
   (c-offsets-alist
    (string . c-lineup-dont-change)
    (c . c-lineup-C-comments)
    (defun-open . 0)
    (defun-close . 0)
    (defun-block-intro . +)
    (class-open . 0)
    (class-close . 0)
    (inline-open . +)
    (inline-close . 0)
    (func-decl-cont . +)
    (knr-argdecl-intro . +)
    (knr-argdecl . 0)
    (topmost-intro . 0)
    (topmost-intro-cont . 0)
    (member-init-intro . +)
    (member-init-cont . 0)
    (inher-intro . +)
    (inher-cont . c-lineup-multi-inher)
    (block-open . 0)
    (block-close . 0)
    (brace-list-open . 0)
    (brace-list-close . 0)
    (brace-list-intro . +)
    (brace-list-entry . 0)
    (brace-entry-open . 0)
    (statement . 0)
    (statement-cont . +)
    (statement-block-intro . +)
    (statement-case-intro . +)
    (statement-case-open . 0)
    (substatement . +)

    ;; Pas de décalage lors de l'ouverture d'un block-intro
    ;; (substatement-open . 0)
    (case-label . 0)
    (access-label . -)
    (label . 2)
    (do-while-closure . 0)
    (else-clause . 0)
    (catch-clause . 0)
    (comment-intro . c-lineup-comment)
    (arglist-intro . +)
    (arglist-cont . 0)
    (arglist-cont-nonempty . c-lineup-arglist)
    (arglist-close . +)
    (stream-op . c-lineup-streamop)
    (inclass . +)
    (cpp-macro . -1000)
    (cpp-macro-cont . c-lineup-dont-change)
    (friend . 0)
    (objc-method-intro . -1000)
    (objc-method-args-cont . c-lineup-ObjC-method-args)
    (objc-method-call-cont . c-lineup-ObjC-method-call)
    (extern-lang-open . 0)
    (extern-lang-close . 0)
    (inextern-lang . +)
    (namespace-open . 0)
    (namespace-close . 0)
    (innamespace . +)
    (template-args-cont . +)
    (inlambda . c-lineup-inexpr-block)
    (lambda-intro-cont . +)
    (inexpr-statement . 0)
    (inexpr-class . +)
    )
   )
  )
 )


(setq c-default-style "haypo")

;; Compilation

(setq compilation-window-height 14)
(setq compilation-scroll-output t)

;; make C-Q RET insert a \n, not a ^M

(defadvice insert-and-inherit (before ENCULAY activate)
  (when (eq (car args) ?)
    (setcar args ?\n)))



;; Sessions

(when has-ido
  (custom-set-variables
   '(ido-auto-merge-work-directories-length -1)
   '(ido-confirm-unique-completion t)
   '(ido-create-new-buffer (quote always))
   '(ido-everywhere t)
   '(ido-mode (quote both) nil (ido))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook (quote (executable-make-buffer-file-executable-if-script-p)))
 '(gdb-max-frames 1024)
 '(ido-auto-merge-work-directories-length -1)
 '(ido-confirm-unique-completion t)
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)

 '(ido-mode (quote both) nil (ido))
 '(python-indent 2)
 '(require-final-newline t)
 '(speedbar-frame-parameters (quote ((minibuffer . t) (width . 20) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0)))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

(setq-default ispell-program-name "aspell")

;; Recognize test suite output

(require 'compile)
(add-to-list 'compilation-error-regexp-alist '("^\\(PASS\\|SKIP\\|XFAIL\\|TFAIL\\): \\(.*\\)$" 2 () () 0 2))
(add-to-list 'compilation-error-regexp-alist '("^\\(FAIL\\|XPASS\\): \\(.*\\)$" 2 () () 2 2))

;; Save and restore window layout

(defvar winconf-ring ())

(defun push-winconf ()
  (interactive)
  (window-configuration-to-register ?%)
  (push (get-register ?%) winconf-ring))

(defun pop-winconf ()
  (interactive)
  (set-register ?% (pop winconf-ring))
  (jump-to-register ?%))

(defun restore-winconf ()
  (interactive)
  (set-register ?% (car winconf-ring))
  (jump-to-register ?%))

(may-load "~/.emacs.local")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq default-tab-width 2)

(prefer-coding-system 'utf-8)

;; MY CONF

(setq user-mail-address "chambo_r@epita.fr")
(setq user-full-name "Raf")
(setq gnus-article-date-headers 'original)
(setq gnus-article-update-date-headers nil)

(setq-default show-trailing-whitespace t)
(setq-default next-line-add-newlines nil)

(setq-default fill-column 80)


(setq backup-inhibited t)
(setq auto-save-default nil)

(add-to-list 'auto-mode-alist '("\\.sed" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.awk" . sh-mode))

(c-set-offset 'substatement-open 0)

;; Don't switch to GDB-mode buffers
;;(setq ido-ignore-buffers (quote ("\\`\\*breakpoints of.*\\*\\'"
;;  "\\`\\*stack frames of.*\\*\\'" "\\`\\*gud\\*\\'"
;;  "\\`\\*locals of.*\\*\\'" "\\` ")))
;; Better gdb
;;(setq-default gdb-many-windows t)

(column-number-mode t)
(line-number-mode t)
;;(setq linum-format " %d ")

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c b")  'windmove-left)
(global-set-key (kbd "C-c f") 'windmove-right)
(global-set-key (kbd "C-c p")    'windmove-up)
(global-set-key (kbd "C-c n")  'windmove-down)
(global-set-key (kbd "C-;") 'other-window)
(global-set-key (kbd "M-;") 'other-window)
(global-set-key [(meta tab)] 'next-buffer)
(global-set-key (kbd "C-'") 'previous-buffer)
(global-set-key (kbd "M-'") 'previous-buffer)
(global-set-key (kbd "C-\\") 'next-buffer)
(global-set-key (kbd "C-c g") 'gdb)
(global-set-key (kbd "C-c m") 'xterm-mouse-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
(global-set-key (kbd "M-DEL")  'backward-kill-word)
