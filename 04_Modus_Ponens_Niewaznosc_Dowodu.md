# Modus ponens i dwa wymiary teorii typów zależnych

Jeżeli implikacja jest najważniejszym spójnikiem, to *modus ponens*, albo *modus ponendo ponens* (z
łacińskiego *sposób potwierdzający potwierdzeniem*), albo *reguła odrywania*, jest najważniejszą
regułą dedukcji (schematem wnioskowania dedukcyjnego). Reguła ta mówi:

*Jeżeli `p → q`, to jeżeli `p`, to `q`*.

*Jeżeli akceptujemy implikację `p → q` i jej poprzednik `p`, to akceptujemy również jej następnik
`q`*.

*Jeżeli `p → q` ma dowód i jej poprzednik `p` ma dowód, to `q` ma dowód*.

W teorii typów ta reguła jest *wbudowana w język*: 

*Jeżeli mamy dowód zdania `p → q`, ...*

*Gdy już mamy funkcję `dodaj2`, która ma typ `Nat → Nat`, ...*

*to jeżeli mamy też dowód zdania `p`, ...*

*to jeżeli mamy term typu `Nat`, na przykład `10`, ...*

*to aplikując dowód zdania `p → q` do dowodu zdania `q`, ...*

*to aplikując funkcję `dodaj2` do termu `10` ...*

*uzyskujemy dowód zdania `q`, czyli term typu `q`*.

*uzyskujemy liczbę `12`, która jest termem typu `Nat`*.

Czy widzisz, że w przypadku aplikacji "zwykłych" funkcji takich jak `dodaj2` do jakiś termów
interesuje nas *wynik*, a nie jego *typ*, natomiast w przypadku aplikacji dowodów implikacji, które
to dowody też są funkcjami, interesuje nas *typ* rezultatu aplikacji, a *nie* rezultat? Jeżeli tego
nie widzisz, to może przeczytaj poprzedni fragment jeszcze raz - prędzej czy później nie będziesz w
stanie tam tego nie zobaczyć.

# Dowody są nieważne

Gdy konstruujemy dowód, albo używamy dowodu już istniejącego do konstrukcji innych dowodów, obchodzi
nas przede wszystkim *istnienie* dowodu, a nie jego *struktura*. To dobra wiadomość, bo oznacza, że
w momencie udowodnienia twierdzenia możemy *zapomnieć* o jego dowodzie i traktować twierdzenie jak
"prawdę objawioną", co zmniejsza obciążenie poznawcze. Na ogół nie tracimy wtedy wiele, bo to, jak
wygląda dowód jakiegoś zdania, nie musi być w żaden prosty sposób związane z jego treścią. Dowody
nie służą do "ujawniania treści" zdań, tylko do rozstrzygania o ich prawdziwości, przez co struktura
dowodu jest często pouczająca tylko jako wskazówka, jak można dowodzić danego typu zdań i niewiele
mówi o tym, co te zdania znaczą.

Względną nieważność struktury dowodu po prostu *widać*, gdy rozpiszemy analogię między implikacjami
i funkcjami w sposób taki jak zrobiłem to wyżej. W Lean punkt widzenia, zgodnie z którym liczy się
fakt istnienia dowodu, a nie jego struktura, obowiązuje jako *zasada* (która nosi nazwę *proof
irrelevance*). Dlatego funkcje zdefiniowane z użyciem słowa kluczowego `theorem` są traktowane
inaczej niż "zwykłe" funkcje (czyli zwykłe programy komputerowe), które definiujemy używając słowa
`def`. W szczególności, Lean *nie rozpakowuje definicji twierdzeń*, bo *nie ma takiej potrzeby*:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
theorem t1 (a : Prop) : a → a := fun (h : a) => h

variable (q : Prop) -- Deklarujemy, że mamy zdanie q, żeby mieć do czego stosować t1

-- Typ funkcji dodaj2 jest "trywialny"
#check @dodaj2 -- dodaj2 : Nat → Nat

-- Twierdzenie t1 ma fragment wykonywalnego kodu *w swoim typie* (ma typ zależny)
#check t1 -- t1 (a : Prop) : a → a

-- Tutaj interesuje nas wynik aplikacji (dodawania), a nie jego typ. Obliczenie, które nas
-- interesuje, zachodzi na poziomie "konkretnym", "wewnątrz" funkcji dodaj2:
#eval dodaj2 2 -- 4

-- Tutaj interesuje nas typ aplikacji, a nie jej wynik. Chociaż nie wymuszamy ewaluacji aplikacji, 
-- to samo zestawienie t1 i q wymusza pewnego rodzaju "obliczenie". Sama aplikacja t1 q, a nie jej 
-- wynik, jest już dowodem zdania q → q. Jedyne "obliczenie", które nas tu interesuje, zachodzi 
-- na poziomie typów. 
#check t1 q -- t1 q : q → q
```

W zwykłych funkcjach czy programach chodzi o tak lub inaczej rozumiane "obliczenie" jakiegoś
rezultatu, na przykład o obliczenie wyniku dodawania, chodzi też o wynik; w twierdzeniach chodzi
jedynie o to, że typ twierdzenia, który jest jego treścią, ma *jakiś* dowód / jest zamieszkany przez
*jakiś* term.

W teorii typów "obliczenia" zachodzą w *dwóch wymiarach*: w wymiarze typów i w wymiarze, który
moglibyśmy nazwać "konkretnym". Na poziomie konkretnym "działa" matematyka konkretna albo
*stosowana*, jak również zwykłe programowanie - na tym poziomie operujemy na przykład konkretnymi
liczbami i interesują nas wyniki zastosowania do nich operacji dodawania. Natomiast na poziomie
typów "istnieje" i "działa" matematyka teoretyczna.

Wszystkie polecenia, które do tej pory wykonywałe/aś, polegały na operowaniu *jednocześnie* na
poziomie konkretnym i teoretycznym matematyki, po prostu dlatego, że *każdy term miał typ, a każdy
typ był termem*:

```lean
#check @dodaj2 -- dodaj2 : Nat → Nat

-- Ta Aplikacja ma jednocześnie wymiar konkretny, na którym zachodzi dodawanie i powstaje wynik
#eval dodaj2 2 -- 4
-- i wymiar teoretyczny, na którym zachodzi "oderwanie poprzednika" typu Nat → Nat
#check dodaj2 2 -- dodaj2 2 : Nat

-- Struktura dowodu nie ma znaczenia dla prawdziwości twierdzeń, dlatego tutaj Lean sygnalizuje błąd:
-- cannot evaluate, proofs are not computationally relevant
#eval t1 q

-- Samo zestawienie t1 i q jest już jednak jakimś obliczaniem na poziomie konkretnym.
-- To zestawienie jest "konkretyzacją" matematyki teoretycznej - matematyką teoretyczna jako programowaniem.
#check t1 q -- t1 q : q → q
```
