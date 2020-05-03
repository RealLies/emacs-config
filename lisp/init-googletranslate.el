;;; init-complete.el --- emacs启动文件

;; commentary:
;; emacs启动文件(emacs谷歌翻译启动文件)

;;; code:

(use-package google-translate
  :defer 1
  :bind
  ("C-c g t" . google-translate-smooth-translate)
  :init
  (require 'google-translate)
  (require 'google-translate-smooth-ui)

  ;; 设置需要翻译的语言
  (setq google-translate-translation-directions-alist
	'(("en" . "zh-CN") ("zh-CN" . "en")))

  ;; 设置确定带有翻译的窗口(缓冲区)XS在弹出时是否获得焦点
  (setq google-translate-pop-up-buffer-set-focus t)
  )





(provide 'init-googletranslate)
;;; init-googletranslate.el ends here
