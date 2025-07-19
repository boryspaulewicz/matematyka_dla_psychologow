<!-- -*- coding: utf-8 -*- -->
### O czym teraz będzie

Jeszcze dokładnie nie wiem.

## Μονοειδές

Zaczniemy od wprowadzenia narzędzi programistycznych, które, ponieważ są fragmentami struktury
pewnego języka (w tym wypadku Leana), jak *każde* takie fragmenty pozwalają myśleć o różnych
sprawach w nowy i kontrolowany sposób. W tym między innymi celu wracamy do łączności działań i do
replikowania ukrytej mechaniki prozy matematycznej w kodzie.

W książkach dotyczących algebry abstrakcyjnej można znaleźć tego rodzaju zdania ...

*[Monoid](https://pl.wikipedia.org/wiki/Monoid) to trójka `(M, *, u)` złożona ze zbioru `M`,
określonego na nim działania `*` i elementu neutralnego `u` ze względu na to działanie*.

... albo tego rodzaju zdania:

*Monoid to zbiór wyposażony w łączne działanie `*` i zawierający element neutralny `u` ze względu na
to działanie*.

Zwracam uwagę, że chociaż pojawił się tutaj symbol `*`, w definicji monoidu chodzi o dowolne
działania o wymienionych własnościach, nie tylko takie, które mogą się kojarzyć z mnożeniem. Zresztą
matematycy oznaczają działania monoidalne (jeśli można je tak nazwać) rozmaicie, zwykle wybierając
symbole, których nie używają w danym kontekście do czegoś innego.

Gdy matematycy mówią, że coś jest (niekoniecznie monoidalym) *działaniem na zbiorze `X`*, mają
najczęściej na myśli (między innymi) bycie *funkcją* o postaci `X × X → X`. Na przykład, dodawanie
jest działaniem między innymi na zbiorze liczb naturalnych w tym właśnie znaczeniu, że każdej
uporządkowanej parze liczb naturalnych `(m, n)` przyporządkowuje unikalną liczbę naturalną `m + n`,
którą nazywamy wynikiem tego działania dla tej pary liczb. Jak sądzę nie będzie już w tym momencie
dla Ciebie zaskoczeniem, że ostatnie zdanie mówi to samo, co wyrażenie `+ : ℕ × ℕ → ℕ`, występujące
w tym kontekście w roli zdania, które ma być odczytane jako *`+` jest działaniem na zbiorze liczb
naturalnych*.

Przykładami monoidów są między innymi trójki `(ℕ, +, 0)` i `(ℕ, ×, 1)`, a mówiąc bardziej swobodnie,
liczby naturalne ze względu na dodawanie i mnożenie, a mówiąc swobodnie i maksymalnie skrótowo,
dodawanie i mnożenie liczb naturalnych. To są przykłady monoidów, ponieważ oba działania są łączne i
gdy ograniczamy się do zbioru liczb naturalnych, w obydwu przypadkach znajdujemy elementy neutralne
ze względu na te działania.

To może się wydawać oczywiste, ale w praktyce początkowo łatwo o tym zapomnieć: *Mówiąc o pewnych
strukturach jako o monoidach ogłaszamy, że w dalszym rozumowaniu będziemy uwzględniać tylko łączność
i obecność elementu neutralnego*. Inaczej mówiąc ogłaszamy w ten sposób, że bez wprowadzenia
dodatkowych założeń czy dokonania dodatkowych wyborów *nie* będziemy korzystać z takich własności
jak na przykład przemienność albo odwracalność, ponieważ działania monoidalne mogą, ale nie muszą
mieć takich własności.

Po co mielibyśmy *ignorować* coś, o czym być może wiemy, że istnieje albo jest prawdą i że jest,
mówiąc ogólnie, ważne, na przykład własność przemienności, która faktycznie przysługuje niektórym
działaniom monoidalnym takim jak dodawaniu liczb i która to własność jest bez wiątpienia ważna w
wielu różnych sytuacjach? Otóż po to, żeby *ustalić coś na wyższym poziomie ogólności*. Działanie
łączne nie musi być przemienne ani odwracalne i wiele działań łącznych nie ma co najmniej jednej z
tych własności. Cokolwiek uda nam się ustalić na temat monoidów, będziemy mogli zastosować zarówno
do działań łącznych, które są jednocześnie przemienne albo odwracalne, jak i do takich, które nie
są. 

Ze słabszych założeń z definicji wynika na ogół mniej. Im wyższy poziom ogólności, to znaczy im
mniej albo im słabsze własności zakładamy, tym więc na ogół *trudniej* o nietrywialne wnioski, ale
też tym potencjalnie większe jest *znaczenie* ewentualnych wniosków, bo więcej jest okazji do ich
zastosowania. Również dlatego warto starać się ustalać, z jakich założeń *musimy* korzystać dowodząc
rozmaitych twierdzeń, a z jakich *nie* musimy, w czym zresztą bardzo pomaga pełna formalizacja.

Z drugiej strony, skupiając się na słabszych założeniach czy ogólniejszych konstrukcjach osiągamy
też czasem ważne korzyści natury *psychologicznej*. Mam na myśli mniejszą *dezorientację* wynikającą
z mniejszej liczby uwzględnianych aspektów, dzięki której jakiś problem może być *łatwiej*
rozwiązać, gdy rozważamy jego wersję *ogólniejszą*. To jest o ile nie będzie nam za bardzo
przeszkadzać ewentualna relatywnie mała liczba konkretnych przykładów, co może wymagać trochę
czasu. Dlatego może być na przykład potencjalnie łatwiej zrozumieć, o co chodzi w *całej*
psychologii, *nie* przyglądając się *realistycznym* przykładom badań lub teorii, zamiast tego
poszukując przykładów po angielsku określanych często jako *zabawkowe* (ang. *toy*; więcej na ten
temat znajdziesz [tu](https://en.wikipedia.org/wiki/Toy_problem) i
[tam](https://en.wikipedia.org/wiki/Toy_model)).

To może być jeden z powodów, dla których Pearl, który stworzył aksjomatyczną teorię przyczynowości,
tak bardzo lubi zabawkowe przykłady, tak często je przytacza i tak często pyta, jak rozmaite
alternatywne "podejścia" do przyczynowości sobie z nimi radzą (o ile się orientuję, okazuje się
wtedy zawsze, że w ogóle sobie nie radzą). Korzystając z zabawkowych przykładów trzeba jednak
oczywiście próbować ustalić, czy, w jakim stopniu, lub pod jakim względem są *reprezentatywne*.

Przytoczoną półformalną definicję monoidu możemy rozpakować między innymi tak:

1. Monoid to *trzy* obiekty albo struktury. Żeby "mieć" monoid musimy *wskazać* albo *otrzymać* ...

   1. ... jakiś *zbiór* `M`, ...

   2. ... *funkcję* `* : M × M → M`, którą *możemy* nazywać działaniem tego monoidu ...

   3. ... i wyróżniony *element* `u ∈ M`, który *możemy* nazywać elementem neutralnym (tego monoidu
    \{ze względu na to działanie\}).

2. Żeby *móc nazywać* jakąś funkcję działaniem monoidu i jakiś element jego elementem neutralnym
musimy *wykazać* albo *założyć*, że ...

   1. ... to działanie jest łączne, to znaczy ...
   
   `∀ a, b, c ∈ M, (a * b) * c = a * (b * c)`,

   2. ... a wyróżniony element jest elementem neutralnym ze względu na to działanie, to znaczy:
   
   `∀ a ∈ M, u * a = a * u = a`.

Jednym ze sposobów badania nieuchronnych konsekwencji tych i tylko tych własności działań - czyli
samej "monoidalności" - w Leanie jest skorzystanie z typów danych występujących w wielu językach
programowania i nazywanych *rekordami* albo (częściej)
[*strukturami*](https://pl.wikipedia.org/wiki/Struktura_(programowanie)). Zwracam przy okazji uwagę,
że definicja podana w polskim artykule (tak to [się](https://pl.wikipedia.org/wiki/Pomoc:Edytowanie)
nazywa) Wikipedii zawiera (w tym momencie, to jest 2025.07.19) na samym początku dwa stwierdzenia,
które w ogólnym przypadku *nie* są prawdziwe.

Żeby jakiś typ danych był strukturą, *nie* musi zawierać żadnych *powiązanych logicznie*
informacji. To jest tylko typowe *zastosowanie* struktur albo element tak zwanego "dobrego stylu"
programowania. No i części struktury *nie* muszą zajmować sąsiadujących obszarów w pamięci
komputera. Tak się składa, że w przypadku niektórych ważnych języków
[*imperatywnych*](https://pl.wikipedia.org/wiki/Programowanie_imperatywne), takich jak choćby
[*C*](https://pl.wikipedia.org/wiki/C_(j%C4%99zyk_programowania)), które mają fundamentalnie inny
charakter niż języki [*funkcyjne*](https://pl.wikipedia.org/wiki/Programowanie_funkcyjne) (takie jak
Lean), zajmują, ale w czystych językach funkcyjnych ten aspekt nie ma akurat większego znaczenia, bo
programy napisane w czystych językach funkcyjnych *nie służą do opisu zmian fizycznego stanu
komputera*.

