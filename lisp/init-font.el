;;; init-font.el --- emacs启动文件(字体设置)

;;; commentary:
;; emacs启动文件(字体设置)

;;; code:
(defun eye-update-font-size ()
  ;; English font
  (set-face-attribute
   'default nil
   :font (font-spec :family "Source Code Pro"
;;   :font (font-spec :family "PingFang SC Bold"
                    :weight 'normal
                    :slant 'normal
		    :width 'normal
                    :size 12))
  
  ;; Chinese font
  (if (display-graphic-p)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font
	 (frame-parameter nil 'font)
	 charset
	 (font-spec :family "PingFang SC Bold"
                    :weight 'normal
                    :slant 'normal
		    :width 'normal
                    :size 12))))
  )

(eye-update-font-size)



(provide 'init-font)
;;; init-font.el ends here
