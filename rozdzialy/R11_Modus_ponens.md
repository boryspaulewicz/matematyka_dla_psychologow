<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

A to kolejny rozdział, w którym nie ma zadań. Muszę powiedzieć, że jestem z niego nawet
zadowolony. Tylko nie pamiętam dokładnie, o czym tu pisałem, tak więc potrzebuję chwili.

<br>

No tak, mamy tu objaśnienie terminologii mieszkaniowej, z pozoru kontrowersyjną część na temat
nieważności dowodu, i po raz kolejny, tylko trochę inaczej, objaśnione dwa rodzaje obliczeń
występujących w teorii typów.

Nawiasem mówiąc, tych rodzajów obliczeń w teorii typów jest więcej. Mamy na przykład *α-redukcję*
(nazwy parametrów są nieważne), *β-redukcję* (podstawianie argumentów pod zmienne odpowiadające
parametrom funkcji), *δ-redukcję* (rozwijanie definicji), i inne, ale to są sprawy, które zaczyna
się szybko intuicyjnie czuć używając tej teorii i programując w niej, tak jak się czuje gramatykę
języka ojczystego i moim zdaniem tłumaczenie tego bardziej szczegółowo niekoniecznie w czymkolwiek
znacząco pomaga.

<hr>

# Modus ponens i obliczenia w dwóch wymiarach

Jeżeli implikacja jest najważniejszym spójnikiem, to *modus ponens*, albo *modus ponendo ponens* (z
łacińskiego *sposób potwierdzający potwierdzeniem*), albo *reguła odrywania*, jest najważniejszą
regułą dedukcji (schematem wnioskowania dedukcyjnego). I tu od razu mam dla Ciebie dobrą wiadomość -
*znasz już tą regułę*. Ta reguła mówi, że:

*Jeżeli `p → q`, to jeżeli `p`, to `q`*.

Czy rozpoznajesz w tej regule znane Ci odrywanie typu występującego jako źródło strzałki, które
zachodzi w ramach aplikacji?

Na przykład, stąd, że *jeżeli padało, to trawa jest mokra* wynika, że *jeżeli padało*, to *trawa
jest mokra*. Brzmi jak masło maślane, prawda? To dlatego, że ta reguła jest niczym innym jak
odzwierciedleniem sensu implikacji w mechanicznej (czyli formalnej, czyli takiej jakby bezmyślnej)
regule jej stosowania. Wydaje się wręcz, że ta reguła jest tak oczywistym sposobem używania
implikacji, jak to tylko możliwe. Moim zdaniem brzmi to wszystko lepiej w takiej oto wersji, bo
akcentujemy w niej wyraźnie różnicę między zdaniami jako takimi i ich statusem prawdziwościowym, ...

*Jeżeli akceptujemy implikację `p → q` i jej poprzednik `p`, to akceptujemy również jej następnik
`q`*.

... albo takiej:

*Jeżeli implikacja `p → q` ma dowód i jej poprzednik `p` ma dowód, to `q` ma dowód*.

Używałaś już tej reguły wiele razy, ponieważ w teorii typów ta reguła dedukcji jest *wbudowana w
język*. A dokładniej, możemy powiedzieć, że jest wbudowana w język teorii typów, patrząc na ten
język z perspektywy izomorfizmu Curry'ego-Howarda: Jeżeli mamy term typu funkcyjnego, czyli funkcję,
`h : p → q`, który możemy konsekwentnie interpretować jako dowód `h` zdania `p → q` (jeżeli `p :
Prop` i `q : Prop`), to jeżeli mamy też `hp : p`, czyli dowód `hp` zdania `p`, to możemy
skonstruować dowód zdania `q`, bo jest nim aplikacja `h hp : q`. To zatem nic innego jak nasze
najbardziej podstawowe obliczenie na poziomie typów, które zachodzi w ramach aplikacji funkcji do
akceptowanego przez nią argumentu.

**Przydatna konwencja**: Przy okazji, lubię czasem stosować konwencję, zgodnie z którą nazwa dowodu
zdania na przykład `q` to `hq`, bo to skrót od *hipoteza q*, a nazwa dowodu *negacji* zdania `q`,
czyli zdania `¬q`, to `nq`. Dzięki temu jest mi łatwiej odróżniać zdania od ich dowodów, bo od razu
widać to w notacji, i nie muszę się za bardzo starać, żeby zapamiętać sens tak nazwanych zmiennych.

Przyjżymy się teraz różnicy między aplikacją *dowodu implikacji* i aplikacją funkcji, która *nie*
jest dowodem. Jak widać poniżej, to jest zarazem to samo i nie to samo, ponieważ chociaż *formalnie*
to ten sam ogólny proces, to *nas*, użytkowników, *interesuje w nim coś innego*; dlatego inaczej o
nim mówimy, inaczej myślimy i do pewnego stopnia inaczej go używamy:

1. *Jeżeli mamy dowód zdania `p → q`, ...*

    - *Gdy mamy funkcję `dodaj2` o typie `Nat → Nat`, ...*

2. *to jeżeli mamy też dowód zdania `p`, ...*

    - *to jeżeli mamy term typu `Nat`, na przykład `10`, ...*

3.  *to aplikując dowód zdania `p → q` do dowodu zdania `p`, ...*

    - *to aplikując funkcję `dodaj2` do termu `10` ...*

4.  *uzyskujemy dowód zdania `q`, czyli term typu `q`*.

    - *uzyskujemy liczbę `12`, która jest termem typu `Nat`*.

Czy widzisz, że w przypadku aplikacji "zwykłych" funkcji, takich jak `dodaj2`, interesuje nas przede
wszystkim *wynik* (tutaj `12`), a mniej jego *typ*, bo ten jest jakby od początku "oczywisty",
natomiast w przypadku aplikacji dowodów implikacji, które to dowody też są w naszym języku
funkcjami, interesuje nas przede wszystkim *typ* rezultatu aplikacji (tutaj `q`), a *nie* rezultat
(tutaj konkretna postać, jaką przybiera dowód `q`, to jest rezultat pewnej aplikacji)? Jeżeli tego
nie widzisz, to może przeczytaj poprzedni fragment jeszcze raz; prędzej czy później nie będziesz w
stanie tego nie zobaczyć.

## Dowody są zwykle *nieważne*

Gdy próbujemy skonstruować dowód, obchodzi nas przede wszystkim jego ewentualne *istnienie*, a mniej
jego *struktura*. To dobra wiadomość, bo oznacza, że w momencie udowodnienia twierdzenia możemy
zwykle *zapomnieć* o jego dowodzie i traktować twierdzenie jak "prawdę objawioną", co znacznie
zmniejsza obciążenie poznawcze.

W psychologii to się właściwie nie zdarza, bo psychologia, gdy przypomina naukę, ma zwykle charakter
*empiryczny*, a nie formalny. Nawet, gdybyśmy odkryli jakąś prawdziwą własność świata (a może już
takie własności znamy?), wątpliwości zawsze pozostaną. W dodatku my, psychologowie, nie bardzo
rozumiemy, co robimy próbując wyjaśnić zachowania zwierząt i mimo ogromnej liczby publikowanych
każdego roku artykułów, trudno nam ocenić, czy i w jakim obszarze badań zrobiliśmy postępy. Dlatego
doświadczenie ostatecznego rozwiązania problemu, które pojawia się, gdy zajmujemy się samą
matematyką, albo gdy stosujemy ją do formułowania i rozwiązywania *czysto teoretycznych* problemów w
psychologii, może być moim zdaniem dla nas czymś orzeźwiającym; dla mnie w każdym razie jest i
dlatego wciąż szukam podobnych doświadczeń.

Zapominając o strukturze dowodu na ogół nie tracimy wiele, bo to, jak wygląda dowód jakiegoś zdania,
nie musi być w żaden prosty sposób związane z treścią czy sensem tego zdania i często nie jest z nim
związane. A poza tym dowody są prawie zawsze dłuższe, często znacznie, niż zdania, o których
prawdziwości rozstrzygają. *Ujawniania treści* zdań to po prostu nie to samo, co *rozstrzyganie o
ich prawdziwości*. Dlatego struktura dowodu jest pouczająca przede wszystkim jako wskazówka, jak
można *dowodzić innych podobnych pod jakimś względem zdań*, i niewiele mówi o tym, co można z tymi
zdaniami *zrobić*.

Względną nieważność struktury dowodu *widać*, gdy rozpiszemy analogię między implikacjami i
funkcjami w sposób taki jak zrobiłem to wyżej. W Leanie punkt widzenia, zgodnie z którym liczy się
fakt istnienia dowodu, a nie jego struktura, obowiązuje jako zasada, która nosi nazwę *proof
irrelevance*. Odtąd będę ją czasem nazywał *zasadą nieważności dowodu*. Dlatego funkcje zdefiniowane
z użyciem słowa kluczowego `theorem` są traktowane inaczej niż zwykłe funkcje, czyli zwykłe programy
komputerowe albo algorytmy, które definiujemy używając słowa `def`. W szczególności, Lean *nie
rozpakowuje definicji twierdzeń*, bo *nie ma takiej potrzeby*:

```lean
def dodaj2 (a : Nat) : Nat := a + 2

theorem t1 (a : Prop) : a → a := fun (h : a) => h

-- Deklarujemy, że mamy jakieś zdanie `q`, żeby mieć do czego stosować funkcję/twierdzenie `t1`.
variable (q : Prop)

-- Typ funkcji `dodaj2` jest *trywialny* ...
#check @dodaj2 -- `dodaj2 : Nat → Nat`

-- ... natomiast twierdzenie `t1` ma fragment wykonywalnego kodu *w swoim typie*, to jest ma typ
-- zależny, a więc mniej trywialny. Ponadto, chociaż typ `a → a` jest poza tym równie trywialny, co
-- typ `Nat → Nat`, to jednak w przypadku twierdzenia to właśnie ten typ nas interesuje:
#check @t1 -- `(a : Prop) → a → a`

-- Tutaj interesuje nas *wynik* aplikacji, czyli w tym wypadku wynik dodawania, a nie jego *typ*.
-- Obliczenie, które jest naszym *celem*, zachodzi jakby na poziomie "konkretnym", albo "wewnątrz"
-- funkcji `dodaj2`:
#eval dodaj2 2 -- `4`

-- Tutaj interesuje nas *typ* aplikacji, a nie jej *wynik*. Chociaż nie wymuszamy ewaluacji
-- aplikacji, to samo zestawienie `t1` i `q` wymusza pewnego rodzaju obliczenie. Sama aplikacja `t1
-- q`, a nie jej wynik, jest już dowodem zdania `q → q`. Jedyne obliczenie, które nas tu interesuje,
-- zachodzi więc na poziomie typów i samej konstrukcji termu; naszym *celem* jest ustalenie, że ...
#check t1 q -- `t1 q : q → q`
-- ... tak skonstruowany term ma taki właśnie typ
```

W zwykłych funkcjach czy programach chodzi o tak lub inaczej rozumiane obliczenie jakiegoś
rezultatu, na przykład o obliczenie wyniku dodawania, i chodzi też, a raczej przede wszystkim, o
wynik; w twierdzeniach chodzi jedynie o to, *że* z góry znany typ twierdzenia, czyli zdanie, które
jest treścią tego twierdzenia, ma *jakiś* dowód, czyli *istnieje jakikolwiek term* danego typu
zdaniowego.

Mówiąc jeszcze inaczej, izomorfizm Curry'ego-Howarda pozwala nam dostrzec nie tylko, że matematyka i
programowanie to jedno i to samo, ale również, że w matematyce/programowaniu czasem chodzi o
*zrobienie czegoś za pomocą już istniejącego narzędzia*, na przykład o wyliczenie jakiejś wartości
za pomocą dostępnej funkcji, a czasem o *ustalenie, co ogólnie można zrobić*, przez ustalenie
poprawności (a dokładniej typowalności) pewnego rodzaju formalnych konstrukcji (a dokładniej termów,
czyli również pewnych programów).

Jest mi coraz trudniej pisać o tych sprawach bez używania terminologii "mieszkaniowej", więc może ją
teraz wprowadzę.

**Typy są jak zbiory, ale to całkiem nie zbiory**: Gdy zaczynałem się uczyć o teorii typów, zajęło
mi chwilę, zanim przyzwyczaiłem się do konsekwentnego odróżniania typów od zbiorów. Nadal zresztą
zdarza się, że mam z tym trudności, ponieważ często *warto* zapomnieć, że to nie całkiem to
samo. Zbiory odgrywają ważną rolę w matematyce, między innymi dlatego, że pewna teoria mnogości, to
jest [teoria Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla), która jest
niczym innym jak pewnym ogólnym językiem formalnym służącym do mówienia o zbiorach, ich elementach i
funkcjach jako abstrakcyjnych przyporządkowaniach, a więc także do rozwiązywania problemów
teoretycznych dotyczących zbiorów, ich elementów i funkcji, jest od dawna traktowana jako podstawowy
język matematyki (co nie znaczy, że to jest jedyny taki język, na przykład, teoria typów również
jest takim językiem, jak i teoria kategorii).

W teorii *ZF* (albo *ZFC*, jeśli chcemy zaakcentować obecność aksjomatu wyboru \{ang. [*axiom of
choice*](https://en.wikipedia.org/wiki/Axiom_of_choice)\}) używamy notacji *x ∈ X*, która oznacza
zdanie *x jest elementem zbioru X*. No i typowanie takie jak `n : Nat` może się z pewnością łatwo
kojarzyć z relacją należenia elementu do zbioru. Jedna z różnic polega na tym, że zgodnie ze
"standardową" *interpretacją*, zbiory są pewnymi (złożonymi) *strukturami*, do których różne obiekty
mogą należeć albo nie jako ich elementy, a *typy są tylko stałymi*, to jest *nie mają wewnętrznej
struktury*. Na przykład `Nat` to tylko symbol `Nat`, nic więcej. Inna różnica, nie związana już
tylko z interpretacją, ale mająca podstawowe znaczenie w praktyce, polega na tym, że - w teoriach
takich jak ZF(C) - ten sam element może należeć do więcej niż jednego zbioru, natomiast typ każdego
termu jest *unikalny*, co znaczy, że *każdy (poprawny, czyli typowalny) term ma dokładnie jeden
typ*.

Dlatego moim zdaniem dobrze jest myśleć o typach jak o unikalnych dla każdego termu etykietach,
analogicznie do rzeczy, które można znaleźć w sklepach, i które mają zwykle dokładnie jeden kod
kreskowy. Trzeba jednocześnie pamiętać, że *typ jako taki* to jedno, a *sposób, w jaki typ został
zapisany*, to co innego. Tak jak *liczbę* $1/2$ możemy równoważnie *zapisać* na nieskończenie wiele
sposobów, na przykład jako $2/4$ albo jako $(-332)/(-664)$, tak też na przykład typ `Nat` możemy
zapisać po prostu jako `Nat`, albo jako `(fun typ : Type => typ) Nat`, ponieważ ten ostatni term
złożony redukuje się do termu `Nat`, a więc też tym jest, tak jak liczba $1/2$ jest tą samą liczbą,
co liczba $2/4$, albo liczba $1 - (-332)/(-664)$.

Z wymienionych powodów, o posiadaniu przez term jakiegoś typu mówimy czasami inaczej, niż o
należeniu elementu do zbioru. Konkretnie, mówimy, że jakiś term *zamieszkuje* albo nie jakiś typ i
raczej unikamy mówienia, że jakiś term *należy* do jakiegoś typu. Mówimy też, że jakiś typ jest,
albo nie jest *zamieszkany*, a nie, że jest albo nie jest *pusty*. A właściwie to terminologia
mieszkaninowa też wydaje mi się zwodnicza i czasami wolę mówić, że term *ma* jakiś typ.

Jak już wiesz, w teorii typów obliczenia zachodzą jakby w *dwóch wymiarach* - w wymiarze typów i w
wymiarze, który można by nazwać konkretnym - chociaż to, co jest wymiarem konkretnym, jest często
względne, skoro każdy typ jest również termem (wyższego typu). Można powiedzieć, że na poziomie
konkretnym "działa" matematyka konkretna albo *stosowana*, jak również "zwykłe" programowanie. Na
tym poziomie operujemy na przykład konkretnymi liczbami i interesują nas wyniki zastosowania do nich
operacji dodawania. To w tym wymiarze *my* uprawiamy matematykę, ponieważ to w tym wymiarze możemy
(względnie) *swobodnie konstruować* wyrażenia formalne, na przykład tworzyć (być może) dowody, albo
dokonywać obliczeń. To jest poziom, poza który najczęściej w ogóle nie wychodzą uczniowie szkoły
podstawowej, bo na tym etapie edukacji nie uczy się dowodzenia twierdzeń. Natomiast (dzięki
izomorfizmowi Curry'ego-Howarda) na poziomie typów, który znajduje się jakby cały czas "ponad" tym,
co robimy konstruując rozmaite termy, "istnieje" i "działa" matematyka teoretyczna, przy czym *tam*
wszystko dzieje się zwykle *automatycznie*, bo poza typami termów, które traktujemy jako dane i z
których sami konstruujemy nasze dowody/programy/formalno-językowe maszyny liczące, typy
konstruowanych przez nas termów są wymuszone przez sztywne reguły składniowe języka teorii typów i
oblicza je Lean.

Nie wiem, czy na Tobie to zrobi takie wrażenie, jakie zrobiło na mnie, gdy sobie to pomyślałem, ale
na mnie zrobiło spore, i nadal, gdy zdarza mi się to pomyśleć, nawiedza mnie czasem coś w rodzaju
[mysterium fascinosum](https://encyklopedia.pwn.pl/haslo/mysterium-fascinosum;3944914.html):

*Wszystkie* obliczenia, które zachodziły, gdy wykonywałaś polecenia, zachodziły *jednocześnie* na
poziomie "konkretnym", albo na poziomie *konsekwentnych wyborów*, i na poziomie "teoretycznym",
czyli na poziomie wymuszonym przez logikę (przyjętego języka). A działo się tak dlatego, że *każdy
term ma unikalny typ, a każdy typ jest termem*:

```lean
#check @dodaj2 -- `dodaj2 : Nat → Nat`

-- Można powiedzieć, że ta "zwykła" aplikacja ma jednocześnie wymiar konkretny, na którym zachodzi
-- dodawanie i powstaje wynik ...
#eval dodaj2 2 -- `4`

-- ... i teoretyczny, na którym zachodzi nieuniknione "oderwanie poprzednika" typu `Nat → Nat`, ...
#check dodaj2 2 -- `dodaj2 2 : Nat`
-- ... ale można też powiedzieć, że oba wymiary są w pewnym sensie konkretne, bo `Nat → Nat` jest nie tylko typem,
-- ale również termem (typu `Type`), który na skutek występienia aplikacji ulega przekształceniu w term `Nat`.

-- Co prawda struktura dowodu nie ma znaczenia dla prawdziwości twierdzeń, dlatego na przykład Lean sygnalizuje
-- tutaj błąd `cannot evaluate, proofs are not computationally relevant`, ...
#eval t1 q

-- .. ale *samo zestawienie* `t1` i `q`, pomijając to, co dzieje się w typie, jest już jednak jakimś
-- obliczaniem na poziomie *w pewnym sensie* konkretnym, bo *wykonanym przez nas*, a ponadto
-- towarzyszy temu zestawieniu obliczenie na poziomie termów, tyle, że tamte termy są akurat
-- typami. W pewnym sensie ta *wybrana przez nas* (a dokładniej przeze mnie) aplikacja jest więc
-- "konkretyzacją", albo "realizacją", albo "ucieleśnieniem", albo "instantacją" matematyki
-- teoretycznej:
#check t1 q -- `t1 q : q → q`
```

Swoją drogą, czy nie masz wrażenia, że określenie "konsekwentny wybór" cechuje jakieś zagadkowe
wewnętrzne napięcie? Przecież "wybór" to taki maksymalnie abstrakcyjny odpowiednik *wolności*, a
"konsekwencja" to *brak* lub *ograniczenie* (swobody) *wyboru*. I czy nie jest tak, że wolność od
*jakichkolwiek* ograniczeń musi oznaczać coś w rodzaju pozbawionego sensu chaosu, a więc "wolność
efektywna", albo "wolność sensowna" to zawsze połączenie swobody czy może arbitralności i jakiś
ograniczających reguł albo zasad?
