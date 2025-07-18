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

Żeby jakiś typ danych był strukturą, *nie* musi zawierać żadnych *powiązanych logicznie* (swoją
drogą, wypadałoby raczej napisać *semantycznie*) informacji. To jest tylko typowe *zastosowanie*
struktur albo element tak zwanego "dobrego stylu" programowania. No i części struktury *nie* muszą
*zajmować sąsiadujących obszarów w pamięci komputera*. Tak się składa, że w przypadku niektórych
ważnych języków [*imperatywnych*](https://pl.wikipedia.org/wiki/Programowanie_imperatywne), takich
jak choćby [*C*](https://pl.wikipedia.org/wiki/C_(j%C4%99zyk_programowania)), które mają zasadniczo
inny charakter niż języki [*funkcyjne*](https://pl.wikipedia.org/wiki/Programowanie_funkcyjne)
(takie jak Lean), zajmują, ale w czystych językach funkcyjnych ten aspekt nie ma akurat większego
znaczenia, bo programy napisane w czystych językach funkcyjnych *nie służą do opisu zmian fizycznego
stanu komputera*.

<hr>

**Dygresja na temat czystych języków funkcyjnych i języków imperatywnych**: Różnica między tymi
dwoma rodzajami języków może być nawet trudniejsza do zrozumienia dla zawodowych informatyków niż
dla Ciebie (zakładając, że nie należysz do tej grupy zawodowej), co potwierdzają zresztą informacje
zwrotne, jakie otrzymałem od uczestników kursu wprowadzającego do wnioskowania przyczynowego i
statystycznego, który prowadzę dla doktorantów. Mam wątpliwości, czy powinienem o tym mówić już na
tym etapie, proszę więc, żebyś potraktowała te uwagi jako ciekawostkę i zapowiedź przyszłych
niespodzianek.

Gdy na przykład napiszesz w Leanie coś takiego ...

```lean
def hello_world : String := "Hello world!"

#eval hello_world
```

... i umieścisz kursor na ostatniej linii, to zobaczysz, jako *wynik ewaluacji termu `hello_world`*
tekst "Hello world!". Gdy natomiast napiszesz coś takiego ...

```lean
def hello_world' : IO Unit := do IO.println "Hello world!"

#eval hello_world'
```

... i umieścisz kursor na ostatniej linii, to zobaczysz ten sam tekst, ale to będzie wynik
*wykonania* pewnego *działania*. Zacznijmy może od tego, że stała `hello_world'` *nie* oznacza
*funkcji*, ponieważ *nie ma w typie strzałki*, a tekst, który widzisz, gdy kursor jest na linii
`#eval hello_world'`, to tak zwany *skutek uboczny*. Wynik ewaluacji stałej `hello_world` (bez
apostrofu) "istnieje" *jako wynik tej ewaluacji* niezależnie od tego, czy Lean Ci go pokazuje, czy
nie, ponieważ ten wynik jest na mocy wprowadzonej definicji *znaczeniem* tej stałej. Natomiast wynik
ewaluacji stałej `hello_world'` "istnieje" tylko jako pewne *zdarzenie*, które jest rezultatem
pewnego działania, które to działanie *może być wykonane w określonych warunkach* i *musi być
wykonane*, żeby ten skutek uboczny "zaistniał".

*Możemy* pisać w Leanie programy imperatywne, czyli takie jakby "rozkazujące" (komputerowi aby
wykonał określone *działania fizyczne*), ale do tego służy *osobny język* (do którego należy między
innymi słowo kluczowe `do`). Jest tak dlatego, że *wnioskowanie* na temat programów imperatywnych ma
inny charakter, niż wnioskowanie na temat czystych programów funkcyjnych. W przypadku czystych
programów funkcyjnych *nie występują efekty uboczne*, to znaczy, każda raz zdefiniowana stała ma już
na zawsze określoną, nie dającą się zmienić "wartość", a każda funkcja "zwraca" zawsze to samo dla
tych samych argumentów.

Jak zdążyłaś się już wielokrotnie przekonać, ewaluacja czystych programów funkcyjnych przebiega w
taki sam sposób, jak (poprawna) interpretacja albo innego rodzaju poprawne przekształcanie wyrażeń
matematycznych. W przeciwieństwie do tego rodzaju ewaluacji, ewaluacja programów imperatywnych może
dawać *różne* wyniki dla *tych samych* wejść, w tym również - niezależnie od poprawności kodu, który
w normalnych warunkach *powinien* dostarczyć jakiś wynik - może nie dać *żadnego* wyniku, to jest
może wywołać skutki uboczne. Tak rozumiane skutki uboczne są w ogóle możliwe, ponieważ wynik
ewaluacji programu imperatywnego zależy od fizycznego stanu komputera, a więc również od fizycznego
stanu świata "wokół" albo "w okolicy" komputera, czyli po prostu od fizycznego stanu świata. To, że
na przykład *widzisz* czasem różne wyniki ewaluacji *czystych* programów funkcyjnych wchodząc w
interakcję z Leanem jest *rezultatem działania Leana*, a nie (skompilowanego do serii instrukcji,
które "rozumie" komputer) *programu który "mówi" komputerowi, co ma "zrobić"*.

Gdy na skutek *wykonania* inaczej *uruchomienia* programu imperatywnego *jako zamierzony rezultat*
powstanie na przykład jakiś plik na dysku komputera, nie będzie się dało o tym *fizycznym zdarzeniu*
wnioskować w taki sam sposób, w jaki można wnioskować na temat na przykład wyniku dodawania
rozumianego (i traktowanego) *matematycznie* po prostu dlatego, że *skutek* polegający na utworzeniu
pliku na dysku *nie musi zajść*, dysk może być przecież pełny, albo może nastąpić awaria
komputera. A *na mocy przyjętych przez nas reguł komunikacyjnych* czyli aksjomatów, *niezależnie od
stanu świata* liczba `2` *jest i zawsze będzie* wynikiem dodawania na przykład liczb `0` i `2`.

Istnieje pewien elegancki i uniwersalny sposób wnioskowania na temat działania programów
imperatywnych, ale ten sposób wymaga formalizacji *semantycznego* aspektu takich programów. Polega
to na *wprowadzenia stanu świata do świata matematyki* za pomocą
[*monad*](https://en.wikipedia.org/wiki/Monad_(functional_programming)). Głębsze objaśnienie, czym
jest monada, wymaga jednak omówienia elementów teorii kategorii, o których dotąd nawet nie
wspominałem, dlatego dopiero teraz pojawiło się coś w rodzaju namiastki programu [Hello
world](https://pl.wikipedia.org/wiki/Hello_world), od którego często zaczyna się naukę programowania
w językach imperatywnych.

W odpowiednim momencie zaczniemy (mam nadzieję) przyglądać się monadom, między innymi dlatego, że te
pozwalają lepiej zrozumieć, o co chodzi w *przyczynowości*. Zanim to jednak nastąpi, powinniśmy się
moim zdaniem przyzwyczaić do wielu innych subtelnych matematycznych zjawisk. Za to już niebawem,
korzystając między innymi z monoidów, zaczniemy się bawić pewnymi ważnymi uproszczonymi *modelami*
programowania imperatywnego. Okaże się wtedy, że podobieństwo nazw "monoid" i "monada", nawet jeśli
w dużym stopniu przypadkowe, odpowiada czemuś zarazem ważnemu, również z perspektywy
(*meta-*)*psychologicznej*, i bardzo trudnemu do zauważenia bez dobrej teorii.

<hr>
