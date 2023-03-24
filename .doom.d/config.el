;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Johannes Coetzee"
      user-mail-address "jcoetzee@protonmail.com")

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
(setq doom-font (font-spec :family "FiraCode" :size 16)
      doom-variable-pitch-font (font-spec :family "sans" :size 17))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

(use-package! org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "/home/johannes/org/roam"))
  :config
  (org-roam-setup)
  (org-id-update-id-locations))

(map! :leader
      (:prefix ("r" . "org-roam")
       :desc "Open random node"         "a" #'org-roam-node-random
       :desc "Find node"                "f" #'org-roam-node-find
       :desc "Find ref"                 "F" #'org-roam-ref-find
       :desc "Show graph"               "g" #'org-roam-graph
       :desc "Instert node"             "i" #'org-roam-node-insert
       :desc "Capture to node"          "c" #'org-roam-capture
       :desc "Toggle roam buffer"       "r" #'org-roam-buffer-toggle
       :desc "Launch roam buffer"       "R" #'org-roam-buffer-display-dedicated
       :desc "Sync database"            "s" #'org-roam-db-sync
       (:prefix ("d" . "by date")
        :desc "Goto previous note"        "b" #'org-roam-dailies-goto-previous-note
        :desc "Goto date"                 "d" #'org-roam-dailies-goto-date
        :desc "Capture date"              "D" #'org-roam-dailies-capture-date
        :desc "Goto next note"            "f" #'org-roam-dailies-goto-next-note
        :desc "Goto tomorrow"             "m" #'org-roam-dailies-goto-tomorrow
        :desc "Capture tomorrow"          "M" #'org-roam-dailies-capture-tomorrow
        :desc "Capture today"             "n" #'org-roam-dailies-capture-today
        :desc "Goto today"                "t" #'org-roam-dailies-goto-today
        :desc "Capture today"             "T" #'org-roam-dailies-capture-today
        :desc "Goto yesterday"            "y" #'org-roam-dailies-goto-yesterday
        :desc "Capture yesterday"         "Y" #'org-roam-dailies-capture-yesterday
        :desc "Find directory"            "-" #'org-roam-dailies-find-directory)))

(use-package! org-ref
  :after org
  :init
  :config
  )
