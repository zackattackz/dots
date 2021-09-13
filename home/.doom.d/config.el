;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zachary Hanham"
      user-mail-address "z.hanham00@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type "relative")

(require 'mozc)
(use-package prettier-js)
(use-package ewal
  :init (setq ewal-json-file "~/.cache/wal/colors.json")
  )
(setq reee (ewal-load-colors))
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(map! :leader
      :desc "mozc"
      "t J" #'mozc-mode)

(defun compile-latex ()
  "Sync org file to Raspberry Pi with external script."
  (when (eq major-mode 'latex-mode)
    (recompile)))

(add-hook 'LaTeX-mode-hook (lambda ()
                             (progn
                               (setq compile-command (concat "pdflatex " (file-name-nondirectory (buffer-file-name))))
                               (add-hook 'after-save-hook #'compile-latex)
                               )))


(require 'org-gcal)
(setq org-gcal-client-id "448352391473-0p72tent6o3c5iaegejm1m63r313eq70.apps.googleusercontent.com"
      org-gcal-client-secret (getenv "CALENDARSECRET")
      org-gcal-fetch-file-alist '(("z.hanham00@gmail.com" .  "~/org/gcal.org"))
)
