; Опис шаблону
(deftemplate person
    (multislot name)
    (slot age (type INTEGER))
    (slot gender (allowed-values male female))
)

; Список фактів
(deffacts people
    (person (name Ivan) (age 25) (gender male))
    (person (name Berta Ida) (age 30) (gender female))
    (person (name Anna) (age 22) (gender female))
)