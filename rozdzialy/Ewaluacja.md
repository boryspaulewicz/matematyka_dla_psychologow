## O czym teraz będzie

Ten rozdział jest tylko po to, żeby zwrócić Twoją uwagę na głębsze znaczenie tego, z czym właśnie
się zetknęłaś.

<br/>

Najważniejsze, co robi Lean, to ewaluacja (inaczej redukcja) aplikacji i sprawdzanie poprawności
kodu. Żeby zrozumieć, jak ten proces działa w każdym możliwym przypadku, wystarczy, jeżeli
zrozumiesz, jak działa w przypadku uogólnionej identyczności. Wszystkie inne przykłady będą
wariacjami na ten temat.

```lean
def identycznosc (typ : Type) (argument : typ) : typ := argument

#check Nat -- Nat : Type

#check 1   -- 1 : Nat

#check @identycznosc       -- identycznosc       : (typ : Type) → typ → typ

#check @identycznosc Nat   -- identycznosc Nat   : Nat → Nat

#check @identycznosc Nat 1 -- identycznosc Nat 1 : Nat

#eval identycznosc Nat 1

-->
(fun (typ : Type) => fun (argument : typ) => argument) Nat 1 -- ... : Nat

-->
(fun (argument : Nat) => argument) 1                         -- ... : Nat

-->
1                                                            -- ... : Nat
```

Jak widać na tym przykładzie, ewaluacja to proces redukcji aplikacji funkcji do termów typu
pasującego do parametrów tych funkcji. Polega na wykonywaniu do skutku, to jest do postaci, w której
nie ma już żadnych redukowalnych aplikacji:

1. Rozwijania definicji

2. Konsekwentnego zastępowania zmiennych w ciałach funkcji argumentami ich aplikacji

3. Podstawiania zachodzącego na poziomie typów aplikowanych funkcji

To proces, który na podstawie omówionych przeze mnie do tej pory przykładów możesz, jeżeli będziesz
dość cierpliwa, niebawem w pełni zrozumieć, o ile to się już nie stało, bo ten proces polega tylko
na tym, co już Ci pokazałem.

O języku teorii typów wiemy, że w przypadku poprawnego składniowo kodu ewaluacja musi się zakończyć
i wynik zawsze będzie ten sam, niezależnie od kolejności redukowanych po drodze aplikacji.

Funkcje mogą przekształcać termy dowolnego typu, w tym również dowolne typy, w termy dowolnego typu,
w tym również dowolne typy. Typy pojawiające się później w specyfikacji typu funkcji mogą zależeć od
parametru, który pojawił się wcześniej, tak jak w przypadku typu funkcji `identycznosc`.

Na tej podstawie można zbudować całą matematykę i za pomocą tego języka można zapisać w stosunkowo
naturalny sposób matematyczne teorie.

Moim zdaniem wszystko, co można zrozumieć, da się powiedzieć jasno i wszystko, co da się powiedzieć
jasno, można zapisać w języku teorii typów. A wiemy, że wszystko, co zostało zapisane w języku
teorii typów, można sprawdzić i zredukować do najprostszej możliwej i zarazem unikalnej takiej
postaci za pomocą algorytmu.
