(in-package :rtg-math.base-maths)

(defconstant +pi+ 3.141592653589793f0)
(defconstant +inv-pi+ 0.3183098862f0)
(defconstant +one-degree-in-radians+ 0.017453292519943295f0)
(defconstant +one-radian-in-degrees+ 57.29577951308232f0)
(defconstant +k-epsilon+ 1.e-6)

;; I found the 'earmuffs' on the 'pi' related constants above very frustrating
;; to type when live coding. These are easier and also fit more with CL's pi
;; constant

(defconstant 2pi 6.283185307179586d0)
(defconstant 0.5pi 1.5707963267948966d0)
(defconstant inv-pi 0.3183098861837907d0)

(defconstant pi-f 3.141592653589793f0)
(defconstant 2pi-f 6.283185307179586f0)
(defconstant 0.5pi-f 1.5707963267948966f0)
(defconstant inv-pi-f 0.3183098861837907f0)

;;----------------------------------------------------------------

(declaim (inline sfzero-p))
(defun sfzero-p (f)
  (declare (single-float f) (optimize speed))
  (< (abs f) +k-epsilon+))

;;----------------------------------------------------------------

(defun clamp (min max val)
  (min (max val min) max))

(declaim (inline clampf)
         (ftype (function (single-float single-float single-float)
                          single-float)
                clampf))
(defun clampf (min max float)
  (declare (single-float min max float))
  (the single-float (min (max float min) max)))

;;----------------------------------------------------------------

(declaim (inline inv-sqrt)
         (ftype (function (single-float)
                          single-float)
                inv-sqrt))
(defun inv-sqrt (x)
  "Calculates the inverse square root of a number"
  (declare (single-float x))
  (/ 1f0 (sqrt x)))

;;----------------------------------------------------------------

(declaim (inline radians-f)
         (ftype (function (single-float) single-float) radians-f))
(defun radians-f (degrees)
  (declare (single-float degrees))
  (the single-float (* degrees +one-degree-in-radians+)))

(declaim (inline degrees-f)
         (ftype (function (single-float) single-float) degrees-f))
(defun degrees-f (radians)
  (declare (single-float radians))
  (the single-float (* radians +one-radian-in-degrees+)))

(declaim (inline radians)
         (ftype (function ((or integer single-float)) single-float)
                radians))
(defun radians (degrees)
  (radians-f (the single-float (float degrees))))

(declaim (inline degrees)
         (ftype (function ((or integer single-float)) single-float)
                degrees))
(defun degrees (radians)
  (degrees-f (the single-float (float radians))))
