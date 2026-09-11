; 1. Визначення користувацької функції для виведення результату
(deffunction print-cloud-result (?type ?tier)
    (printout t "Ідентифіковано хмару: " ?type " (" ?tier ")" crlf)
)

; 2. Шаблон для опису атрибутів хмари
(deftemplate cloud-attributes
    (slot height (type INTEGER))
    (slot appearance)
    (slot precipitation)
)

; 3. Вхідні дані (факти)
(deffacts initial-cloud
    (cloud-attributes (height 1500) (appearance листи) (precipitation ні))
)

; 4. Правила з викликом процедурної функції
(defrule identify-stratus
    (cloud-attributes (height ?h&:(<= ?h 1800)) (appearance листи) (precipitation ні))
    =>
    (print-cloud-result "Шаруваті хмари" "нижній ярус")
)

(defrule identify-cirrus
    (cloud-attributes (height ?h&:(> ?h 6000)) (appearance волосся))
    =>
    (print-cloud-result "Перисті хмари" "верхній ярус")
)