;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Johannes Coetzee"
      user-mail-address "jcoetzee@protonmail.com")

(defun prepend-directory-to-path (dir)
  (unless (member dir exec-path)
    (setenv "PATH" (concat dir path-separator (getenv "PATH")))
    (add-to-list 'exec-path dir)))

(let* ((home (getenv "HOME"))
       (gopath (concat home "/.local/go/bin")))
  (setenv "GOPATH" gopath)
  (prepend-directory-to-path (concat home "/.local/bin"))
  (prepend-directory-to-path gopath)
  (prepend-directory-to-path (concat home "/.nvm/versions/node/v19.9.0/bin"))
  (prepend-directory-to-path (concat home "/.sdkman/candidates/scala/current/bin"))
  (prepend-directory-to-path (concat home "/.sdkman/candidates/sbt/current/bin"))
  (prepend-directory-to-path (concat home "/.sdkman/candidates/java/current/bin")))

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "MonoLisa Nerd Font" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(load-theme 'doom-one t)
(set-face-attribute 'font-lock-comment-face nil :foreground (doom-color 'dark-cyan))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(after! treemacs (setq display-line-numbers-type t))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files '("~/org/"))
(setq org-roam-directory "~/.org-roam")
(setq org-roam-database-connector 'sqlite3)

(setq org-roam-dailies-directory "daily/")
(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?\n\n"
         :empty-lines-after 1
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%Y-%m-%d>\n"))))

(map! :leader
      (:prefix ("n")
       :desc "Capture today" "h" #'org-roam-dailies-capture-today))

(after! org
  (setq org-todo-keywords
        '((sequence "TODO" "IN_PROGRESS" "REVIEW" "|" "DONE")))
  )

(after! org (setq org-enforce-todo-dependencies t))

(defun my-org-agenda-skip-if-inherited-timestamp ()
  "Skip item with an inherited timestamp according to the org-agenda settings..
Uses built-in `org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item'."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (ignore-item-p (org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item nil)))
    (while (and (org-up-heading-safe) (null ignore-item-p))
      (setq ignore-item-p (org-agenda-check-for-timestamp-as-reason-to-ignore-todo-item nil)))
    (when ignore-item-p
      subtree-end)))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "" (
                      (org-agenda-span 5)
                      (org-agenda-start-day "+1d")))
          (tags-todo "work"
                     ((org-agenda-skip-if 'scheduled)))))))

(after! treemacs (setq treemacs-collapse-dirs 3))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! org-when)
(use-package! scala-mode
  :init
  (setq scala-indent:use-javadoc-style nil))
