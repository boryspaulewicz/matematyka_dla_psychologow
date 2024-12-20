*W tym rozdziale nie ma żadnych zadań.*

# Modus ponens i dwa wymiary teorii typów zależnych

Jeżeli implikacja jest najważniejszym spójnikiem, to *modus ponens*, albo *modus ponendo ponens* (z
łacińskiego *sposób potwierdzający potwierdzeniem*), albo *reguła odrywania*, jest najważniejszą
regułą dedukcji (schematem wnioskowania dedukcyjnego). Reguła ta mówi:

*Jeżeli `p → q`, to jeżeli `p`, to `q`*.

Na przykład, stąd, że *jeżeli padało, to trawa jest mokra* wynika, że *jeżeli padało*, to *trawa
jest mokra*. Brzmi jak masło maślane, prawda? To dlatego, że ta reguła jest niczym innym jak
odzwierciedleniem sensu implikacji w mechanicznej (czyli formalnej, czyli takiej jakby bezmyślnej)
regule jej stosowania. Inaczej mówiąc, ta reguła jest tak oczywistym sposobem używania implikacji
jak to tylko możliwe. Moim zdaniem brzmi to wszystko lepiej w takiej oto wersji:

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
zdania na przykład `q` to `hq`, bo to skrót od "hipotezy q". Dzięki temu jest mi czasem łatwiej
odróżniać zdania od ich dowodów.

Przyjżymy się teraz różnicy między aplikacją dowodu implikacji i aplikacją funkcji, która nie jest
dowodem. Jak widać poniżej, to jest zarazem to samo i nie to samo, ponieważ chociaż formalnie to
jest ten sam proces, to *nas, użytkowników* interesuje w nim co innego i dlatego o nim inaczej
mówimy, inaczej myślimy i inaczej go używamy:

1. *Jeżeli mamy dowód zdania `p → q`, ...*

    - *Gdy już mamy funkcję `dodaj2`, która ma typ `Nat → Nat`, ...*

2. *to jeżeli mamy też dowód zdania `p`, ...*

    - *to jeżeli mamy term typu `Nat`, na przykład `10`, ...*

3.  *to aplikując dowód zdania `p → q` do dowodu zdania `q`, ...*

    - *to aplikując funkcję `dodaj2` do termu `10` ...*

4.  *uzyskujemy dowód zdania `q`, czyli term typu `q`*.

    - *uzyskujemy liczbę `12`, która jest termem typu `Nat`*.

Czy widzisz, że w przypadku aplikacji "zwykłych" funkcji takich jak `dodaj2` do jakiś termów
interesuje nas *wynik*, a nie jego *typ*, natomiast w przypadku aplikacji dowodów implikacji, które
to dowody też są w naszym języku funkcjami, interesuje nas *typ* rezultatu aplikacji, a *nie*
rezultat? Jeżeli tego nie widzisz, to może przeczytaj poprzedni fragment jeszcze raz - prędzej czy
później nie będziesz w stanie tam tego nie zobaczyć.

# Dowody są zwykle nieważne

Gdy konstruujemy dowód, albo używamy dowodu już istniejącego - czy jakiegoś bliżej nieokreślonego,
jako parametru twierdzenia - do konstrukcji innych dowodów, obchodzi nas przede wszystkim
*istnienie* dowodu, a nie jego *struktura*. To dobra wiadomość, bo oznacza, że w momencie
udowodnienia twierdzenia możemy zwykle *zapomnieć* o jego dowodzie i traktować twierdzenie jak
"prawdę objawioną", co zmniejsza obciążenie poznawcze. W psychologii to się prawie w ogóle nie
zdarza, bo psychologia jest nauką empiryczną, a więc żadnego problemu psychologicznego nie możemy
nigdy ostatecznie rozwiązać, zawsze pozostanie jakaś wątpliwość. Dlatego też poczucie, że się jakiś
problem całkowicie rozwiązało, którego możemy doświadczać regularnie uprawiając matematykę, może być
moim zdaniem dla psychologa czymś orzeźwiającym, dla mnie w każdym razie jest. 

Zapominając o strukturze dowodu na ogół nie tracimy wiele, bo to, jak wygląda dowód jakiegoś zdania,
nie musi być w żaden prosty sposób związane z jego treścią i często nie jest. Dowody po prostu nie
służą do *ujawniania treści* zdań, tylko do ostatecznego *rozstrzygania o ich prawdziwości*, przez
co struktura dowodu jest na ogół pouczająca tylko jako *wskazówka, jak można dowodzić danego typu
zdań* i niewiele mówi nam o tym, co te zdania *znaczą*.

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
#check t1 -- t1 (a : Prop) : a → a

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
wynik; w twierdzeniach chodzi jedynie o to, że typ twierdzenia, który jest jego treścią, ma *jakiś*
dowód.

**Typy są trochę jak zbiory, ale to nie zbiory**: Gdy zaczynałem się uczyć o teorii typów, zajęło mi
chwilę, zanim przyzwyczaiłem się do odróżniania typów od zbiorów. Zbiory odgrywają ważną rolę w
matematyce, między innymi dlatego, że pewna teoria mnogości, to jest [teoria
Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla), która jest niczym innym
jak ogólnym językiem formalnym służącym do mówienia o zbiorach i ich elementach i rozwiązywania
problemów dotyczących zbiorow, jest od dawna traktowana jako podstawowy język całej matematyki.

W teorii ZF (albo ZFC, jeśli chcemy zaakcentować obecność aksjomatu wyboru) używamy notacji *x ∈ X*,
która oznacza zdanie *x jest elementem zbioru X*. Typowanie zapisujemy w odwrotnej kolejności, na
przykład piszemy `n : Nat`, ale i tak może się bardzo kojarzyć z relacją należenia elementu do
zbioru. Różnica polega na tym, że zbiory są pewnymi *strukturami*, do których różne obiekty mogą
należeć albo nie jako ich elementy, a typy są tylko *stałymi*, bez żadnej wewnętrznej
struktury. Dlatego o posiadaniu przez term jakiegoś typu mówimy inaczej, niż o należeniu elementu do
jakiegoś zbioru. Konkretnie, mówimy, że jakiś term *zamieszkuje* albo nie jakiś typ i raczej unikamy
mówienia, że do niego należy. Mówimy też, że jakiś typ jest, albo nie jest zamieszkany, a nie, że
jest albo nie jest niepusty.

Jak już wiesz, w teorii typów obliczenia zachodzą w *dwóch wymiarach*: w wymiarze typów i w
wymiarze, który można nazwać konkretnym. Na poziomie konkretnym "działa" matematyka konkretna albo
*stosowana*, jak również zwykłe programowanie - na tym poziomie operujemy na przykład konkretnymi
liczbami i interesują nas wyniki zastosowania do nich operacji dodawania. To jest poziom, poza który
najczęściej w ogóle nie wychodzą uczniowie szkoły podstawowej, bo na tym etapie edukacji nie uczy
się dowodzenia twierdzeń. Natomiast na poziomie typów "istnieje" i "działa" matematyka teoretyczna.

Nie wiem, czy na Tobie to zrobi takie wrażenie, jak zrobiło na mnie, gdy sobie to uświadomiłem, w
każdym razie na mnie zrobiło spore: Wszystkie polecenia, które do tej pory wykonywałaś, polegały na
operowaniu *jednocześnie* na poziomie konkretnym i teoretycznym matematyki, po prostu dlatego, że
nie było (bo na pewnym poziomie ogólności nie ma) różnicy między matematyką i programowaniem, a
ponadto *każdy term miał typ, a każdy typ był termem*:

```lean
#check @dodaj2 -- dodaj2 : Nat → Nat

-- Można powiedzieć, że również ta "zwykła" aplikacja ma jednocześnie wymiar konkretny, na którym zachodzi dodawanie
-- i powstaje wynik
#eval dodaj2 2 -- 4
-- i wymiar teoretyczny, na którym zachodzi "oderwanie poprzednika" typu Nat → Nat
#check dodaj2 2 -- dodaj2 2 : Nat

-- Co prawda struktura dowodu nie ma znaczenia dla prawdziwości twierdzeń, dlatego na przykład Lean sygnalizuje tutaj 
-- błąd: cannot evaluate, proofs are not computationally relevant
s#eval t1 q

-- Niemniej samo zestawienie t1 i q jest już jednak jakimś obliczaniem na poziomie *w pewnym sensie* konkretnym, tylko, 
-- że w typach. Można powiedzieć, że ta aplikacja jest "konkretyzacją" albo "realizacją" albo "ucieleśnieniem" matematyki
-- teoretycznej, bo jest matematyką teoretyczną jako programowaniem.
#check t1 q -- t1 q : q → q
```
