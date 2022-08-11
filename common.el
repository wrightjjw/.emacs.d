;; setup
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq display-line-numbers 'visual)

;; set no lsp (gets set when loading lsp.el)
(setq use-lsp-mode nil)

;; font
(add-to-list 'default-frame-alist '(font . "Cascadia Mono PL-11"))

;; ido
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; evil
(use-package evil
             :ensure t
	     :config (require 'evil)
	     (evil-mode 1))

;; which-key
(use-package which-key
  :ensure t
  :config (which-key-mode))

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
