*Wszystko, co można zrozumieć, da się powiedzieć jasno. Wszystko, co da się powiedzieć jasno, można
zapisać w języku [teorii typów](https://en.wikipedia.org/wiki/Type_theory). A wszystko, co zostało
zapisane w języku teorii typów, można sprawdzić za pomocą algorytmu i zredukować do najprostszej
możliwej postaci.*

<br/>
<br/>
<br/>

**Poza znajomością języka polskiego i umiejętnością korzystania z przeglądarki ta książka nie
zakłada żadnej wcześniejszej wiedzy**. Piszę ją w tym momencie przede wszystkim dla studentów
psychologii, ale także dla badaczy i teoretyków zajmujących się uprawianiem psychologii naukowej. To
między innymi wprowadzenie, niemal
[równolegle](https://en.wikipedia.org/wiki/Everything_Everywhere_All_at_Once), do programowania i
teorii typów, a tą drogą - zarazem na skróty i od podstaw - do matematyki i meta-matematyki, później
zaś do wnioskowania przyczynowego i statystycznego (w tej kolejności), w wersji bayesowskiej i
częstościowej. Korzystając z tych narzędzi zamierzam omówić wybrane zagadnienia z obszaru szeroko
rozumianej metodologii badań psychologicznych. W drugiej części planuję z kolei uzasadnić, objaśnić
i zilustrować przykładami zastosowań pewną propozycją nowego spojrzenia na psychologię w
szczególności i nauki empiryczne w ogólności (więcej na ten temat znajdziesz
[tutaj](./rozdzialy/02_Cel.md)). Ta propozycja będzie kontynuacją i rozwinięciem wątków z
[doktoratu](./rozdzialy/praca_doktorska.pdf), którymi zacząłem się zajmować jeszcze na etapie
pisania pracy magisterskiej, a niektórymi nawet wcześniej.

**Dlaczego teoria typów i dlaczego akurat
[Lean](https://en.wikipedia.org/wiki/Lean_(proof_assistant)), a nie na przykład znacznie dłużej
rozwijany [Coq](https://en.wikipedia.org/wiki/Coq_(software))?** Teoria typów dlatego, że pozwala
sformalizować w pełni i we względnie naturalny sposób niemal dowolne treści o ogólnie rozumianym
matematycznym charakterze i jest przy tym jednocześnie pełnowartościowym ([funkcyjnym i
czystym](https://pl.wikipedia.org/wiki/Programowanie_funkcyjne)) językiem programowania. W dodatku
to nie jest jakiś tam kolejny taki język, tylko taki, którego składnia powstawała stopniowo jako
rezultat badań wielu wybitnych matematyków i filozofów zajmujących się podstawami matematyki. Ale
teoria typów także dlatego, że być może najciekawszym i najważniejszym zastosowaniem matematyki w
psychologii *nie* jest moim zdaniem wcale testowanie hipotez statystycznych ani wnioskowanie
przyczynowe czy formalizacja jakiś wyrażonych w języku naturalnym teorii lub modeli psychologicznych
w postaci modeli matematycznych rozmaitych zjawisk, tylko *formalizacja rozumowań*, jakie
psychologowie wyrażają, czasami bardziej, ale zwykle niestety mniej czytelnie w swoich
publikacjach. A teoria typów wyposażona w [typy
zależne](https://en.wikipedia.org/wiki/Dependent_type) jest wydaje mi się czymś najbliższym, co
obecnie mamy, do realizacji wizji[^2] [Russela](https://pl.wikipedia.org/wiki/Bertrand_Russell),
którą ten przedstawił w wykładzie pod tytułem *Logika jako istota filozofii* w 1914 roku w Londynie,
a który w wersji przetłumaczonej na język polski można znaleźć
[tutaj](https://ejournals.eu/pliki_artykulu_czasopisma/pelny_tekst/6bef0ebd-7ba5-407b-a167-d8bd49697ee6/pobierz).
Wreszcie akurat Lean dlatego, że ma znacznie mniej od Coq'a "przegadaną" składnię, rozwija się w tym
momencie dość gwałtownie i w dodatku sprawdził się już znakomicie jako narzędzie
[dydaktyczne](https://github.com/ImperialCollegeLondon/formalising-mathematics-2024)
([tutaj](https://adam.math.hhu.de/#/g/leanprover-community/nng4) na przykład można znaleźć
zaimplementowaną w Leanie *grę*, polegającą na dowodzeniu twierdzeń o liczbach naturalnych).

**Pierwsze trzy rozdziały**, za wyjątkiem **wybiegającej nieco w przyszłość części rozdziału
trzeciego**, mają charakter ogólnowprowadzający i chociaż nie zawierają ani fragmentów kodu ani
żadnych zadań, to polecam je przynajmniej przejrzeć. Można tam znaleźć nie tylko oparte na wynikach
badań i moich doświadczeniach *wskazówki praktyczne* dotyczące tego, jak warto moim zdaniem
podchodzić do nauki *jakichkolwiek* treści, ale również uwagi dotyczące *nastawienia*, które może
znacząco zwiększyć szanse na sukces w zmaganiach z tymi dość nietypowymi, jak na książkę skierowaną
do psychologów, tematami. Staram się je objaśnić najlepiej jak umiem, ale nie umiem tego robić
lepiej, niż umiem (to niekoniecznie tautologia, za to te, które omawiam w [rozdziale
ósmym](./rozdzialy/Logika_w_Leanie_pierwsze_kroki.md), są nimi z pewnością).

**Piszę tą książkę w taki a nie inny sposób**, to jest posyłając czasem mniejsze a czasami większe
zmiany i poprawki do publicznie dostępnego repozytorium GitHuba, bo dzięki temu sama ta książka,
razem z publicznie dostępną historią zachodzących zmian, może być ilustracją sposobu, w jaki
zacząłem ostatnio myśleć o tym [czym jest zachowanie](./rozdzialy/02_Cel.md). Akt pisania książki
jest przecież co prawda długim, ale jednak w pewnym sensie pojedynczym aktem zachowania chociażby
dlatego, że da się przynajmniej orientacyjnie wskazać początek i koniec tego procesu. Jest w dodatku
aktem *w ramach którego*, dzięki stałej autorefleksji jak również dzięki informacjom zwrotnym
pochodzącym od jej czytelników, zachodzi proces *uczenia się*, choć nie da się powiedzieć
jednoznacznie czego, a także procesem *odkrywania* czy raczej ustalania się być może jakiegoś
*dominującego*, ale nadal z konieczności *nieunikalnego celu*.

W dodatku na pewnym poziomie abstrakcji nie ma różnicy między napisaniem całej książki a na przykład
tylko tego zdania. Byłoby wskazane, gdyby ten proces zaczął być regulowany przez informacje zwrotne
"z zewnątrz", bo zachowania ludzi są prawie zawsze w mniejszym lub większym stopniu czymś, co tworzy
się w ramach społecznych interakcji i co nabiera dzięki takim interakcjom (również nieunikalnego)
sensu. Na przykład, *to konkretne zdanie* powstało jako rezultat interakcji wielu bardzo sobie
bliskich, bo mających wiele wspólnych cech, ale jednak nieco *różnych* osób, bo *różnych wersji tej
samej osoby*, z których każda istniała tylko przez chwilę i wniosła coś do końcowego rezultatu
rozwijając albo kwestionując to, co zrobiły te poprzednie (wersje), a następnie to, co w ten sposób
powstało lub uległo przekształceniu, przekazując dalej. Nad *zewnętrznymi* źródłami tego rodzaju
informacji zwrotnych mam jednak bardzo ograniczoną kontrolę, a szkoda, bo przecież im więcej punktów
widzenia bierze udział w tego rodzaju procesie i im bardziej te punkty widzenia są różne, tym
większa jest szansa na zbliżenie się do czegoś dobrego.

Trudno mi powiedziec, czy powyższe uwagi brzmią dla Ciebie "głęboko" lub "filozoficznie", bo nie
jestem Tobą, ale niezależnie od tego, czy tak brzmią, czy nie, na zachętę zostawię tu na razie w
postaci dyndającej (ang. [*dangling*](https://en.wikipedia.org/wiki/Dangling_modifier)) następujące
pytanie: Jak sądzisz, jak by to wszystko zabrzmiało, gdyby miało się okazać, że da się takie jak te
wyżej obserwacje zapisać bez znaczącej utraty ich treści w języku formalnym i przekonać się w ten
sposób, że są właściwie *płytkie*?

[*Radosna działalność*](https://www.youtube.com/watch?v=AZzcE04ssoQ) (ang. *fun activity*): Żeby
zachęcić do lektury, w różnych miejscach umieściłem linki do treści, które nie są blisko związane z
tematem. I w przypisach też czasami zjeżdżam troszkę na pobocze. Nie ma za co.

Ostatnio, gdy szukam błędów albo fragmentów, które mógłbym poprawić, chętnie korzystam z oficialnej
[aplikacji](https://play.google.com/store/apps/details?id=com.github.android&hl=en) do przeglądania
repozytoriów GitHuba, którą mam zainstalowaną w telefonie. Nie można wtedy wygodnie używać Leana,
ale do czytania na wyrywki sprawdza się wspaniale, więc i Tobie ją polecam.

[R1 Skąd się ta książka wzięła?](./rozdzialy/00_Wprowadzenie.md)

[R2 Co można z tą książką zrobić?](./rozdzialy/01_Jak_sie_uczyc.md)

[R3 Do czego autor zmierza?](./rozdzialy/02_Cel.md)

[R4 Kilka trywialnych mechanicznych operacji](./rozdzialy/Pierwszy_spacerek.md)

[R5 Pierwszy spacer po Leanie, wersja pierwsza](./rozdzialy/Spacerek_po_Leanie_1.md)

[R6 Pierwszy spacer po Leanie, wersja druga](./rozdzialy/Spacerek_po_Leanie_2.md)

[R6 = R0](./rozdzialy/Ewaluacja.md)

[R7 Być może nie wiesz, że już wiesz, czym jest izomorfizm, a niebawem dowiesz się jeszcze, czym
jest izomorfizm Curry'ego-Howarda](./rozdzialy/Izomorfizm_Curryego_Howarda.md)

[R8 Logika na Leanie, pierwsze kroki](./rozdzialy/Logika_w_Leanie_pierwsze_kroki.md)

[R9 Implikacja w zadaniach](./rozdzialy/Implikacja_w_zadaniach.md)

[R10 Predykaty, relacje, duży kwantyfikator i dowód na istnienie
Boga](./rozdzialy/Predykaty_dowod_Anzelma.md)

[R11 Duży kwantyfikator i implikacja w
zadaniach](./rozdzialy/Duzy_kwantyfikator_i_implikacja_w_zadaniach.md)

[R12 Modus ponens, obliczenia w dwóch wymiarach i nieważność
dowodu](./rozdzialy/Modus_Ponens_Niewaznosc_Dowodu.md)

[R12 Negacja, absurd, fałsz, sprzeczność i eksplozja](./rozdzialy/Negacja.md)[^1]

[R13 Negacja w praktyce dowodzenia](./rozdzialy/Negacja_w_praktyce.md)

[R14 ∧](./rozdzialy/Koniunkcja.md)

[R15 Koniunkcja - plac budowy](./rozdzialy/Koniunkcja_work_in_progress.md)

W planach: Sekcja zwłok, studium przypadku

[^1]: O prawie [podwójnej negacji](https://kawaly.tja.pl/dowcip,profesor-filologii-polskiej-na) będę pisał w innym rozdziale.

[^2]: Więcej na ten fascynujący temat można poczytać w
    [tej](https://global.oup.com/academic/product/modal-homotopy-type-theory-9780198853404?cc=it&lang=en&)
    interesującej i wartościowej książce, ale niestety nie jest to lektura lekka, łatwa i przyjemna,
    to znaczy może stać się w końcu względnie łatwa i przyjemna, ale żeby się tak stało, to przez
    dłuższy czas nie może być lekka, bo dotyczy podobnych zastosowań, tyle, że jednocześnie
    [*homotopijnej* teorii typów](https://homotopytypetheory.org/book/) i [teorii
    kategorii](https://pl.wikipedia.org/wiki/Teoria_kategorii), którą nawet zawodowi matematycy
    określają czasami (czule!) jako [*abstract
    nonsense*](https://en.wikipedia.org/wiki/Abstract_nonsense).
