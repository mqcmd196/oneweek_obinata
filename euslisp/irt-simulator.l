(load "package://pr2eus/pr2.l")
(load "models/room73b2-scene.l")

(defun init-irt ()
    (setq *pr2* (pr2))
    (setq *room* (room73b2))
    (setq *chair* (send *room* :object "room73b2-chair0"))
    (objects (list *pr2* *room*))
    )

(defun go-to-chair-spot ()
    ;; (setq *chair-spot* (send *chair* :worldpos))
    ;; 目標のイスの前まで移動
    (send *pr2* :move-to (make-coords :pos #f(4500 0 0) :rpy #f(0 0 0)) :world)
    (send *pr2* :move-to (make-coords :rpy (float-vector pi/2 0 0)))
    (send *pr2* :move-to (make-coords :pos #f(1600 0 0)))
    (send *pr2* :move-to (make-coords :rpy (float-vector pi/2 0 0)))
    )

(defun move-chair-with-l-hand ()
    ;; look at the chair
    (send *pr2* :head :look-at (send *chair* :worldpos))
    ;; dissoc the chair and the room
    (if (send *chair* :parent) (send (send *chair* :parent) :dissoc *chair*))
    ;; solve ik and grab the chair
    (send *pr2* :larm :inverse-kinematics
                (car (send *chair* :handle))
                :link-list (send *pr2* :link-list (send *pr2* :larm :end-coords :parent))
                :move-target (send *pr2* :larm :end-coords)
                :rotation-axis :z
                :debug-view t)
    ;; assoc the chair and the l-arm
    (send *pr2* :larm :end-coords :assoc *chair*)
    ;; pull back
    (send *pr2* :move-to (make-coords :pos #f(-350 0 0)))

    )


(defun main ()
    (init-irt)
    (go-to-chair-spot)
    ;; move-chair-with-l-hand
    )

(main)
