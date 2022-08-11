;; you must load common
(load "~/.emacs.d/common.el")


;; uncomment to use different functions
;;(load "~/.emacs.d/lsp.el")  ;; must be before other loads
;;(load "~/.emacs.d/work.el")

;; individual langs. Do not use if loaded by a previous file.
;;(load "~/.emacs.d/langs/csharp.el")     ;; used by work.el
;;(load "~/.emacs.d/langs/powershell.el") ;; used by work.el
(load "~/.emacs.d/langs/yaml.el")

;; org-superstar
(use-package org-superstar
  :ensure t
  :hook (org-mode . (lambda () (org-superstar-mode 1))))

;; auto-update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; org emphasis
(org-hide-emphasis-markers t)
(defun org-toggle-emphasis ()
  "Toggle hiding/showing of org emphasize markers."
  (interactive)
  (if org-hide-emphasis-markers
      (set-variable 'org-hide-emphasis-markers nil)
    (set-variable 'org-hide-emphasis-markers t)))
(define-key org-mode-map (kbd "C-c e") 'org-toggle-emphasis)

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; wrap text
(add-hook 'text-mode-hook 'visual-line-mode)


