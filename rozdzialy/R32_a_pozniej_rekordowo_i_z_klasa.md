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
tego samego typu. Inne głębsze różnice wynikają stąd, że R jest językiem imperatywnym, a więc
służącym przede wszystkim do opisu oczekiwanych zmian stanu fizycznego komputera. Dlatego proces
sprawdzania poprawności składniowej kodu w R nie może być wykorzystany do uprawiania matematyki na
poważnie, ponieważ R ma zbyt prymitywny system typów. 

Co jest w mojej ocenie intrygujące, gdy popatrzymy na tą różnicę między Leanem i R z takiej oto
strony: Wnioskowanie statystyczne to szczególny przypadek dedukcji. Gdybyśmy przeprowadzili
wnioskowanie statystyczne z jakiś danych za pomocą Leana, wnioskom towarzyszyłby ostateczny dowód
ich poprawności (jako wniosków statystycznych). Zamiast tego, do krojenia pietruszki rozumowania
dedukcyjnego używamy najczęściej piły elektrycznej pewnego języka imperatywnego. Coś mi się wydaje,
że jest tak dlatego, że wszyscy bez wyjątku jesteśmy debilami (lub debilkami!).

Istnieje nawet cały język programowania, w którym cons jest operacją podstawową. Ten wspaniały i
szarazem dla prawie każdego zawodowego programisty niemal odpychająco egzotyczny składniowo język, a
raczej rodzina języków, nazywa się [Lisp](https://pl.wikipedia.org/wiki/Lisp). To drugi najstarszy
język programowania wysokiego poziomu pozostający ciągle w użyciu (pierwszym jest Fortran), który
powstał, jak dowiadujemy się z Wikipedii, "jako wygodna matematyczna notacja dla programów
komputerowych, oparta na rachunku lambda stworzonym przez Alonzo Churcha". 

Dzwoni kilka dzwonków, prawda? Skoro przytoczony fragment kodu w R wyglądał podobnie do kodu
operującego na listach napisanego w Leanie, to fragment kodu napisanego w jakimś dialekcie Lispa
powinien tym bardziej wyglądać podobnie, co nie? I wygląda, pod pewnymi względami. W artykule
Wikipedii przytoczono taki przykład kodu ...

```common_lisp
(list 1 2 (list 3 4))
```

... który, jak podaje Wikipedia, ewaluuje się do tego:

```common_lisp
(1 2 (3 4))
```

Widzimy więc, że podobnie jak w R, listy w Lispie nie muszą zawierać elementów tego samego typu, bo
przecież ta lista składa się z liczb i z *listy* liczb. Coś jeszcze widzimy? Pierwsze wyrażenie to
aplikacja funkcji `list` do trzech argumentów, z których pierwsze dwa to liczby `1` i `2`, a trzeci
to aplikacja funkcji `list` do dwóch liczb, `3` i `4`. 

I wszystko byłoby fajnie i wszystko byłoby cacy, gdyby nie to, że wynik ewaluacji tego wyrażenia,
który jest w Lispie pewną *strukturą danych*, to jest listą, jest *zapisany tak samo*, to jest jako
dwie zagnieżdżone sekwencje oddzielonych nawiasami okrągłymi elementów, jak fragment generującego te
dane *kodu*. Jest tak dlatego, że *kod napisany w dialekcie Lispa jest strukturą danych tego
dialektu*, a konkretnie kod jest listą albo sekwencją list. Co znaczy, że w Lispie można (łatwo!)
pisać *funkcje, które przetwarzają kod*. Nie funkcje, które przetwarzają *funkcje* albo *typy*
(chociaż to też można robić), tylko *kod*, również *własny* kod. No ale dialekty Lispa też mają zbyt
prymitywny system typów, żeby można ich było używać wygodnie i z sensem do uprawiania wszelkiej
matematyki.

<hr>

Ponieważ listy są tak ważne i ponieważ ta operacja jest taka podstawowa, Lean ją słodzi:

```lean
-- Zwracam uwagę na brak nawiasów kwadratowych wokół pierwszego argumentu funkcji `List.cons`, którą
-- tutaj stosujemy w notacji wzrostkowej, oznaczając ją symbolem `::`. Ten pierwszy argument musi
-- być termem takiego typu, jak typ elementów listy, do której go dodajemy ...
#eval 1 :: [2, 3] -- [1, 2, 3]
-- ... dlatego to jest błąd:
--
-- `#eval "X" :: [1, 2]`
```

**Sugestia**: Spróbuj może, używając tego lukru, stworzyć jakąś krótką listę termów typu `String`?
Jako drugi argument do `::` możesz podać również listę pustą, wtedy będzie najkrócej jak się da i
Lean domyśli się, że skoro pierwszy argument ma typ `String`, to drugi jest listąa pustą typu `List
String`.

Lista elementów na przykład typu `Nat`, czyli term typu `List Nat`, to albo lista pusta `[]`, a pod
lukrem `List.nil`, albo lista `[n]`, gdzie `n : Nat`, a pod lukrem `List.cons n List.nil`, albo `[m,
n]` gdzie `m n : Nat`, a pod lukrem `List.cons m (List cons n List.nil)`, i tak dalej. Definicja
listy, poza tym, że jest parametryczna, jest więc też rekurencyjna, bo słowo lista występuje w
[*definiensie*](https://pl.wikipedia.org/wiki/Definicja#Budowa_definicji). Termy tego rodzaju typów
indukcyjnych często najwygodniej jest przetwarzać za pomocą *funkcji rekurencyjnych*, takich jak ta:

```lean
def suma_elementow (lista : List Nat) : Nat :=
  match lista with
  | [] => 0
  | pierwszy_element :: lista_pozostalych_elementow => 
     pierwszy_element + (suma_elementow lista_pozostalych_elementow)
```

TODO Podoba Ci się lukier oznaczania początku i końca listy za pomocą nawiasów kwadratowych i oddzielania
elementów list przecinkami?
