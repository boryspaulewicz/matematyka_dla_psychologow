<!-- -*- coding: utf-8 -*- -->
### O czym teraz będzie

Jeszcze dokładnie nie wiem.

## Μονοειδές

Zaczniemy od wprowadzenia narzędzi programistycznych, które, ponieważ są fragmentami struktury
pewnego języka (w tym wypadku Leana), jak każde takie fragmenty pozwalają myśleć o pewnych sprawach
w nowy i kontrolowany sposób. W tym między innymi celu wracamy do wątków łączności działań i
replikowania ukrytej mechaniki prozy matematycznej w kodzie.

W książkach dotyczących algebry abstrakcyjnej można znaleźć tego rodzaju zdania ...

*[Monoid](https://pl.wikipedia.org/wiki/Monoid) to trójka `(M, *, u)` złożona ze zbioru `M`,
określonego na nim działania `*` i elementu neutralnego `u` ze względu na to działanie*.

... albo tego rodzaju zdania:

*Monoid to zbiór `M` wyposażony w łączne działanie `*` i zawierający element neutralny `u` ze
względu na to działanie*.

Gdy matematycy mówią, że coś jest *działaniem na zbiorze `X`*, mają zwykle na myśli (między innymi)
bycie *funkcją* o postaci `X × X → X`. Na przykład, dodawanie jest działaniem między innymi na
zbiorze liczb naturalnych w tym właśnie znaczeniu, że każdej uporządkowanej parze liczb naturalnych
`(m, n)` przyporządkowuje unikalną liczbę naturalną `m + n`, którą nazywamy wynikiem tego działania
dla tej pary liczb. Jak sądzę nie będzie już w tym momencie dla Ciebie zaskoczeniem, że ostatnie
zdanie mówi to samo, co `+ : ℕ × ℕ → ℕ`.

Przykładami monoidów są między innymi trójki `(ℕ, +, 0)` i `(ℕ, ×, 1)`, a mówiąc bardziej swobodnie,
liczby naturalne ze względu na dodawanie i mnożenie, a mówiąc swobodnie i maksymalnie skrótowo,
dodawanie liczb naturalnych i mnożenie liczb naturalnych. To są przykłady monoidów, ponieważ oba te
działania są łączne i gdy ograniczamy się do zbioru liczb naturalnych, w obydwu przypadkach
znajdujemy w tym zbiorze elementy neutralne ze względu na te operacje.

Uwaga: *Mówiąc o pewnych strukturach jako o monoidach ogłaszamy, że w dalszym rozumowaniu będziemy
uwzględniać tylko łączność i obecność elementu neutralnego*. A więc ogłaszamy w ten sposób, że bez
wprowadzenia dodatkowych założeń czy dokonania dodatkowych wyborów nie będziemy korzystać z takich
własności jak na przykład przemienność albo odwracalność. 

Po co mielibyśmy *ignorować* coś, o czym wiemy, że istnieje albo jest prawdą i że jest, mówiąc
ogólnie, ważne, na przykład własność przemienności, która faktycznie przysługuje dodawaniu liczb i
która jest bez wiątpienia ważna w wielu różnych sytuacjach? Ano po to, żeby *ustalić coś na wyższym
poziomie ogólności*. Działanie łączne nie musi być przemienne ani odwracalne i wiele działań
łącznych nie ma co najmniej jednej z tych własności. Cokolwiek uda nam się ustalić na temat
monoidów, będziemy mogli zastosować zarówno do działań łącznych, które są jednocześnie przemienne
albo odwracalne, jak i do takich, które nie są. Im wyższy poziom ogólności, to znaczy im mniej albo
im słabsze własności zakładamy, tym *trudniej* o jakieś wnioski (bo mniej zakładamy), ale też tym
większe jest *znaczenie* ewentualnych wniosków, bo więcej jest okazji do ich zastosowania. Również
dlatego warto starać się ustalać, z jakich dokładnie założeń *musimy* korzystać dowodząc rozmaitych
twierdzeń.

Przytoczoną półformalną definicję monoidu możemy więc rozpakować między innymi tak: 

1. Monoid to trzy obiekty albo struktury. Żeby "mieć" monoid musimy *wskazać* albo *otrzymać* ...

   1. ... jakiś zbiór `M`, ...

   2. ... funkcję `* : M × M → M` (przypominam, że gwiazdka jest tutaj nazwą funkcji \{o postaci `X
× X → X`, a więc można tą funkcję nazywać działaniem\}), którą będziemy mogli nazywać działaniem
tego monoidu, ...

   3. ... a także element `u ∈ M`, który będziemy mogli nazywać elementem neutralnym (tego monoidu
    \{ze względu na to działanie\}).

2. Żeby móc nazywać jakąś funkcję działaniem monoidu i jakiś element jego elementem neutralnym
musimy wykazać albo założyć, że ...

   1. ... to działanie jest łączne, to znaczy `∀ a, b, c ∈ M, (a * b) * c = a * (b * c)`, ...

   2. ... a wyróżniony element jest elementem neutralnym ze względu na to działanie, to znaczy `∀ a
    ∈ M, u * a = a * u = a`.

