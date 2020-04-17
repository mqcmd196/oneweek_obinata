(load "package://pr2eus/pr2.l")
(load "models/room73b2-scene.l")

(defun init-irt ()
    (setq *pr2* (pr2))
    (setq *room* (room73b2))
    (setq *chair* (send *room* :object "room73b2-chair0"))
    (objects (list *pr2* *room*))
    )

(defun go-to-chair-spot ())
(defun c)


(defun main ()
    (init-irt)
    ;; (go-to-chair-spot)
    
    )

(main)
