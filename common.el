;; setup
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'visual)

;; font
(add-to-list 'default-frame-alist '(font . "CaskaydiaCove NF-10"))

;; wrap text
(add-hook 'text-mode-hook 'visual-line-mode)

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
;;(define-key org-mode-map (kbd "C-c e") 'org-toggle-emphasis)

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

;; magit
(use-package magit
  :ensure t)

;; which-key
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

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

;; atom-one-dark-theme
;;(use-package atom-one-dark-theme
;;             :ensure t
;;	     :config
;;	       (load-theme 'atom-one-dark t))


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
