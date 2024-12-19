# Kilka zadań, które mają pomóc

Być może zaglądając do wcześniejszych rozdziałów żeby zobaczyć, jak to się robi, dokończ dowody raz
definiując funkcje ręcznie, a raz za pomocą trybu interaktywnego:

```lean
theorem t1a (p : Prop) : p → p :=

-- W trybie nieinteraktywnym trzeba tutaj stworzyć funkcję, która tworzy funkcję, która tworzy funkcję. W trybie 
-- interaktywnym trzeba dwa razy użyć taktyki intro. Taktyka intro służy do (λ-)abstrachowania od termów dowolnego typu,
-- nie tylko zdaniowego. Nie wiem, który tryb będzie dla Ciebie na początku łatwiejszy, więc jeśli jeden z nich będzie
-- trudny, spróbuj drugiego.
theorem t1b : (p : Prop) → p → p :=

-- To zadanie jest najprostsze, ale może właśnie dlatego w trybie nieinteraktywnym może być szczególnie dezorientujące. 
-- Tym, co od razu masz do dyspozycji wewnątrz definicji są parametry tego twierdzenia-funkcji. Musisz tylko zapisać term,
-- którego typ jest taki, jak typ rezultatu - p. Jeżeli nie wiesz, jak to zrobić, zacznij może od trybu interaktywnego.
theorem t1c (p : Prop) (h : p) : p :=

theorem t2 (p q : Prop) : p → q → p :=

theorem t3a (p : Prop) : p → p → p :=

theorem t3b (p : Prop) (h1 : p) : p → p :=

theorem t3c (p : Prop) (h1 : p) (h2 : p) : p :=

-- Jedna z różnic między theorem i def jest taka, że definicje funkcji zapisane za pomocą słowa kluczowego theorem
-- nie są rozpakowywane. W przypadku *konstruowania* dowodu to nie ma znaczenia. To, że twierdzenia nie są
-- rozpakowywane wpływa między innymi na szybkość, z jaką Lean wykonuje pewne operacje - nie musi wtedy nic rozpakowywać
-- więc oszczędza zasoby. Poza tym Lean traktuje wszystkie dowody tego samego twierdzenia jak te same obiekty, ale tym
-- się nie musisz przejmować.
def t4 (p q : Prop) : q → p → p :=

-- Jeżeli potrzebujesz wskazówek, znajdziesz je pod koniec poprzedniego rozdziału.
axiom r : Prop
theorem t5 (p : Prop) : p → r :=
```

Gdy uda Ci się rozwiązać wszystkie te zadania, albo tylko połowę, i powiesz mi o tym
(boryslaw.paulewicz@uj.edu.pl), będę przez chwilę jeszcze bardziej szczęśliwy, niż zazwyczaj jestem.
