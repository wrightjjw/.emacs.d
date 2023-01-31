;; setup
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'visual)

;; font
(cond
 ((find-font (font-spec :name "CaskaydiaCove NF"))
  (add-to-list 'default-frame-alist '(font . "CaskaydiaCove NF-10")))
 ((find-font (font-spec :name "CaskaydiaCove Nerd Font"))
  (add-to-list 'default-frame-alist '(font . "CaskaydiaCove Nerd Font-10")))
 ((find-font (font-spec :name "Cascadia Code"))
  (add-to-list 'default-frame-alist '(font . "Cascadia Code-10")))
 )

(require 'org)
(set-face-attribute 'org-document-title nil :height 1.8)
(set-face-attribute 'org-level-1 nil :height 1.5)
(set-face-attribute 'org-level-2 nil :height 1.3)
(set-face-attribute 'org-level-3 nil :height 1.1)

(set-face-attribute 'variable-pitch nil :family "Ubuntu" :height 120)

;; wrap text
(add-hook 'text-mode-hook 'visual-line-mode)

;; flyspell
(add-hook 'text-mode-hook 'flyspell-mode)

;; set no lsp (gets set when loading lsp.el)
(setq use-lsp-mode nil)

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;;;;;;;;;;;;;;;
;;; PACKAGES ;;;
;;;;;;;;;;;;;;;;
;; recentf
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; org emphasis
(setq org-hide-emphasis-markers t)
(defun org-toggle-emphasis ()
  "Toggle hiding/showing of org emphasize markers."
  (interactive)
  (if org-hide-emphasis-markers
      (set-variable 'org-hide-emphasis-markers nil)
    (set-variable 'org-hide-emphasis-markers t)))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; auto-update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; evil
(use-package evil
             :ensure t
	     :init
 	     (setq evil-want-integration t)
	     (setq evil-want-keybinding nil)
	     :config (require 'evil)
	     (evil-set-undo-system 'undo-redo)
	     (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))

;; evil numbers
(use-package evil-numbers
  :ensure t)

;; eglot
(use-package eglot
  :ensure t)

;; company mode (in-buffer popups)
(use-package company
  :ensure t
  :config (global-company-mode))

;; magit
; compat seems to be some sort of workaround for magit on newer Emacs.
; it doesn't seem like it should be required,
; but emacs 30 master requires it.
; I assume the dependency will eventually be removed.
(use-package compat
  :ensure t)
(use-package magit
  :ensure t)

;; markdown mode
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc"))

;; mixed pitch mode
(use-package mixed-pitch
  :ensure t
  :hook (text-mode . mixed-pitch-mode))

;; which-key
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; org-superstar
(use-package org-superstar
  :ensure t
  :hook (org-mode . (lambda () (org-superstar-mode 1))))

;; doom themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-snazzy t)
  (doom-themes-org-config))

;; neotree
(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-smart-open t))

;;;;;;;;;;
;; csharp settings
(require 'csharp-mode)
(setq csharp-want-imenu nil)
(add-hook 'csharp-mode-hook 'eglot-ensure)


;; atom-one-dark-theme
;;(use-package atom-one-dark-theme
;;             :ensure t
;;	     :config
;;	       (load-theme 'atom-one-dark t))

;;;;;;;;;;;;;;;;;;;;
;;; ORG SETTINGS ;;;
;;;;;;;;;;;;;;;;;;;;
(require 'org)
(setq org-export-with-section-numbers nil)
(setq org-startup-indented t)


;;;;;;;;;;;;;
;;; HOOKS ;;;
;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;
;;; KEYBINDS ;;;
;;;;;;;;;;;;;;;;

;; org emphasis C-c e
(defun org-toggle-emphasis ()
  "Toggle hiding/showing of org emphasize markers."
  (interactive)
  (if org-hide-emphasis-markers
      (setq org-hide-emphasis-markers nil)
    (setq org-hide-emphasis-markers t)))
(define-key org-mode-map (kbd "C-c e") 'org-toggle-emphasis)

;; zooming
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; leader keybinds
(evil-define-key 'normal 'global (kbd "SPC f f") 'find-file)
(evil-define-key 'normal 'global (kbd "SPC f r") 'recentf-open-files)
(evil-define-key 'normal 'global (kbd "SPC f d") 'dired)

(evil-define-key 'normal 'global (kbd "SPC b b") 'switch-to-buffer)
(evil-define-key 'normal 'global (kbd "SPC b l") 'list-buffers)

(evil-define-key 'normal 'global (kbd "SPC g") 'magit)

(evil-define-key 'normal 'global (kbd "SPC c c") 'compile)
(evil-define-key 'normal 'global (kbd "SPC c r") 'recompile)

(evil-define-key 'normal 'global (kbd "SPC o a") 'org-agenda)

(evil-define-key 'normal 'global (kbd "SPC p f") 'project-find-file)
(evil-define-key 'normal 'global (kbd "SPC p g") 'project-find-regexp)
(evil-define-key 'normal 'global (kbd "SPC p d") 'project-dired)
(evil-define-key 'normal 'global (kbd "SPC p s") 'project-shell)
(evil-define-key 'normal 'global (kbd "SPC p e") 'project-eshell)
(evil-define-key 'normal 'global (kbd "SPC p c") 'project-compile)
(evil-define-key 'normal 'global (kbd "SPC p !") 'project-shell-command)
(evil-define-key 'normal 'global (kbd "SPC p &") 'project-async-shell-command)

(evil-define-key 'normal 'eglot-mode-map (kbd "SPC e a") 'eglot-code-actions)
(evil-define-key 'normal 'eglot-mode-map (kbd "SPC o a") 'eglot-find-implementation)
(evil-define-key 'normal 'eglot-mode-map (kbd "SPC o a") 'eglot-find-declaration)

