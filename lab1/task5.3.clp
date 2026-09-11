(defrule find-specific-person
    (person (name Berta Ida) (age 30))
=>
    (printout t "Знайдено особу з ім'ям Berta Ida та віком 30" crlf)
)