;;设置全局标签
;; (setq org-todo-keywords
;;       '((sequence "Office(o)" "Idle(i)" "Computer(c)" "Learning(l)" "On-the-way(w)" "Project(p)")))

;;自动更新上级任务状态为DONE,当子任务全部完成
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(auto-image-file-mode t)

;;语法高亮
(setq org-src-fontify-natively t)

;;
(define-key global-map "\C-ca" 'org-agenda)

;;C-c a H/P/D
(setq
 org-agenda-custom-commands
 '(
   ("P" "Projects"
    ((tags "Project")))

   ("H" "Office and Home Lists"
    ((agenda)
     (tags-todo "Office")
     (tags-todo "Idle")
     (tags-todo "Computer")
     (tags-todo "Learning")))

   ("D" "Daily Action List"
    ((agenda "" ((org-agenda-ndays 1)
                 (org-agenda-sorting-strategy
                  (quote ((agenda time-up priority-down tag-up) )))
                 (org-deadline-warning-days 0)
                 ))))))

(setq org-agenda-files (list "~/iCloud/GTD"
                             "~/iCloud/brain"
                             "~/iCloud/brain/tools"
                             ))
;;$ emacsclient -e "(remember-other-frame)"
;;C-c [ 将当前文件加入日程表，
;;C-c a
;;a 本周事件
;;t 显示所有事件
;;m 查询标签
;;L 当前缓冲区时间线
;;s 查询关键词
;;T 查询带 TODO 关键词的项 M 查询带 TODO 关键词的标签
;;q 退出日程表

;; 可以将多个 org 文件从日程表加入、移除，或者将日程表锁定在当前 org 文件的某个分支：
;; C-c [ 将当前文件加入日程表。如果已加入，移动到前面 C-c ]
;; 将当前文件从日程表中移除 C-c C-x < 锁定到当前树(只显示当前树的事件)
;; C-c C-x > 解除锁定

;;默认收集信息快捷键
(define-key global-map "\C-cc" 'org-capture)
(setq org-directory "~/iCloud/GTD/")

(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/iCloud/GTD/mygtd.org" "Tasks")
         "* TODO %i %? %T\n")
        ("w" "Wait" entry (file+headline "~/iCloud/GTD/mygtd.org" "Tasks")
         "* WAITING %i %? \n")
        ("p" "Private" entry (file+headline "~/iCloud/GTD/note.org" "Private")
         "\n* %^{topic} %i %? %T\n")
        ("s" "Someday/maybe" entry (file+headline "~/iCloud/GTD/mygtd.org" "Someday/maybe")
         "* TODO %i %? %T\n")
        ("r" "Reference" entry (file+headline "~/iCloud/GTD/note.org" "Reference")
         "* TODO %i %? %T\n")
        ))

;; 元素 说明
;; %?   输入文字
;; \n   插入换行符
;; %i   插入选择区域
;; %a   当前光标所在标题的链接
;; %t   插入日期
;; %T   插入日期和时间
;; %g   从目标容器的标签中选择
;; %G   从全局标签中选择
;; %t   输入日期时间

(setq org-default-notes-file (concat org-directory "mygtd.org"))

(setq org-refile-targets (quote (("~/iCloud/GTD/mygtd.org" :maxlevel . 1) ("~/iCloud/GTD/archive.org" :level . 2))))
