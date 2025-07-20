<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

Jeszcze dokładnie nie wiem.

## Μονοειδές

Zaczniemy od wprowadzenia narzędzi programistycznych, które, ponieważ są fragmentami struktury
pewnego języka (w tym wypadku Leana), jak *każde* takie fragmenty pozwalają myśleć o różnych
sprawach w nowy i w przypadku języków formalnych kontrolowany sposób. W tym między innymi celu
wracamy do łączności działań i do replikowania ukrytej mechaniki prozy matematycznej w kodzie.

W książkach dotyczących algebry abstrakcyjnej można znaleźć tego rodzaju zdania ...

*[Monoid](https://pl.wikipedia.org/wiki/Monoid) to trójka `(M, *, u)` złożona ze zbioru `M`,
określonego na nim działania łącznego `*` i elementu neutralnego `u` ze względu na to działanie*.

... albo tego rodzaju zdania:

*Monoid to zbiór wyposażony w łączne działanie i zawierający element neutralny ze względu na to
działanie*.

Zwracam uwagę, że chociaż pojawił się tutaj symbol `*`, w definicji monoidu chodzi o dowolne
działania o wymienionych własnościach, nie tylko takie, które mogą się kojarzyć z mnożeniem. Zresztą
matematycy oznaczają działania monoidalne (będę je tutaj tak nazywał, chociaż o ile wiem ten sposób
mówienia jest rzadki) rozmaicie, zwykle wybierając symbole, których nie używają w danym kontekście
do czegoś innego.

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
i obecność elementu neutralnego*. Czyli ogłaszamy w ten sposób, że bez wprowadzenia dodatkowych
założeń czy dokonania dodatkowych wyborów *nie* będziemy korzystać z takich własności jak na
przykład przemienność albo odwracalność, ponieważ działania monoidalne mogą, ale nie muszą mieć
takich własności.

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
rozwiązać, gdy rozważamy jego wersję *ogólniejszą*. To jest o ile nie będą nam za bardzo
przeszkadzać ewentualne trudności w znajdywaniu reprezentatywnych przykładów, co może wymagać trochę
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
samej monoidalności - w Leanie jest skorzystanie z typów danych występujących w wielu językach
programowania i nazywanych *rekordami* albo (częściej)
[*strukturami*](https://pl.wikipedia.org/wiki/Struktura_(programowanie)):

## Typy rekordowe

```lean
-- Czytamy to: Definiuję typ danych rekordowych (`structure`) o nazwie/będący wartością stałej
-- `Data`, którego polami niech się staną (`where`) ...
structure Data where
  -- ... `dzien`, `miesiac` i `rok`, wszystkie o typie `Nat` ...
  dzien : Nat
  miesiac : Nat
  rok : Nat
-- ... i proszę mi od razu automatycznie wyprowadzić i zdefiniować metodę wyświetlania termów tego
-- typu.
deriving Repr

-- Odtąd możemy robić między innymi takie rzeczy:

def data1 : Data := {dzien := 1, miesiac := 1, rok := 1111}
-- Nazwy pól składowych są zapisane w przestrzeni nazw o nazwie takiej, jak nazwa typu danych,
-- dlatego możemy napisać na przykład tak ...
#eval Data.rok data1 -- `1111`
-- ... albo tak ...
#eval data1.rok      -- `1111` 
--- ... ale tak już *nie*: `#eval rok data1`. To znaczy, możemy tak napisać, ale pojawi się wtedy
--- komunikat o błędzie.

-- To tylko dwa inne, równoważne sposoby konstruowania termów typu rekordowego, opierające się na
-- tym, że w przypadku tego rodzaju typów każda *nazwa* pola składowego odpowiada unikalnej
-- *kolejności*, w jakiej w rekordzie występuje term będący wartością tego pola. A nazwa
-- automatycznie tworzonej w przestrzeni nazw `Data` stałej `mk` to skrót od *make*.
def data2 : Data := Data.mk 4 6 6
def data3 : Data := ⟨0, 13, 1313⟩

-- Dzięki temu, że zaraz pod definicją typu `Data` napisaliśmy `deriving Repr`, co można sobie
-- tłumaczyć jako "wyprowadzając definicję metody reprezentowania", możemy *wyświetlać* termy tego
-- typu:
#eval data2 -- `{ dzien := 4, miesiac := 6, rok := 6 }`

structure Osoba_ludzka where
  tworz :: -- w ten sposób możemy zmienić nazwę funkcji tworzącej termy typu rekordowego:
  imie : String
  nazwisko : String
  data_urodzenia : Data
deriving Repr

-- Zastąpiliśmy nazwę funkcji `Osoba_ludzka.mk` nazwą `Osoba_ludzka.tworz`, dlatego tutaj ...
--
-- `#eval Osoba_ludzka.mk "Kryspin" "Ciekawski" ⟨1, 3, 1009⟩`
--
-- ... pojawia się komunikat o błędzie. A tutaj nie:
def osoba := Osoba_ludzka.tworz "Kryspin" "Ciekawski" ⟨1, 3, 1009⟩
#eval osoba
-- `{ imie := "Kryspin", nazwisko := "Ciekawski", 
--    data_urodzenia := { dzien := 1, miesiac := 3, rok := 1009 } }`
```

Postanowiłem używać nazwy "rekord" zamiast "struktura", bo tego ostatniego słowa używa się w
matematyce bardzo często do mówienia o bardzo różnych rzeczach. Zwracam przy okazji uwagę, że
definicja podana w polskim artykule (tak to [się](https://pl.wikipedia.org/wiki/Pomoc:Edytowanie)
nazywa) Wikipedii zawiera (w tym momencie, to jest 2025.07.19) na samym początku dwa stwierdzenia,
które w ogólnym przypadku *nie* są prawdziwe.

Żeby jakiś typ danych był rekordem, *nie* musi zawierać żadnych *powiązanych logicznie*
informacji. To jest tylko typowe *zastosowanie* struktur albo element tak zwanego "dobrego stylu"
programowania. Swoją drogą, wypadałoby raczej napisać *semantycznie*, bo na przykład między imieniem
i nazwiskiem tej samej osoby nie ma żadnego związku logicznego, ale semantyczny jest, w końcu to dwa
słowa, które *razem oznaczają* "w przybliżeniu unikalną" osobę. No i części struktury *nie* muszą
*zajmować sąsiadujących obszarów w pamięci komputera*. Tak się składa, że w przypadku niektórych
ważnych języków [*imperatywnych*](https://pl.wikipedia.org/wiki/Programowanie_imperatywne), takich
jak choćby [*C*](https://pl.wikipedia.org/wiki/C_(j%C4%99zyk_programowania)), które mają zasadniczo
inny charakter niż języki [*funkcyjne*](https://pl.wikipedia.org/wiki/Programowanie_funkcyjne)
(takie jak Lean), zajmują, ale w czystych językach funkcyjnych ten aspekt nie ma akurat większego
znaczenia, bo programy napisane w czystych językach funkcyjnych *nie służą do opisu zmian fizycznego
stanu komputera*. 

Dlatego ...

```lean
-- ... nie możemy zrobić tak,
--
-- `data2.dzien := 5`
--
-- ... za to możemy zrobić na przykład tak:
#eval {data2 with dzien := 5}
```

Term ewaluowany w ostatniej linii oznacza *nowy* term typu `Data`, powstający z termu `data2` przez
*skopiowanie* wartości wszystkich pól za wyjątkiem pola `dzien`, któremu nadajemy tam wartość `5`.

**Sugestia**: Na początku tego rozdziału napisałem, że wprowadzę narzędzia programistyczne, które
pozwalają myśleć o różnych sprawach w nowy i kontrolowany sposób. Chociaż może w tym momencie wydają
Ci się jeszcze dosyć nieciekawe, takimi narzędziami są między innymi typy rekordowe. Żeby było Ci
łatwiej przekonać się później, w jaki sposób takie konstrukcje mogą Ci pomóc w konsekwentnym
myśleniu o przeróżnych sprawach, w tym również w czytaniu ze zrozumieniem tekstów pisanych przez
matematyków, przydałoby się, żebyś zdefiniowała ...

1. ... własny rekord zawierający dwa pola różnego typu, ...

2. ... zmieniając nazwę konstruktora z domyślnej `mk` na jakąś inną ...

3. ... i pamiętajac, żeby poprosić Leana o konstrukcję "wyświetlacza" termów konstruowanego typu.

Gdy to zrobisz, spróbuj może zdefiniować trzy różne stałe, których wartościami będą termy
stworzonego przez Ciebie typu, robiąc to na trzy różne sposoby, to jest posługując się notacjami:

1. `{nazwa_pola_1 := wartosc, nazwa_pola_2 := wartosc, ...}`

2. `Nazwa_typu_rekordowego.nazwa_konstruktora wartosc wartosc ...`

3. i `⟨wartość, wartość, ...⟩`. 

Na koniec wyświetl sobie (całą) wartość którejś z tych stałych i wartość któregoś z jej pól za
pomocą komendy `#eval`, oznaczając wybrane pole raz w stylu `Nazwa_typu_rekordowego.nazwa_pola
stala`, a raz w stylu `stala.nazwa_pola`.

## (Nie)czyste języki

Różnica między (czystymi) funkcyjnymi i imperatywnymi językami programowania może być nawet
trudniejsza do zrozumienia dla zawodowych informatyków niż dla Ciebie (zakładając, że nie należysz
do tej grupy zawodowej), co potwierdzają zresztą informacje zwrotne, jakie otrzymałem od niektórych
doktorantów biorących udział w moim kursie z wnioskowania przyczynowego i statystycznego. Mam
wątpliwości, czy powinienem o tym mówić już na tym etapie, jeżeli więc poczujesz, że to za wiele
abstrakcyjnych subtelności na raz, to proszę, żebyś potraktowała te uwagi raczej jako ciekawostkę i
zapowiedź przyszłych niespodzianek.

Gdy na przykład napiszesz w Leanie coś takiego ...

```lean
def hello_world : String := "Hello, world!"

#eval hello_world
```

... i umieścisz kursor na ostatniej linii, to zobaczysz, jako *wynik ewaluacji termu `hello_world`*
tekst "Hello, world!". Gdy natomiast napiszesz coś takiego ...

```lean
def hello_world' : IO Unit := do IO.println "Hello, world!"

#eval hello_world'
```

... i umieścisz kursor na ostatniej linii, to zobaczysz ten sam tekst, ale to będzie wynik
*wykonania* pewnego *działania*. 

Zacznijmy może od tego, że stała `hello_world'` *nie* oznacza *funkcji*, ponieważ *nie ma w typie
strzałki*, a tekst, który widzisz, gdy kursor jest na linii `#eval hello_world'`, to przykład tak
zwanego *skutku ubocznego*. Mówiąc dokładniej, *zdarzenie* polegające na tym, że widzisz ten tekst,
to przykład skutku ubocznego. Wynik ewaluacji stałej `hello_world` (bez apostrofu) istnieje *jako
wynik tej ewaluacji* niezależnie od tego, czy Lean Ci go pokazuje, czy nie, ponieważ ten wynik jest
na mocy wprowadzonej definicji *znaczeniem* tej stałej. Natomiast wynik ewaluacji stałej
`hello_world'` istnieje tylko jako pewne zdarzenie, które jest rezultatem pewnego działania, które
to działanie *może być wykonane w określonych warunkach* i *musi być wykonane*, żeby ten skutek
uboczny *za*istniał.

*Możemy* pisać w Leanie programy imperatywne, czyli "rozkazujące" (komputerowi aby wykonał określone
*działania fizyczne*), ale do tego służy *osobny język*, do którego należy między innymi słowo
kluczowe [`do`](https://pl.wikipedia.org/wiki/Dront_dodo). Jest tak dlatego, że *wnioskowanie* na
temat programów imperatywnych ma inny charakter, niż wnioskowanie na temat czystych programów
funkcyjnych. W przypadku czystych programów funkcyjnych *nie występują efekty uboczne*, to znaczy,
każda raz zdefiniowana stała ma już na zawsze określoną, nie dającą się zmienić wartość, a każda
funkcja zwraca zawsze to samo dla tych samych argumentów.

Jak zdążyłaś się już wielokrotnie przekonać, ewaluacja czystych programów funkcyjnych przebiega w
taki sam sposób, jak (poprawna) interpretacja albo innego rodzaju poprawne przekształcanie wyrażeń
matematycznych. W przeciwieństwie do tego rodzaju ewaluacji, ewaluacja programów imperatywnych może
dawać *różne* wyniki dla *tych samych* wejść, w tym również - niezależnie od poprawności kodu, który
w normalnych warunkach *powinien* dostarczyć jakiś wynik - może nie dać *żadnego* wyniku, to jest
może wywoływać rozmaite skutki uboczne. Tak rozumiane skutki uboczne są w ogóle możliwe, ponieważ
wynik ewaluacji programu imperatywnego zależy od fizycznego stanu komputera, a więc również od
fizycznego stanu świata wokół komputera, czyli po prostu od fizycznego stanu świata. To, że na
przykład *widzisz* czasem różne wyniki ewaluacji *czystych* programów funkcyjnych wchodząc w
interakcję z Leanem jest *rezultatem działania Leana*, a nie skompilowanego do serii instrukcji,
które "rozumie" komputer, "samodzielnego" programu "mówiącego" komputerowi, co ma "robić".

Gdy na skutek *wykonania* inaczej *uruchomienia* programu imperatywnego *jako zamierzony rezultat*
powstanie na przykład jakiś plik na dysku komputera, nie będzie się dało o tym *fizycznym zdarzeniu*
wnioskować w taki sam sposób, w jaki można wnioskować na temat na przykład wyniku dodawania
rozumianego (i traktowanego) *matematycznie*. *Skutek* polegający na utworzeniu pliku na dysku *nie
musi* przecież zajść, bo dysk może być pełny, albo może nastąpić awaria komputera. A *na mocy
przyjętych przez nas reguł komunikacyjnych* czyli aksjomatów, *niezależnie od stanu świata*, liczba
`2` *jest i zawsze będzie* wynikiem dodawania na przykład liczb `0` i `2`.

Istnieje pewien elegancki i uniwersalny sposób wnioskowania na temat działania programów
imperatywnych, ale ten sposób wymaga formalizacji *semantycznego* aspektu takich programów. Polega
to na *wprowadzenia stanu świata do świata matematyki* za pomocą
[*monad*](https://en.wikipedia.org/wiki/Monad_(functional_programming)). Głębsze objaśnienie, czym
jest monada, wymaga jednak omówienia elementów teorii kategorii, o których dotąd co najwyżej
wspominałem, dlatego dopiero teraz pojawiło się coś w rodzaju namiastki programu [Hello
world](https://pl.wikipedia.org/wiki/Hello_world), od którego często zaczyna się naukę programowania
w językach imperatywnych.

W odpowiednim momencie zaczniemy (mam nadzieję) przyglądać się monadom, między innymi dlatego, że te
pozwalają lepiej zrozumieć, o co chodzi w *przyczynowości*. Zanim to jednak nastąpi, powinniśmy się
moim zdaniem przyzwyczaić do wielu innych subtelnych matematycznych zjawisk. Za to już niebawem,
korzystając między innymi z monoidów, będziemy się bawić pewnymi ważnymi uproszczonymi modelami
programowania imperatywnego. Okaże się wtedy, że podobieństwo nazw "monoid" i "monada", nawet jeśli
jest w dużym stopniu przypadkowe, odpowiada czemuś zarazem ważnemu, również z
(*meta-*)*psychologicznej* perspektywy, i bardzo trudnemu do zauważenia bez dobrej teorii.

## Monoid jako rekord

Typy rekordowe też oczywiście mogą być i często są *zależne* (albo parametryczne). Zgodnie z
poniższą definicją, monoid to struktura złożona z określonych, na 1. jakimś typie `α`, 2. działania
binarnego `op` i 3. wyróżnionego elementu `u` tego typu, spełniających 4. warunek łączności
(`assoc`) i dwa (5. i 6.) warunki bycia elementem neutralnym, inaczej jednostką (`unit`).

```lean
structure Monoid (α : Type) where
  op : α → α → α -- To znaczy to samo, co na przykład `op (a b : α) : α`.
  u  : α
  -- Notację przedrostkową zamienimy na wzrostkową później.
  assoc      : ∀ a b c : α, (op (op a b) c) = (op a (op b c))
  unit_left  : ∀ a : α, op u a = a
  unit_right : ∀ a : α, op a u = a

-- Nie możemy niestety poprosić Leana o *automatyczne* wyprowadzenie kodu "wyświetlacza" dla tej
-- struktury pisząc `deriving Repr`, bo Lean nie wie nic o typie `α`.
```

Jak łatwo zauważyć, ta formalizacja odpowiada dokładnie fragmentowi prozy matematycznej przytoczonej
na początku rozdziału:

*Monoid to trójka `(M, *, u)` złożona ze zbioru `M`, określonego na nim działania łącznego `*` i
elementu neutralnego `u` ze względu na to działanie*.

A czy zauważyłaś, że ponieważ pola składowe tego rekordu to tylko pewne *stałe o określonych
typach*, te pola są (funkcjonalnie) *definicjami pozbawionymi ciała*? Definicja parametrycznego typu
rekordowego `Monoid (α : Type)` to zatem nic innego jak *aksjomaty* monoidu.

Uwaga, to jest początkowo dezorientujące, za to z czasem staje się nie tylko oczywiste, ale staje
się też oczywiste, że to jest konieczne i lepiej jest mieć czasem świadomość tego, że takie jest:

```lean
-- Specjalizacja działania monoidu `Monoid.op` do typu `Nat` ma typ ...
#check Monoid.op (α := Nat) -- `Monoid.op : Monoid Nat → Nat → Nat → Nat`, 
-- ... a nie, jak można by się naiwnie spodziewać, `Nat → Nat → Nat`. Wynika to stąd, że ta operacja
-- wymaga również *termu typu `Monoid α`*, czyli po prostu konkretnego monoidu, żeby "miała w ramach
-- czego działać". Dla każdego rekordu `X`, każde pole składowe `X` ma jako pierwszy, zwykle ukryty
-- parametr, term typu `X`.
```

Możemy teraz, korzystając z dostępnych w Leanie twierdzeń, *formalnie udowodnić, tworząc term typu
`Monoid Nat`*, że liczby naturalne są monoidem ze względu na dodawanie i `0`:

```lean
def Nat_add_is_a_monoid : Monoid Nat := 
  {op         := Nat.add, 
   u          := Nat.zero, -- Można tu też napisać `0`.
   assoc      := Nat.add_assoc,
   -- `Nad.zero_add` to dostępne w Leanie twierdzenie o treści `∀ (n : Nat), 0 + n = n`.
   unit_left  := Nat.zero_add, 
   -- A tutaj, dla zabawy, sami sobie zrobimy na szybko dowód interaktywny:
   unit_right := by intro n ; rfl}
```

Lean nie zgłasza błędu, co oznacza, że tworząc stałą `Nat_add_is_a_monoid`, wszystkim polom rekordu
`Monoid` w wersji dla typu `Nat` przypisaliśmy (definicyjnie, stąd są tam symbole `:=`) wartości
zgodne z wymaganiami tego rekordu. Chociaż nie napisaliśmy ani `theorem`, ani `example`, ani nie
zdefiniowaliśmy za pomocą słowa kluczowego `def` żadnej funkcji do typu `Prop`, to jednak tym samym
udowodniliśmy pewne *zdanie*, bo udowodniliśmy w ten sposób, *że* dodawanie liczb naturalnych *jest*
działaniem monoidalnym. Mówiąc jeszcze inaczej, chociaż nie ma typu zdaniowego, term
`Nat_add_is_a_monoid` *jest* twierdzeniem, ponieważ pojęcie twierdzenia jest *funkcjonalne*, a ten
term *pełni rolę* twierdzenia, a pełni rolę twierdzenia, bo *może*.

**Sugestia**: Może masz ochotę zrobić to samo dla mnożenia liczb naturalnych? Podpowiem Ci, że nie
ma w Leanie stałej `Nat.one`, ale, jak wiesz, Lean interpretuje domyślnie stałą `1` jako liczbę
naturalną. Poza tym, tak jak najczęściej stosowaną w Leanie skrótową nazwą dla działań
"dodawaniopodobnych" (ech) jest `add`, tak w przypadku działań "mnożeniopodobnych" taką nazwą jest
`mul`.

Pora na kolejną zagadkę i kolejny wgląd. Rozważmy taką definicję:

```lean
structure Rekord (α : Type) where
  pole : α
```

Prosty parametryczny typ rekordowy, prawda? A czy widzisz, że to jest funkcjonalnie funkcja?
Wystarczy *uważnie przeczytać definicję*: *Dla każdego typu `α`, `Rekord α` jest typem rekordowym
zawierającym jedno `pole` typu `α`*. To jest więc *równocześnie* definicja typu rekordowego i
funkcja z (arbitralnych) typów (typu `Type 1`, ale to akurat drobiazg) do (nieparametrycznych, bo
całkiem wyspecjalizowanych) typów (rekordowych):

```lean
-- No przecież to jest aplikacja! (termu `Rekord` do termu `Nat`):
#check Record Nat -- Rekord Nat : Type
```

Nie mówiłem, że strzałki i funkcje są dosłownie wszędzie? A ten fragment prozy matematycznej, który
przytoczyłem na początku i który tutaj jeszcze raz wstawię, żebyś nie musiała go szukać ...

*Monoid to trójka `(M, *, u)` złożona ze zbioru `M`, określonego na nim działania łącznego `*` i
elementu neutralnego `u` ze względu na to działanie*.

... to co to właściwie jest? Oczywiście, między innymi. Wszystko jest czymś lub jest jakieś zawsze
tylko między innymi. Zanim odpowiesz, zbadaj proszę nonszalancko bo wybiórczo taki fragment kodu:

```lean
def powitanie : Osoba_ludzka → String :=
  -- Data urodzenia nas w tym przypadku nie interesuje
  fun ⟨imie, nazwisko, _⟩ => (imie.append " ").append nazwisko

#eval powitanie osoba -- `"Kryspin Ciekawski"`
```

Ponieważ (z dokładnością do lukru składniowego: `Typ_rekordowy.mk ...`, `{...}` i `⟨...⟩`) istnieje
*tylko jeden* sposób konstruowania termu typu rekordowego, polegający na podaniu wartości dla
*wszystkich* pól składających się na taki typ, to można przechwytywać wartości pól typów rekordowych
za pomocą dopasowania wzorców. Ponieważ można też tworzyć termy typów rekordowych w stylu `{...}`,
to tą samą funkcję można zdefiniować również tak:

```lean
def powitanie' : Osoba_ludzka → String :=
  fun {imie := i, nazwisko := n, data_urodzenia := _} => (i.append " ").append n

-- "Przechwytujące" zmienne są tutaj po *prawej* od symboli definiowania, bo, z dokładnością do
-- lukru składniowego, który zawsze można łatwo zdjąć, właśnie w tych miejscach *musiały* być termy,
-- których wartości zostały przypisane do tych pól.
```

To jeszcze raz zapytam: Ten hipotetyczny fragment pierwszego rozdziału hipotetycznego podręcznika
wprowadzającego do teorii monoidów, to co to właściwie jest?

*Monoid to trójka `(M, *, u)` złożona ze zbioru `M`, określonego na nim działania łącznego `*` i
elementu neutralnego `u` ze względu na to działanie*.

I od razu odpowiem: To między innymi początek półformalnej definicji pewnej struktury/funkcji (w
postaci rozdziału, a może nawet całej książki), zawierającej rozmaite (dotyczące monoidów)
pola/definicje (w tym pola/aksjomaty) i pola/twierdzenia, które, za wyjątkiem aksjomatów, są w ciele
tej struktury/funkcji w jakiś sposób, zapewne półformalnie, zdefiniowane "dookreślająco" (czyli mają
jakieś półformalne ciała), a wszystko to jest chwilową (bo teorie matematyczne również się
zmieniają) definicją parametryczną stałej `Monoid`, której jedyny parametr jest skrótowo zapisanym
zależnym wzorcem ...

`(M : Zbiór, * : M × M → M, u : M, h₁ : ∀ a, b, c ∈ M, (a * b) * c = a * (b * c), h₂ : ∀ a ∈ M, u *
a = a * u = a)`.
