## O czym teraz będzie

Ten rozdział jest tylko po to, żeby zwrócić Twoją uwagę na głębsze znaczenie tego, z czym się
właśnie zetknęłaś.

<hr>

Najważniejsze, co robi Lean, to *ewaluacja* (inaczej redukcja) aplikacji i *sprawdzanie poprawności
kodu*. Oba te procesy są realizowane przez pewne *algorytmy*, co oznacza, że *każdy* fragment kodu
może być w skończonym czasie sprawdzony pod względem poprawności i *każdy* poprawny fragment kodu
może być w skończonym czasie zredukowany do najprostszej postaci.

Żeby zrozumieć, jak ten proces działa w każdym możliwym przypadku, wystarczy na razie, jeżeli
zrozumiesz, jak działa w przypadku uogólnionej identyczności. Wszystkie inne przykłady będą tylko
wariacjami na ten temat (ilustracja):

```lean
def identycznosc (typ : Type) (parametr : typ) : typ := parametr

#check Nat -- Nat : Type

#check 1   -- 1 : Nat

#check @identycznosc       -- identycznosc       : (typ : Type) → typ → typ

#check @identycznosc Nat   -- identycznosc Nat   : Nat → Nat

#check @identycznosc Nat 1 -- identycznosc Nat 1 : Nat

#eval identycznosc Nat 1

-->
(fun (typ : Type) => fun (parametr : typ) => parametr) Nat 1 -- ... : Nat

-->
(fun (parametr : Nat) => parametr) 1                         -- ... : Nat

-->
1                                                            -- ... : Nat
```

Jak widać na tym przykładzie, ewaluacja to proces redukcji aplikacji funkcji do termów typu
pasującego do parametrów tych funkcji. Polega na wykonywaniu do skutku, to jest do postaci, w której
nie ma już żadnych redukowalnych aplikacji:

1. Rozwijania definicji.

2. Konsekwentnego zastępowania zmiennych w ciałach funkcji argumentami ich aplikacji.

3. Podstawiania zachodzącego na poziomie typów aplikowanych funkcji.

To proces, który na podstawie omówionych przeze mnie do tej pory przykładów możesz, jeżeli będziesz
dość cierpliwa, niebawem w pełni zrozumieć (o ile to się już nie stało), bo ten proces polega tylko
na tym, co Ci do tej pory pokazałem.

A żeby zwiększyć Twoją tolerancję dla [niewyjaśnionych
tajemnic](https://en.wikipedia.org/wiki/Unsolved_Mysteries), która w najbliższym czasie bardzo Ci
się przyda, proponuję, żebyś wkleiła do Leana poniższy fragment poprawnego kodu, zawierający
definicję jeszcze *uniwersalniejszej*[^1] identyczności. Mam nadzieję, że nic z tego nie rozumiesz,
bo dodałem tu ten fragment tylko po to, żeby przyzwyczaić Cię do tego, że możesz pewnych rzeczy nie
rozumieć a mimo to czytać dalej.

```lean
universe u

def uidentycznosc (typ : Type u) (parametr : typ) : typ := parametr

#check (uidentycznosc : uidentycznosc (Type 1) ((typ : Type) → typ → typ))

#check uidentycznosc ((typ : Type) → typ → typ) uidentycznosc

#check uidentycznosc ((typ : Type) → typ → typ)
    (uidentycznosc ((typ : Type) → typ → typ) uidentycznosc)

#eval uidentycznosc ((typ : Type) → typ → typ)
    (uidentycznosc ((typ : Type) → typ → typ) uidentycznosc) Nat 1
```

O języku teorii typów wiemy, że w przypadku poprawnego składniowo kodu ewaluacja musi się zakończyć
i wynik zawsze będzie ten sam, niezależnie od kolejności redukowanych po drodze aplikacji.

Wersja teorii typów, z której tutaj korzystamy, jest bardzo ekspresyjna w tym znaczeniu, że funkcje
mogą przekształcać termy dowolnego typu, w tym również dowolne *typy*, w termy dowolnego typu, w tym
również dowolne *typy*. Możemy więc między innymi definiować funkcje, które *tworzą typy* i niebawem
będziemy z tego korzystać. A ponadto typy pojawiające się później w specyfikacji typu funkcji mogą
zależeć od parametrów, które pojawiły się wcześniej, tak jak to ma miejsce w przypadku typu funkcji
`identycznosc`.

Na tej podstawie można zbudować *całą matematykę* i za pomocą tego języka można zapisać w stosunkowo
*naturalny* i *czytelny* sposób matematyczne teorie.

Moim zdaniem wszystko, co można zrozumieć, da się powiedzieć jasno i *pokażę* Ci, że wszystko, co da
się powiedzieć jasno, można zapisać w języku teorii typów. A wiemy, że wszystko, co zostało zapisane
w języku teorii typów, można sprawdzić i zredukować do najprostszej możliwej i zarazem unikalnej
takiej postaci za pomocą algorytmu.

### Przypisy

[^1]: [Muß es sein? Es muß sein!](https://en.wikipedia.org/wiki/String_Quartet_No._16_(Beethoven))
