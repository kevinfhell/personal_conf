(setq default-directory "c:/Dropbox/org")  
  
(setq default-buffer-file-coding-system 'utf-8)  
(prefer-coding-system 'utf-8)  
  
;;Emacs chinese environment  
(set-language-environment 'Chinese-GB)  
(set-keyboard-coding-system 'euc-cn)  
(set-clipboard-coding-system 'euc-cn)  
(set-terminal-coding-system 'euc-cn)  
(set-buffer-file-coding-system 'euc-cn)  
(set-selection-coding-system 'euc-cn)  
(modify-coding-system-alist 'process "*" 'euc-cn)  
(setq default-process-coding-system '(euc-cn . euc-cn)) ;;从网上抄来时，.两边没有空格，这是不对的。;;在执行命令时会提示 出错。 
(add-to-list 'load-path
             "~/.emacs.d/plugins/")
(require 'htmlize)
(setq org-src-fontify-natively t)   
(setq org-export-with-sub-superscripts nil)
;;(setq org-export-with-sub-superscripts '{})
(require 'unicad)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(calendar-week-start-day 1)
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(custom-enabled-themes (quote (misterioso)))
 '(make-backup-files nil)
 '(org-icalendar-include-todo t)
 '(nil nil t)
 '(normal-erase-is-backspace t)
 '(org-agenda-files (quote ("c:/Dropbox/GTD/timelog.org" "c:/Dropbox/GTD/taskdiary.org" "c:/Dropbox/GTD/someday.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-repeating-timestamp-show-all nil)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-window-setup (quote other-window))
 '(org-deadline-warning-days 7)
 '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://kevinfhell.github.io/worg.css\">")
;; '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://manan.org/doc/style/emacs.css\">")
;; '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://files.cnblogs.com/csophys/orgstyle.css\">")
 '(org-fast-tag-selection-single-key nil)
 '(org-log-done (quote (done)))
 '(org-refile-targets (quote (("taskdiary.org" :maxlevel . 1) ("someday.org" :level . 2))))
 '(org-reverse-note-order nil)
 '(org-tags-column -78)
 '(org-tags-match-list-sublevels nil)
 '(org-time-stamp-rounding-minutes 5)
 '(org-use-fast-todo-selection t)
 '(org-use-tag-inheritance nil))

;; Highlight text chosen in with Mark region
(transient-mark-mode t)

; Save files in DOS mode
(setq-default buffer-file-coding-system 'raw-text-dos)

(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

; dont use tabs for indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)


(setq org-latex-to-pdf-process '("xelatex -interaction nonstopmode %f"
                                 "xelatex -interaction nonstopmode %f"))

;; these lines only if org-mode is not part of the X/Emacs distribution.
(autoload 'org-mode "org" "Org mode" t)
(autoload 'org-diary "org" "Diary entries from Org mode")
(autoload 'org-agenda "org" "Multi-file agenda from Org mode" t)
(autoload 'org-store-link "org" "Store a link to the current location" t)
(autoload 'orgtbl-mode "org" "Org tables as a minor mode" t)
(autoload 'turn-on-orgtbl "org" "Org tables as a minor mode")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done nil)
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)
(autoload 'remember "remember" nil t)
(autoload 'remember-region "remember" nil t)

(setq org-directory "~/orgfiles/")
(setq org-default-notes-file "~/.notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
     '(
      ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "c:/GTD/dingogtd.org" "Tasks")
      ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "C:/GTD/privatenotes.org")
      ("WordofDay" ?w "\n* %^{topic} \n%i%?\n" "C:/GTD/wotd.org")
      ))

(define-key global-map [f11] 'remember)
(define-key global-map [f9] 'remember-region)

(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))
(setq org-capture-templates
      '(("a" "Appointment" entry (file+headline "c:/Dropbox/GTD/taskdiary.org" "Calendar") 
"* APPT %^{Description} %^g 
%? 
Added: %U")
        ("n" "Notes" entry (file+datetree "c:/Dropbox/GTD/taskdiary.org") 
"* %^{Description} 
%? 
Added: %U")
        ("t" "Task Diary" entry (file+datetree "c:/Dropbox/GTD/taskdiary.org") 
"* TODO %^{Description}  %^g
%?
Added: %U") 

        ("j" "Journal" entry (file+datetree "c:/Dropbox/GTD/workjournal.org") 
"** %^{Heading}") 
        ("l" "Log Time" entry (file+datetree "c:/Dropbox/GTD/timelog.org" ) 
"** %U - %^{Activity}  :TIME:")
       ("b" "Books to read" entry (file+headline "c:/Dropbox/GTD/someday.org" "Books to read") 
"* %^{Title} 
%? 
Added: %U")
       ("f" "Films to watch" entry (file+headline "c:/Dropbox/GTD/someday.org" "Films to watch") 
"* %^{Title} 
%? 
Added: %U")
       ("d" "Things to do" entry (file+headline "c:/Dropbox/GTD/someday.org" "Things to do") 
"* %^{Title} 
%? 
Added: %U")
       ("l" "Things to learn" entry (file+headline "c:/Dropbox/GTD/someday.org" "Things to learn") 
"* %^{Title} 
%? 
Added: %U")
       ("p" "New projects" entry (file+headline "c:/Dropbox/GTD/someday.org" "New projects") 
"* %^{Title} 
%? 
Added: %U")
))

(setq org-default-notes-file (concat org-directory "c:/Dropbox/GTD/notes.org"))
     (define-key global-map [f12] 'org-capture)
(setq org-agenda-custom-commands
'(

("P" "Projects"   
((tags "PROJECT")))

("H" "Office and Home Lists"
     ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "MPHONE")
          (tags-todo "READING")))

("D" "Daily Action List"
     (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
)
)

(defun gtd ()
    (interactive)
    (find-file "c:/Dropbox/GTD/taskdiary.org")
)

(defun notes ()
    (interactive)
    (find-file "c:/Dropbox/org/notes.org")
)
(global-set-key (kbd "C-c g") 'gtd)
(global-set-key (kbd "C-c n") 'notes)


(add-hook 'org-agenda-mode-hook 'hl-line-mode)

; org mode start - added 20 Feb 2006
;; The following lines are always needed. Choose your own keys.

(global-font-lock-mode t)

(global-set-key "\C-x\C-r" 'prefix-region)
(global-set-key "\C-x\C-l" 'goto-line)
(global-set-key "\C-x\C-y" 'copy-region-as-kill)

 ;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(set-variable 'confirm-kill-emacs 'yes-or-no-p)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Î˘ČíŃĹşÚ" :foundry "outline" :slant normal :weight normal :height 128 :width normal)))))
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
(put 'narrow-to-region 'disabled nil)
(setq org-export-with-sub-superscripts '{})

(set-language-environment 'UTF-8)
;;
(set-keyboard-coding-system 'utf-8)
;;终端的编码
(set-terminal-coding-system 'utf-8)
;;buffer内文字的编码
(set-buffer-file-coding-system 'utf-8)
;;
(set-selection-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
;;使用utf-8显示文件名
(set-file-name-coding-system 'utf-8)
;;
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)

;; Emacs 不支持 gb18030，如果 gb2312 能看到，就看到，看不到就看不到了，
;; 索性认为 gb18030 也是 gb2312 罢。
;(define-coding-system-alias 'gb18030 'gb2312)

;; ;;
; (set-language-environment 'utf-8)
;; ;;
;; (setq locale-coding-system 'utf-8)
;; (prefer-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (set-clipboard-coding-system 'ctext)
;; (set-buffer-file-coding-system 'utf-8)

;;字体解码
;;
(setq font-encoding-alist
  (append
  '(("MuleTibetan-0" (tibetan . 0))
  ("GB2312" (chinese-gb2312 . 0))
  ("GBK" (chinese-gbk . 0))
  ("JISX0208" (japanese-jisx0208 . 0))
  ("JISX0212" (japanese-jisx0212 . 0))
  ("VISCII" (vietnamese-viscii-lower . 0))
  ("KSC5601" (korean-ksc5601 . 0))
  ("MuleArabic-0" (arabic-digit . 0))
  ("MuleArabic-1" (arabic-1-column . 0))
  ("MuleArabic-2" (arabic-2-column . 0)))
  font-encoding-alist))

(require 'org-publish)
(setq org-publish-project-alist
            '(
              ;; These are the main web files
              ("org-notes"
                :base-directory "c:/Dropbox/org" ;; Change this to your local dir
                :base-extension "org"
                :publishing-directory "c:/Dropbox/www"
                :recursive t
                :publishing-function org-publish-org-to-html
                :headline-levels 4             ; Just the default for this project.
                :auto-preamble t
                :section-numbers nil
                :table-of-contents t
                :section-numbers nil
                :creator-info nil
                :email-info t
                :link-up "#"
                :link-home "theindex.html"
                :author "Kevin Gao"
                :email "leijia.gao@nsn.com"
                :makeindex t
                )

              ;; These are static files (images, pdf, etc)
              ("org-static"
                :base-directory "c:/Dropbox/org" ;; Change this to your local dir
                :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|txt\\|asc"
                :publishing-directory "c:/Dropbox/www"
                :recursive t
                :publishing-function org-publish-attachment
                )

              ("org" :components ("org-notes" "org-static"))
              )
            )
