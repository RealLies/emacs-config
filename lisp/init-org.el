;;; init-org.el --- emacs的org启动文件

;;; commentary:
;; emacs启动文件(emacs的org设置)

;;; code:


(require 'org)


(setq org-src-fontify-natively t)
(setq org-pretty-entities 1)
(setq org-startup-with-inline-images t)
(defun shk-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))
(add-hook 'org-babel-after-execute-hook 'shk-fix-inline-images)



(use-package htmlize
  :defer 1
  :init
  )


;; (use-package grip-mode
;;   :defer 1
;;   :hook
;;   ((markdown-mode org-mode) . grip-mode)
;;   :bind
;;   ("C-c p" . grip-mode)
;; )


(use-package org-bullets
  :defer 1
  :init
  (require 'org-bullets)
  ;;:hook
  ;;((org-mode-hook) . org-bullets-mode)
  (add-hook 'org-mode-hook 'org-bullets-mode)
  )


(use-package ob-rust
  :ensure t)
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
			     (python . t)
			     (dot . t)
			     (ditaa . t)
			     (rust . t)
			     (scheme . t)
			     (calc . t)
)
 )


(use-package ox-twbs)


(use-package org-drill
  :ensure t
  :config
  (setq org-drill-hide-item-headings-p nil)
  (setq org-drill-auto-pronounce t)
  (setq org-drill-learn-fraction 0.25)
  (setq org-drill-add-random-noise-to-intervals-p t)
  )


(use-package org-brain
  :ensure t)


(require 'org-tempo)
(tempo-define-template "new-words"
		 '("* " p " :drill:\ntranslate the word\n" "** Chinese\n** example" >)
		 "<n"
		 "Insert a property tempate")
;;添加新单词的方法 <n 用于org-drill的使用








;; 插入图片插件
(use-package org-download
	  :ensure t 
	  ;;将截屏功能绑定到快捷键：Ctrl + Shift + Y
	  :bind
	  ("C-c o s" . org-download-screenshot)
	  ("C-c o d" . org-download-yank)
	  :config
	  (require 'org-download)
	  ;; Drag and drop to Dired
	  (add-hook 'dired-mode-hook 'org-download-enable)
	  )

(setq org-image-actual-width (/ (display-pixel-width) 3))
(provide 'init-org)
;;; init-org.el ends here
