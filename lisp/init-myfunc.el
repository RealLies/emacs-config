;;; init_myfunc.el --- emacs自定义函数启动文件

;;; commentary:
;; emacs启动文件(emacs自定义函数)

;;; code:




;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;;显示加载时间
;; (defvar mage-init-time 'nil) (defun mage-display-benchmark()
;;   (message "Mage loaded %s packages in %.03fs"
;;            (length package-activated-list)
;;            (or mage-init-time
;;                (setq mage-init-time
;;                      (float-time (time-subtract (current-time) before-init-time))))))
;; (add-hook 'emacs-startup-hook #'mage-display-benchmark)




(provide 'init-myfunc)
;;; init-myfunc.el ends here
