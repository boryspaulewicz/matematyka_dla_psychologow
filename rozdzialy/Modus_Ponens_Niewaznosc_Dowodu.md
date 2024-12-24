## O czym teraz będzie

A to jest kolejny rozdział, w którym nie ma żadnych zadań. Muszę powiedzieć, że jestem z niego nawet
zadowolony. Tylko nie pamiętam dokładnie o czym tu pisałem, tak więc potrzebuję chwili. No tak, mamy
tu objaśnienie terminologii mieszkaniowej, z pozoru kontrowersyjną część na temat nieważności dowodu
i po raz kolejny, tylko trochę inaczej, objaśnione dwa rodzaje "obliczeń" występujących w teorii typów.

Nawiasem mówiąc, tych rodzajów obliczeń w teorii typów jest więcej. Mamy na przykład *α-redukcję*
(nazwy parametrów są nieważne), *β-redukcję* (czyli podstawianie argumentów pod zmienne
odpowiadające parametrom funkcji), *δ-redukcję* (rozwijanie definicji), i inne, ale to są sprawy,
które zaczyna się szybko intuicyjnie czuć używając tej teorii i programując w niej, tak jak się
czuje gramatykę języka ojczystego, i moim zdaniem tłumaczenie tego bardziej szczegółowo
niekoniecznie w czymkolwiek znacząco pomaga.

<hr>

# Modus ponens i obliczenia w dwóch wymiarach

Jeżeli implikacja jest najważniejszym spójnikiem, to *modus ponens*, albo *modus ponendo ponens* (z
łacińskiego *sposób potwierdzający potwierdzeniem*), albo *reguła odrywania*, jest najważniejszą
regułą dedukcji (schematem wnioskowania dedukcyjnego). Reguła ta mówi:

*Jeżeli `p → q`, to jeżeli `p`, to `q`*.

Na przykład, stąd, że *jeżeli padało, to trawa jest mokra* wynika, że *jeżeli padało*, to *trawa
jest mokra*. Brzmi jak masło maślane, prawda? To dlatego, że ta reguła jest niczym innym jak
odzwierciedleniem sensu implikacji w mechanicznej (czyli formalnej, czyli takiej jakby bezmyślnej)
regule jej stosowania. Wydaje się wręcz, że ta reguła jest tak oczywistym sposobem używania
implikacji jak to tylko możliwe. Moim zdaniem brzmi to wszystko lepiej w takiej oto wersji, bo
akcentujemy w niej wyraźnie różnicę między zdaniami jako takimi i ich statusem prawdziwościowym:

*Jeżeli akceptujemy implikację `p → q` i jej poprzednik `p`, to akceptujemy również jej następnik
`q`*.

albo takiej:

*Jeżeli `p → q` ma dowód i jej poprzednik `p` ma dowód, to `q` ma dowód*.

Używałaś już tej reguły wiele razy, ponieważ w teorii typów ta reguła jest *wbudowana w język* (a
dokładniej możemy powiedzieć że jest wbudowana w język teorii typów patrząc na niego z perspektywy
izomorfizmu Curry'ego-Howarda): Jeżeli mamy `h : p → q`, czyli dowód `h` zdania `p → q`, to jeżeli
mamy też `hp : p`, czyli dowód `hp` zdania `p`, to mamy też dowód zdania `q` i jest nim aplikacja `h
hp : q`. To nic innego jak nasze najbardziej podstawowe obliczenie na poziomie typów, które zachodzi
zawsze w ramach aplikacji funkcji do argumentu. 

**Przydatna konwencja**: Przy okazji, lubię czasem stosować konwencję, zgodnie z którą nazwa dowodu
zdania na przykład `q` to `hq`, bo to skrót od "hipoteza q". Dzięki temu jest mi łatwiej odróżniać
zdania od ich dowodów, bo od razu widać to w notacji.

Przyjżymy się teraz różnicy między aplikacją dowodu implikacji i aplikacją funkcji, która nie jest
dowodem. Jak widać poniżej, to jest zarazem to samo i nie to samo, ponieważ chociaż formalnie to
jest ten sam proces, to *nas, użytkowników* interesuje w nim coś innego i dlatego o nim inaczej
mówimy, inaczej myślimy i inaczej go używamy:

1. *Jeżeli mamy dowód zdania `p → q`, ...*

    - *Gdy już mamy funkcję `dodaj2`, która ma typ `Nat → Nat`, ...*

2. *to jeżeli mamy też dowód zdania `p`, ...*

    - *to jeżeli mamy term typu `Nat`, na przykład `10`, ...*

3.  *to aplikując dowód zdania `p → q` do dowodu zdania `p`, ...*

    - *to aplikując funkcję `dodaj2` do termu `10` ...*

4.  *uzyskujemy dowód zdania `q`, czyli term typu `q`*.

    - *uzyskujemy liczbę `12`, która jest termem typu `Nat`*.

Czy widzisz, że w przypadku aplikacji "zwykłych" funkcji takich jak `dodaj2` do jakiś termów
interesuje nas *wynik*, a nie jego *typ*, natomiast w przypadku aplikacji dowodów implikacji, które
to dowody też są w naszym języku funkcjami, interesuje nas *typ* rezultatu aplikacji, a *nie*
rezultat? Jeżeli tego nie widzisz, to może przeczytaj poprzedni fragment jeszcze raz - prędzej czy
później nie będziesz w stanie tam tego nie zobaczyć.

## Dowody są zwykle nieważne

Gdy używamy dowodu już istniejącego do stworzenia nowego, a nawet gdy konstruujemy jakiś dowód,
obchodzi nas przede wszystkim *istnienie* dowodu, a nie jego *struktura*. To dobra wiadomość, bo
oznacza, że w momencie udowodnienia twierdzenia możemy zwykle *zapomnieć* o jego dowodzie i
traktować twierdzenie jak "prawdę objawioną", co zmniejsza obciążenie poznawcze.

W psychologii to się właściwie w ogóle nie zdarza, bo psychologia jest nauką empiryczną. Nawet,
gdybyśmy odkryli jakąś prawdziwą własność świata (a może już takie własności znamy?), zawsze jakaś
wątpliwość pozostanie. W dodatku my, psychologowie, nie bardzo rozumiemy co robimy, gdy próbujemy
wyjaśnić zachowania zwierząt i mimo ogromnej liczby publikowanych każdego roku artykułów, trudno nam
ocenić, czy i w jakim obszarze naszych badań zrobiliśmy faktycznie postępy. Dlatego doświadczenie
całkowitego i ostatecznego rozwiązania jakiegoś problemu, które pojawia się, gdy zajmujemy się
matematyką, albo gdy stosujemy ją do formułowania i rozwiązywania na przykład teoretycznych
problemów w psychologii, może być moim zdaniem dla każdego z nas czymś orzeźwiającym; dla mnie w
każdym razie jest i dlatego wciąż szukam podobnych doświadczeń.

Zapominając o strukturze dowodu na ogół nie tracimy wiele, bo to, jak wygląda dowód jakiegoś zdania,
nie musi być w żaden prosty sposób związane z jego treścią i często nie jest z nią związane. A poza
tym dowody są prawie zawsze znacznie dłuższe niż zdania, których dowodzą. Dowody po prostu nie służą
do *ujawniania treści* zdań, tylko do ostatecznego *rozstrzygania o ich prawdziwości*, przez co
struktura dowodu jest na ogół pouczająca tylko jako *wskazówka, jak można dowodzić zdania
określonego typu* i niewiele mówi nam o tym, co te zdania *znaczą*.

Względną nieważność struktury dowodu po prostu *widać*, gdy rozpiszemy analogię między implikacjami
i funkcjami w sposób taki jak zrobiłem to wyżej. W Leanie punkt widzenia, zgodnie z którym liczy się
fakt istnienia dowodu, a nie jego struktura, obowiązuje jako *zasada*, która nosi nazwę *proof
irrelevance*. Dlatego funkcje zdefiniowane z użyciem słowa kluczowego `theorem` są traktowane
inaczej niż zwykłe funkcje, czyli zwykłe programy komputerowe czy algorytmy, które definiujemy
używając słowa `def`. W szczególności, Lean *nie rozpakowuje definicji twierdzeń*, bo *nie ma takiej
potrzeby*:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
theorem t1 (a : Prop) : a → a := fun (h : a) => h

variable (q : Prop) -- Deklarujemy, że mamy zdanie q, żeby mieć do czego stosować t1

-- Typ funkcji dodaj2 jest *trywialny* ...
#check @dodaj2 -- dodaj2 : Nat → Nat

-- ... natomiast twierdzenie t1 ma fragment wykonywalnego kodu *w swoim typie*, to jest ma typ zależny, a więc
-- mniej trywialny:
#check @t1 -- (a : Prop) → a → a

-- Tutaj interesuje nas *wynik* aplikacji, czyli w tym wypadku wynik dodawania, a nie jego typ. Obliczenie, które nas
-- interesuje, zachodzi jakby na poziomie "konkretnym", albo "wewnątrz" funkcji dodaj2:
#eval dodaj2 2 -- 4

-- Tutaj interesuje nas *typ* aplikacji, a nie jej wynik. Chociaż nie wymuszamy ewaluacji aplikacji, to samo zestawienie
-- t1 i q wymusza pewnego rodzaju obliczenie. Sama aplikacja t1 q, a nie jej wynik, jest już dowodem zdania q → q.
-- Jedyne obliczenie, które nas tu interesuje, zachodzi więc na poziomie typów:
#check t1 q -- t1 q : q → q
```

W zwykłych funkcjach czy programach chodzi o tak lub inaczej rozumiane obliczenie jakiegoś
rezultatu, na przykład o obliczenie wyniku dodawania, i chodzi też, a raczej przede wszystkim, o
wynik; w twierdzeniach chodzi jedynie o to, że typ twierdzenia, czyli zdanie, które jest treścią
tego twierdzenia, ma *jakiś* dowód, czyli istnieje jakiś term danego typu. Jest mi coraz trudniej
pisać o tych sprawach bez używania terminologii "mieszkaniowej", więc może ją teraz wprowadzę.

**Typy są trochę jak zbiory, ale to nie zbiory**: Gdy zaczynałem się uczyć o teorii typów, zajęło mi
chwilę, zanim przyzwyczaiłem się do odróżniania typów od zbiorów. Zbiory odgrywają ważną rolę w
matematyce, między innymi dlatego, że pewna teoria mnogości, to jest [teoria
Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla), która jest niczym innym
jak ogólnym językiem formalnym służącym do mówienia o zbiorach i ich elementach, a także do
rozwiązywania problemów dotyczących zbiorow, jest od dawna traktowana jako podstawowy język całej
matematyki (co nie znaczy, że to jest jedyny taki język, na przykład, teoria typów również jest
takim językiem).

W teorii *ZF* (albo *ZFC*, jeśli chcemy zaakcentować obecność aksjomatu wyboru, and. [*axiom of
choice*](https://en.wikipedia.org/wiki/Axiom_of_choice)) używamy notacji *x ∈ X*, która oznacza
zdanie *x jest elementem zbioru X*. Typowanie zapisujemy co prawda w odwrotnej kolejności, na
przykład piszemy `n : Nat`, ale i tak może się bardzo kojarzyć z relacją należenia elementu do
zbioru. Różnica polega na tym, że zbiory są pewnymi *strukturami*, do których różne obiekty mogą
należeć albo nie jako ich elementy, a typy są tylko *stałymi*, bez żadnej wewnętrznej struktury -
`Nat` to tylko symbol `Nat`, nic więcej. Dlatego o posiadaniu przez term jakiegoś typu mówimy
inaczej, niż o należeniu elementu do jakiegoś zbioru. Konkretnie, mówimy, że jakiś term
*zamieszkuje* albo nie jakiś typ i raczej unikamy mówienia, że do niego należy. Mówimy też, że jakiś
typ jest, albo nie jest zamieszkany, a nie, że jest albo nie jest (nie)pusty.

Jak już wiesz, w teorii typów obliczenia zachodzą w *dwóch wymiarach*: w wymiarze typów i w
wymiarze, który można by nazwać konkretnym. Na poziomie konkretnym "działa" matematyka konkretna
albo *stosowana*, jak również zwykłe programowanie - na tym poziomie operujemy na przykład
konkretnymi liczbami i interesują nas wyniki zastosowania do nich operacji dodawania. To jest
poziom, poza który najczęściej w ogóle nie wychodzą uczniowie szkoły podstawowej, bo na tym etapie
edukacji nie uczy się dowodzenia twierdzeń. Natomiast na poziomie typów "istnieje" i "działa"
matematyka teoretyczna.

Nie wiem, czy na Tobie to zrobi takie wrażenie, jakie zrobiło na mnie, gdy sobie to pomyślałem, ale
na mnie zrobiło spore i nadal gdy zdarza mi się to pomyśleć nawiedza mnie czasem coś w rodzaju
[mysterium fascinosum](https://encyklopedia.pwn.pl/haslo/mysterium-fascinosum;3944914.html):
*Wszystkie* obliczenia, które zachodziły, gdy wykonywałaś polecenia, zachodziły właściwie
*jednocześnie* na poziomie konkretnym i teoretycznym, *po prostu dlatego, że każdy term miał typ, a
każdy typ był termem*:

```lean
#check @dodaj2 -- dodaj2 : Nat → Nat

-- Można powiedzieć, że ta "zwykła" aplikacja ma jednocześnie wymiar konkretny, na którym zachodzi dodawanie i powstaje
-- wynik
#eval dodaj2 2 -- 4
-- i wymiar teoretyczny, na którym zachodzi "oderwanie poprzednika" typu Nat → Nat
#check dodaj2 2 -- dodaj2 2 : Nat
-- ale można też powiedzieć, że oba wymiary są konkretne, bo Nat → Nat jest nie tylko typem, ale również termem (typu
-- Type), który na skutek występienia aplikacji zamienia się w term Nat.

-- Co prawda struktura dowodu nie ma znaczenia dla prawdziwości twierdzeń, dlatego na przykład Lean sygnalizuje tutaj 
-- błąd: cannot evaluate, proofs are not computationally relevant
#eval t1 q
-- ale *samo zestawienie* t1 i q, pomijając to, co dzieje się w typie, jest już jednak jakimś obliczaniem na poziomie
-- *w pewnym sensie* konkretnym, bo wykonanym przez nas, a ponadto towarzyszy temu zestawieniu obliczenie na poziomie 
-- termów, tylko, że te termy są tutaj akurat typami. W pewnym sensie ta aplikacja jest więc "konkretyzacją" albo 
-- "realizacją" albo "ucieleśnieniem" matematyki teoretycznej:
#check t1 q -- t1 q : q → q
```
