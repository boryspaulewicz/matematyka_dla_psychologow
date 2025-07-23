<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie, ...

... pytają [łabędzie](https://youtu.be/6qDq9eGUmMI?si=wyseYEGYCbGXz9if).

# ... a później rekordowo i z klasą

```lean
-- Może to nie jest przyjemna lektura, ...
#print List
-- inductive List.{u} : Type u → Type u
-- number of parameters: 1
-- constructors:
-- List.nil : {α : Type u} → List α
-- List.cons : {α : Type u} → α → List α → List α
-- Mark set

-- Dzięki umieszczeniu kopii w nowej przestrzeni nazw nie występuje konflikt nazw wynikający ze
-- zdefiniowania dwukrotnie tej samej stałej (tutaj stałej `List`). Mówiąc dokładniej, nieco poniżej
-- zaczyna się ...
namespace Kopia -- ... fragmentu zawartości pliku Prelude.lean.

-- Za pomocą pary oznaczeń `/--` i `-/` można wygodnie tworzyć komentarze zajmujące więcej niż jedną
-- linię.

-- ... ale za to może ta definicja ładowana przez Leana na starcie również nie jest lekturą
-- przyjemną:

/--
Linked lists: ordered lists, in which each element has a reference to the next element.

[To mówię ja, (współ)autor: Przepraszam, że tak wszedłem dokumentacji w słowo, ale chciałem
 powiedzieć, że na Twoim miejscu nie przejmowałbym się za bardzo tym technicznym objaśnieniem.]

Most operations on linked lists take time proportional to the length of the list, because each
element must be traversed to find the next element.

`List α` is isomorphic to `Array α`, but they are useful for different things:
* `List α` is easier for reasoning, and `Array α` is modeled as a wrapper around `List α`.
* `List α` works well as a persistent data structure, when many copies of the tail are shared. When
  the value is not shared, `Array α` will have better performance because it can do destructive
  updates.
-/
inductive List (α : Type u) where
  /-- The empty list, usually written `[]`. -/
  | nil : List α
  /--
  The list whose first element is `head`, where `tail` is the rest of the list.
  Usually written `head :: tail`.
  -/
  | cons (head : α) (tail : List α) : List α

end Kopia

----------------------------------------------------------------------------------------------------
-- W praktyce parametryczny typ indukcyjny `List` działa tak, jak można się spodziewać:

-- Literały takie jak `0`, `1`, `2`, itd. Lean interpretuje jako termy typu `Nat.
#check [1, 2, 1]          -- `[1, 2, 3] : List Nat`

#eval  [1, 2, 6].length   -- `3`

#eval  List.length [1, 2] -- `2`

-- Gdy napiszemy tak ...
--
-- `#eval  [].length`
--
-- Lean będzie się skarżył, bo nie będzie mógł wywnioskować, jakiego dokładnie typu ma być ta *lista
-- pusta*. Możemy mu to zawsze powiedzieć wprost, stosując jawne typowanie:
#eval ([] : List String).length -- 0
```

**Sugestia**: Zdefiniuj może co najmniej jedną stałą o typie listy liczb naturalnych i sprawdź jej
długość jak wyżej. Będzie Ci się inaczej czytało. To znaczy, jeśli to zrobisz, to będzie Ci się
czytało, a przede wszystkim myślało i uczyło się w taki sposób A, że gdybyś wcześniej nie
zastosowała się była do tej sugestii, to zamiast sposobu A pojawi się sposób B, który jest nie tylko
pod ważnymi względami (funkcjonalnie) inny niż A, ale jest w dodatku, przynajmniej według mnie,
gorszy. Tych dwóch możliwych sposobów doświadczania nie da się porównać z definicji, ponieważ
dotyczą zdarzeń rozgrywających się w tym samym momencie, ale jako etapy różnych historii, z których
tylko jedna "się rozegra".

W Leanie taki na przykład typ `String` jest zdefiniowany jako *rekord* zawierający tylko jedno pole
o nazwie `data` i typie `List Char`, czyli o typie lista znaków:

```lean
-- Termy typu `Char`, czyli znakowe, zapisujemy tak ...
#check 'x' -- 'x' : Char
-- ... a tak nie, bo `xy` nie jest pojedynczym znakiem:
--
-- #check 'xy'

#eval "jakiś tekst".data        -- ['j', 'a', 'k', 'i', 'ś', ' ', 't', 'e', 'k', 's', 't']

-- Każdy typ rekordowy ma konstruktor, który domyślnie nosi nazwę `mk`, pamiętasz?
#eval String.mk ['a', 'b', 'c'] -- "abc"

-- Ponieważ `String.data : List Char`, możemy do tego pola zastosować funkcję `List.length`:
#eval "abc".data.length         -- 3
```
<hr>

## Różne wcielenia funkcji `cons`

Operacja dodawania elementu do "czoła" listy, o ogólnie przyjętej nazwie
[*cons*](https://en.wikipedia.org/wiki/Cons), to w pewnym sensie najbardziej podstawowa operacja na
listach.

Listy odgrywają ważną rolę w wielu różnych językach programowania. Występują na przykład w języku
[R](https://pl.wikipedia.org/wiki/R_(j%C4%99zyk_programowania)) pod nazwą `list`. Z językiem R na
pewno albo już się zetknęłaś, albo prędzej czy później się zetkniesz, jeśli studiujesz na przykład
psychologię, bo ten język jest obecnie najczęściej stosowanym narzędziem informatycznym we
wszelkiego rodzaju analizach statystycznych. Listy w języku R tworzymy tak ...

```r
moja_lista = list(1, 5, list("jakiś tekst"))

## ... a używamy ich między innymi tak:
moja_lista[[2]]
## [1] 5
```

Niektóre różnice między listami w Leanie i w R, takie jak szczegóły notacji, są powierzchowne. Ale
inne są głębsze. Jedna z głębszych różnic polega na tym, że listy w R nie muszą zawierać elementów
tego samego typu. Dlatego pod pewnymi względami bliższym odpowiednikiem list Leana w R są typy
nazywane w R [*wektorami*](https://www.w3schools.com/r/r_vectors.asp)[^2]. Inne głębsze różnice
wynikają stąd, że R jest językiem imperatywnym, a więc służącym przede wszystkim do opisu
oczekiwanych zmian fizycznego stanu komputera. Ponieważ R jest mimo wszystko dosyć zwyczajnym
językiem imperatywnym, jego system typów jest zdecydowanie zbyt prymitywny, żeby można było z niego
korzystać wygodnie do uprawiania na poważnie matematyki.

Co jest w mojej ocenie intrygujące, gdy popatrzymy na tą akurat różnicę między takim dajmy na to
Leanem i R z takiej oto strony: Wnioskowanie statystyczne to szczególny przypadek dedukcji. Gdybyśmy
przeprowadzili wnioskowanie statystyczne z jakiś danych za pomocą Leana, wnioskom towarzyszyłby
ostateczny dowód ich poprawności (jako wniosków statystycznych). Zamiast tego, do krojenia
pietruszki rozumowania dedukcyjnego używamy najczęściej piły elektrycznej pewnego języka
imperatywnego. Moim skromnym zdaniem, dzieje się tak przede wszystkim dlatego, że wszyscy bez
wyjątku jesteśmy debilami (albo debilkami!).

Istnieje nawet cały język programowania, w którym cons jest operacją podstawową. Ten wspaniały i
zarazem dla prawie każdego zawodowego programisty niemal odpychająco egzotyczny składniowo język, a
raczej rodzina języków, nazywa się [Lisp](https://pl.wikipedia.org/wiki/Lisp). Lisp to drugi
najstarszy język programowania wysokiego poziomu pozostający ciągle w użyciu (pierwszym jest
Fortran). Powstał, jak dowiadujemy się z Wikipedii, "jako wygodna matematyczna notacja dla programów
komputerowych, oparta na rachunku lambda stworzonym przez Alonzo Churcha" i przez wiele lat był
wykorzystywany głównie do prowadzenia badań nad sztuczną inteligencją, o czym można się dowiedzieć z
[tej](http://jmc.stanford.edu/articles/lisp.html) krótkiej opowieści o jego historii, napisanej
przez samego pomysłodawcę i autora, czy może raczej odkrywcę (?) Lispa, [Johna
McCarthy'ego](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)).

Kilka dzwonków dzwoni? Notacja matematyczna, rachunek lambda, nic nie dzwoni? Skoro przytoczony
fragment kodu w R wyglądał podobnie do kodu operującego na listach napisanego w Leanie, to fragment
kodu napisanego w jakimś dialekcie Lispa powinien tym bardziej wyglądać podobnie, co nie? I wygląda,
pod pewnymi względami. W artykule Wikipedii przytoczono taki przykład kodu ...

```common_lisp
(list 1 2 (list 3 4))
```

... który, jak (zgodnie z prawdą) podaje Wikipedia, ewaluuje się do tego:

```common_lisp
(1 2 (3 4))
```

Widzimy więc, że podobnie jak w R, listy w Lispie nie muszą zawierać elementów tego samego typu, bo
przecież ta lista składa się z liczb i z *listy* liczb. Coś jeszcze widzimy? Pierwsze wyrażenie to
aplikacja funkcji `list` do trzech argumentów, z których pierwsze dwa to liczby `1` i `2`, a trzeci
to aplikacja funkcji `list` do dwóch liczb, `3` i `4`. 

I wszystko byłoby fajnie i wszystko byłoby cacy i to by w zasadzie już było na tyle, gdyby nie to,
że wynik ewaluacji tego wyrażenia, który jest w Lispie pewną *strukturą danych*, to jest listą, jest
*zapisany tak samo*, to jest jako dwie zagnieżdżone sekwencje oddzielonych nawiasami okrągłymi
elementów, jak fragment generującego te dane *kodu*. Jest tak dlatego, że *kod napisany w dialekcie
Lispa jest strukturą danych tego dialektu*, a mówiąc dokładniej kod Lispa jest listą albo sekwencją
list. Co znaczy, że w Lispie można (łatwo!) pisać *funkcje, które przetwarzają kod*. Nie funkcje,
które przetwarzają *funkcje* albo *typy* (chociaż to też można robić), tylko *kod*, również *własny*
kod.

Dzięki temu w Lispie wyjątkowo wygodnie można się bawić w
[*metaprogramowanie*](https://pl.wikipedia.org/wiki/Metaprogramowanie). A w odpowiednich rękach
metaprogramowanie może działać w niesamowity sposób, nierzadko dając komuś, kto je opanował,
poczucie niemal nieznośnie swędzącej mocy. Jeżeli sprawnie władający Lispem użytkownik ma ochotę
zacząć korzystać na przykład z [paradygmatu programowania
obiektowego](https://pl.wikipedia.org/wiki/Programowanie_obiektowe), ale używa implementacji Lispa,
która mu nie dostarcza tego, czego sobie życzy, może *przerobić język* na taki, który wspiera
programowanie obiektowe w pożądanym stylu (istnieją różne).

Edytor programisty `Emacs`, którego używam do wszystkiego, łącznie z gotowaniem[^1], jest napisany
swłaśnie w dialekcie Lispa. Ale to jest akurat drobiazg. Ciekawsze jest to, że sama *konfiguracja*
sposobu działania tego edytora polega często na *pisaniu programów* w Lispie. Niemniej, jak kocham
Lispa i kocham Emacsa miłością głęboką, szczerą i czystą, tak muszę pogodzić się z tym, że dialekty
Lispa też mają zbyt prymitywny wbudowany system typów, żeby można ich było używać wygodnie i z
sensem do uprawiania wszelkiej matematyki.

<hr>

Ponieważ listy są tak ważne i ponieważ ta operacja jest taka podstawowa, Lean ją słodzi:

```lean
-- Zwracam uwagę na brak nawiasów kwadratowych wokół pierwszego argumentu funkcji `List.cons`, którą
-- tutaj stosujemy w notacji wzrostkowej, oznaczając ją symbolem `::`. Ten pierwszy argument musi
-- być termem takiego typu, jak typ elementów listy, do której go dodajemy, ...
#eval 1 :: [2, 3] -- [1, 2, 3]

-- ... dlatego to jest błąd:
--
-- `#eval "X" :: [1, 2]`
```

**Sugestia**: Spróbuj może, używając tego lukru, stworzyć jakąś krótką listę termów typu `String`?
Jako drugi argument do `::` możesz podać również listę pustą, wtedy będzie najkrócej, jak się da, i
Lean domyśli się, że skoro pierwszy argument ma typ `String`, to drugi jest listą pustą typu `List
String`.

Lista elementów na przykład typu `Nat`, czyli term typu `List Nat`, to albo lista pusta `[]`, a pod
lukrem `List.nil`, albo lista `[n]`, gdzie `n : Nat`, a pod lukrem `List.cons n List.nil`, albo `[m,
n]` gdzie `m n : Nat`, a pod lukrem `List.cons m (List cons n List.nil)`, i tak dalej. Definicja
listy, poza tym, że jest parametryczna, jest więc też rekurencyjna, bo słowo (ale czy stała? to
przecież język naturalny) lista występuje w
[*definiensie*](https://pl.wikipedia.org/wiki/Definicja#Budowa_definicji). Termy typów
rekurencyjnych często najwygodniej jest przetwarzać za pomocą *funkcji rekurencyjnych*, takich jak
ta:

```lean
def suma_elementow (lista : List Nat) : Nat :=
  match lista with
  | [] => 0
  | pierwszy_element :: lista_pozostalych_elementow => 
     pierwszy_element + (suma_elementow lista_pozostalych_elementow)
```

TODO Zamienić na mnożenie

TODO Podoba Ci się lukier oznaczania początku i końca listy za pomocą nawiasów kwadratowych i oddzielania
elementów list przecinkami?

### Przypisy

[^1]: Powinienem raczej powiedzieć, że Emacsa używałem, w czasie przeszłym, do gotowania. I R-a. I
    C. Napisałem kiedyś w R, w którym piszę prawie wyłącznie korzystając z Emacsa, kawałek kodu,
    który sterował zewnętrznym mikrokontrolerem [AVR](https://pl.wikipedia.org/wiki/Atmel_AVR)
    podłączonym przez port USB, który to mikrokontroler zaprogramowałem w języku C tak, żeby
    mógł 1. zwierać i rozwierać przekaźnik, który był podłączony do przewodu, który zasilał
    zanurzoną w wodzie grzałkę, i 2. odczytywać temperaturę z termometru cyfrowego, który był
    również zanurzony w wodzie. Sterowanie grzałką było zrealizowane za pomocą funkcji, która
    pobierała różne parametry, ale najważniejszy był docelowy poziom temperatury. Najpierw
    stworzyłem wersję opartą na algorytmie [PID](https://pl.wikipedia.org/wiki/Regulator_PID),
    którego zresztą używałem również do sterowania grzałką ekspresu do kawy (zanim mi się to udało,
    w całym bloku wysadziłem korki), ale przekonałem się, że gdy w tej samej wodzie działa
    wystarczająco mocna pompka elektryczna, to dzięki wywołanej w ten sposób cyrkulacji wystarczy
    wyłączać grzałkę, gdy temperatura jest za wysoka i pozostawiać ją włączoną, gdy jest za
    niska. Żadne PIDy, ani tym bardziej jakieś frymuśniejsze metody sterowania nie są wtedy
    potrzebne, bo temperatura pozostaje równa docelowej z dokładnością do mniej niż jednego stopnia
    Celsjusza. No więc program w R sterował urządzeniem, które kontrolowało temperaturę wody i które
    działało zgodnie z programem napisanym w C, a wszystko to było interaktywne i działo się
    "wewnątrz" Emacsa, który jest napisanay w Lispie. I gdy na przykład rodzina zasiadła na przykład
    w niedzielę do stołu, na stole stał średniej wielkości przezroczysty pojemnik z Ikei, w nim
    woda, grzałka, termometr cyfrowy i pompka, wszystko to było podłączone do laptopa, na ekranie
    którego można było zobaczyć, co się dokładnie dzieje, a w zanurzonych w wodzie woreczkach
    strunowych pływały na przykład kawałki łososia. Chwaląc się bezwstydnie dalej jeszcze dodam, że
    zrobiłem to w czasach, kiedy jedynym dostępnym na rynku urządzeniem do [*sous
    vide*](https://en.wikipedia.org/wiki/Sous_vide), bo tak (myląco) nazywa się ta technika
    kulinarna, był kosztujący niemałe pieniądze produkt firmy
    [PolyScience](https://www.polyscience.com/?srsltid=AfmBOorFp_HUvPQMqY0XBdM8eMrfSsjCDcHEkX6bFx0q_wcKN0oiG84X),
    a jedyną krakowską restauracją, w której ta technika była stosowana, była [Bottiglieria
    1881](https://1881.com.pl/), która obecnie jako jedyna w Krakowie ma dwie gwiazdki
    [Michelina](https://pl.wikipedia.org/wiki/Przewodnik_Michelin). (Mówiąc nawiasem i tak między
    nami, kiedy robiłem wstępne eksperymenty, żeby sprawdzić, czy to wszystko działa, funkcja
    sterująca w regularnych interwałach aktualizowała wykres zmian temperatury w czasie, który
    mogłem oglądać na komórce będąc na przykład w pracy. Ale na pewno nie w trakcie prowadzonych
    zajęć. Zmieńmy temat.)

[^2]: Jak na stronę poświęconą narzędziom informatycznym, można tam znaleźć ciekawe przykłady daleko
    idącej swobody językowej. I tak, o wektorach w R dowiadujemy się z pierwszego zdania, że *A
    vector is simply a list of items that are of the same type*. *Simply* a *list*? *Wektor* to
    *simply a list*? Uff.
