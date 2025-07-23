<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie, ...

... pytają [łabędzie](https://youtu.be/6qDq9eGUmMI?si=wyseYEGYCbGXz9if).

# ["zaraz", " ", "będzie", " ", "o", " ", "tych", " ", "klasach", " ", "typów", ", ", "tylko", " ", "jeszcze", " ", "powiem", " ", "coś", " ", "o", " ", "listach"]

Może to nie jest przyjemna lektura ⬝⬝⬝ 

```lean
#print List
-- inductive List.{u} : Type u → Type u
-- number of parameters: 1
-- constructors:
-- List.nil : {α : Type u} → List α
-- List.cons : {α : Type u} → α → List α → List α
-- Mark set

-- Dzięki umieszczeniu kopii w nowej przestrzeni nazw nie występuje konflikt nazw wynikający ze
-- zdefiniowania dwukrotnie tej samej stałej (tutaj stałej `List`). To tylko ...
namespace kopia -- ... fragmentu zawartości pliku Prelude.lean.

-- Za pomocą pary oznaczeń `/--` i `-/` można wygodnie tworzyć komentarze zajmujące więcej niż jedną
-- linię.

-- ⬝⬝⬝ ale za to może ta definicja ładowana przez Leana na starcie również nie jest lekturą
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

end kopia
```

W praktyce parametryczny typ indukcyjny `List` działa tak, jak można się spodziewać:

```lean
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
dotyczą zdarzeń zachodzących w tym samym momencie, ale jako etapy różnych historii, z których tylko
jedna "się rozegra".

W Leanie taki na przykład typ `String` jest zdefiniowany jako *rekord* zawierający tylko jedno pole
o nazwie `data` i typie `List Char`, czyli o typie lista znaków:

```lean
-- Termy typu `Char`, czyli znakowe, zapisujemy tak ...
#check 'x' -- 'x' : Char

-- ... a tak nie, bo `xy` nie jest *pojedynczym* znakiem:
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
imperatywnego. Trzeba potem samemu sobie regularnie wmawiać niejasne powody by ufać w jakość
ostatecznego wyniku i wcinać tą zagadkową sałatkę nie grymasząc. Moim skromnym zdaniem, dzieje się
tak przede wszystkim dlatego, że wszyscy bez wyjątku jesteśmy debilami (albo debilkami!).

Istnieje nawet cały *język* programowania, w którym cons jest operacją podstawową. Ten wspaniały i
zarazem dla prawie każdego zawodowego programisty niemal odpychająco egzotyczny składniowo język, a
raczej rodzina języków, nazywa się [Lisp](https://pl.wikipedia.org/wiki/Lisp). Lisp to drugi, po
Fortranie, najstarszy nadal używany język programowania wysokiego poziomu. Powstał, jak dowiadujemy
się z Wikipedii, "jako wygodna matematyczna notacja dla programów komputerowych, oparta na rachunku
lambda stworzonym przez Alonzo Churcha" i przez wiele lat był wykorzystywany głównie do prowadzenia
badań nad sztuczną inteligencją, o czym można się dowiedzieć z
[tej](http://jmc.stanford.edu/articles/lisp.html) krótkiej opowieści o jego historii, napisanej
przez samego pomysłodawcę i autora, czy może raczej odkrywcę (?) Lispa, [Johna
McCarthy'ego](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)).

Kilka dzwonków dzwoni? Notacja matematyczna, rachunek lambda, coś dzwoni, prawda? Skoro przytoczony
fragment kodu w R wyglądał trochę podobnie do kodu operującego na listach napisanego w Leanie, to
fragment kodu napisanego w jakimś dialekcie Lispa też powinien wyglądać podobnie, co nie? I wygląda,
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
*zapisany tak samo* - to jest jako dwie zagnieżdżone sekwencje oddzielonych nawiasami okrągłymi
elementów - jak fragment generującego te dane *kodu*. Jest tak dlatego, że *kod napisany w dialekcie
Lispa jest strukturą danych tego dialektu*, a mówiąc dokładniej, kod Lispa jest listą albo sekwencją
list. Co znaczy, że w Lispie można (łatwo!) pisać *funkcje*, które przetwarzają *kod*. Nie funkcje,
które przetwarzają *funkcje* (chociaż to też można robić) albo *typy* (i to też, ale z większym
trudem), tylko *kod*, również *własny* kod.

Dzięki temu w Lispie wyjątkowo wygodnie można się bawić w
[*metaprogramowanie*](https://pl.wikipedia.org/wiki/Metaprogramowanie). A w odpowiednich rękach
metaprogramowanie może działać w niesamowity sposób, nierzadko dając komuś, kto je opanował,
poczucie niemal nieznośnie swędzącej mocy. Jeżeli sprawnie władający Lispem użytkownik ma ochotę
zacząć korzystać na przykład z [paradygmatu programowania
obiektowego](https://pl.wikipedia.org/wiki/Programowanie_obiektowe), ale używa implementacji Lispa,
która mu nie dostarcza tego, czego sobie życzy, może *pisząc odpowiedni kod przerobić sam język* na
taki, który wspiera programowanie obiektowe w pożądanym stylu (istnieją różne).

Edytor programisty `Emacs`, którego używam do wszystkiego, łącznie z gotowaniem[^1], jest napisany
właśnie w dialekcie Lispa. Ale to jest akurat drobiazg. Ciekawsze jest to, że sama *konfiguracja*
sposobu działania tego edytora polega często na *pisaniu programów* w Lispie. Niemniej, jak kocham
Lispa i kocham Emacsa miłością głęboką, szczerą i niezmienną, tak muszę przyznać, że dialekty Lispa
też mają zbyt prymitywny wbudowany system typów, żeby można ich było używać wygodnie i z sensem do
uprawiania wszelkiej matematyki.

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
Jako drugi argument do `::` możesz podać również listę pustą. Wtedy będzie najkrócej, jak się da i
Lean domyśli się, że skoro pierwszy argument ma typ `String`, to drugi jest listą pustą typu `List
String`.

Lista elementów na przykład typu `Nat`, czyli term typu `List Nat`, to albo lista pusta `[]`, a pod
lukrem `List.nil`, albo lista `[n]`, gdzie `n : Nat`, a pod lukrem `List.cons n List.nil`, albo `[m,
n]` gdzie `m n : Nat`, a pod lukrem `List.cons m (List cons n List.nil)`, i tak dalej. Definicja
listy, poza tym, że jest parametryczna, jest więc też rekurencyjna, bo słowo (ale czy stała? to
przecież język naturalny) "lista" występuje w
[*definiensie*](https://pl.wikipedia.org/wiki/Definicja#Budowa_definicji). *Termy typów
rekurencyjnych* często najwygodniej jest przetwarzać za pomocą *funkcji rekurencyjnych*, takich jak
ta:

```lean
def suma_elementow (lista : List Nat) : Nat :=
  match lista with
  | [] => 0
  | pierwszy_element :: lista_pozostalych_elementow => 
     pierwszy_element + (suma_elementow lista_pozostalych_elementow)
```

Pisałem już o strukturze takich funkcji, ale to było dawno, więc w ramach kolejnej odroczonej
powtórki wyjaśniam, że ciało tej funkcji **czytamy jako**: Dopasuj zmienną `lista` do jednego z
dwóch wzorców (`match lista with`) 1. lista pusta, czyli `List.nil`, a z lukrem `[]`, a jeśli
pasuje, zwróć `0` (`| [] => 0`) i 2. pierwszy element i lista pozostałych elementów, czyli lista
pasująca do drugiego konstruktora `List.cons <element> <lista>`, a z lukrem `pierwszy_element ::
lista_pozostalych_elementow`, a jeśli pasuje, dodaj ten pierwszy *element* do *wyniku zastosowania
funkcji `suma_elementow`* do listy pozostałych elementów. Pozwolisz, że tego fragmentu kodu nie będę
już tu kopiował (w nawiasie).

Zwracam uwagę na dwa warunki, które musi spełniać każda "zwykła" (można to obejść) definicja funkcji
rekurencyjnej:

1. Proces ewaluacji musi się zakończyć dla każdego możliwego argumentu. W przypadku tej funkcji
   wywołanie rekurencyjne jest zawsze aplikacją do *coraz mniejszej* listy, która ostatecznie musi
   stać się listą pustą, na której przetwarzanie listy się skończy. Lean sprawdza takie rzeczy i
   pozwala nam tworzyć definicje funkcji rekurencyjnych tylko wtedy, gdy sam znajdzie dowód, albo my
   mu dostarczymy dowód, że ewaluacja musi się zakończyć.

2. W ciele funkcji musimy obsłużyć wszystkie możliwe sposoby konstruowania termów dopasowywanego
   typu, czyli termów typu, którego term występuje zaraz po słowie kluczowym `match`.
   
Obsłużenie wszystkich metod konstrukcji można zagwarantować również w taki "leniwy" sposób:

```lean
-- `Bool` to (nieparametryczny i nierekurencyjny) indukcyjny typ danych o dwóch konstruktorach,
-- `true` i `false`. Ale wszyscy faceci zdają się widzieć w nim tylko jedno - typ wartości
-- logicznych.
def przepraszam_cz_t_lst_jst_pst (lista : List α) : Bool :=
  match lista with
  | [] => true
  -- A dla wszystkich innych przypadków zwróć `false`
  | _ => false

#eval przepraszam_cz_t_lst_jst_pst ([] : List Nat)        -- `true`

#eval przepraszam_cz_t_lst_jst_pst [3, 3, 3]              -- `false`
```

**Sugestia**: Jeżeli nie masz wieloletniego doświadczenia w programowaniu, to nawet, jeśli wydaje Ci
się to zbyt proste żeby było ciekawe, może spróbuj przerobić funkcję `suma_elemnentow` na działającą
analogicznie funkcję `iloczyn_elementow`. Potem sprawdź, jak Twoja funkcja działa dla jakiejś jednej
czy dwóch krótkich list liczb naturalnych. Uważaj wtedy na wartość zwracaną dla listy pustej, bo
mnożenie liczb działa inaczej, niż ich dodawanie. Jak to zrobisz, spróbuj zdefiniować analogiczną
funkcję działającą na listach *tekstów*, używając zamiast dodawania, aplikowanego w stylu
przedrostkowym działania (bo ta funkcja jest przecież również działaniem!) `String.append`. Tą
funkcję też sprawdź na jednej czy dwóch listach. Wybór wartości zwracanej dla listy pustej będzie
wtedy tekstowym analogonem zera (ze względu na dodawanie) i jednocześnie jedynki (ze względu na
mnożenie).

## Wiele hałasu o Coś

Być może pomyślałaś sobie, że typ list to takie wiele hałasu o nic. W końcu to tylko skończone
sekwencje termów czy elementów czy obiektów tego samego typu, którym towarzyszy oczywisty interfejs
dostawiania elementu na czoło, wyłuskania, i inne tego rodzaju funkcjnalności. No i o co właściwie
chodzi z tymi różnicami między implementacjami typu list w różnych językach? Nawet, jeżeli tak
pomyślałaś, co by mnie wcale nie zdziwiło, bo tam tak kiedyś wiele razy pomyślałem, to zgodzisz się
chyba, że ogólne pojęcie skończonej sekwencji elementów jest dla nas, ludzi, fundamentalne. Na
przykład, cały ten akapit jest pewnym skończonym ciągiem elementów tego samego typu. Każde
wielokrotne dodawanie lub mnożenie liczb można równie dobrze zapisać jako skończony ciąg elementów
tego samego typu. Skończone ciągi, nazywane również n-tkami, występują niezwykle często w
przeróżnych działach matematyki. I tak dalej.

A jednak skończone ciągi elementów czy wartości są *implementowane* w językach programowania na
*dwa*, fundamentalnie różnych sposoby. Pierwszy z nich odpowiada typowi list w Leanie: Skończony
ciąg jest wtedy zbudwany (mówimy o implementacji) z dwóch rodzajów obiektów, 1. *listy pustej* i 2
*aplikacji* konstruktora `cons` do *dwóch* termów: elementu, który ma być dołożony na czoło i listy,
która ma "dostać" nowe czoło. W Leanie te dwa rodzaje termów, lista pusta i aplikacja funkcji
`cons`, są *nieredukowalne* (bo definicja parametrycznego indukcyjnego typu danych to funkcjonalnie
schemat aksjomatu, pamiętasz?). 

To zatem tylko *napisy*, które traktujemy za pomocą interfejsu różnych funkcji jak listę pustą i
listy niepuste. Ten *zapis* ...

`List.cons 1 (List.cons 2 List.nil)`

... *jest* listą, którą posługując się lukrem możemy również zapisać jako `[1, 2]`. Widzimy tutaj
*logiczną* strukturę tego typu danych, i *nic więcej*, ponieważ to jest czysty język
funkcyjny. Logiczną strukturę [*listy jednokierunkowej*](https://pl.wikipedia.org/wiki/Lista), bo
tak też, dokładniej, nazywa się ten typ danych, możemy równie dobrze zakodować za pomocą par
stykających się "komórek", z których *pierwsza* zawiera jakąś *wartość*, a *druga* zawiera
*strzałkę* (rozumianą jako wskaźnik albo adres) do *innej* pary komórek. Przyszło Ci do głowy, że te
strzałki mogłyby wskazywać kolejne pary komórek w taki sposób, że posługując się skończoną liczbą
par komórek ze strzałkami można by było stworzyć ciąg nieskończony? No więc wymagamy, żeby dla
każdej listy dało się dojść, idąc tropem strzałek, do specjalnej *pojedynczej* komórki
"bezwartościowej", której rolą jest jedynie reprezentowanie końca listy (co znaczy dokładnie to
samo, co: interfejs funkcji działających na listach działa na tej komórce tak, jakby była listą
pustą).

**Rysunek 1**: Narysuj proszę w miejscach wierzchołków wyobrażonego trójkąta równobocznego trzy pary
stykających się kwadratów, a po lewej od lewej dolnej pary narysuj pojedynczy kwadrat z kółkiem w
środku. W lewym kwadracie, czyli w lewej komórce górnej pary zapisz `2`, w lewej komórce prawej
dolnej pary zapisz `1`, a w lewej komórce lewej dolnej pary zapisz `2`. Strzałki będziemy rysować od
środków prawych komórek do środków prawych komórek, albo do środka komórki końcowej. Dorysuj więc
proszę strzałki z górnego wierzchołka do prawego, z prawego do lewego i z lewego do komórki
końcowej. To jest to samo, co lista [`[2, 1, 2]`](https://youtu.be/i3Jv9fNPjgk?si=EcitabQ7JXRX9N_p).

**Rysunek 2**: Teraz proszę poniżej narysuj tą samą listę, tylko zamiast rysować podwójne komórki, narysuj
pojedyncze okręgi z wartościami, zamiast rysować strzałkę do komórki końcowej, narysuj endostrzałkę
i ułóż trzy "wartościowe" komórki inaczej przestrzennie na stronie. To jest to samo, ale wydaje się
mieć w jakiś trudny do uchwycenia sposób inny sens albo smak, i nie chodzi o układ przestrzenny
"komórek", bo jest dla Ciebie jasne, że ten aspekt jest akurat nieistotny, prawda?

**Rysunek 3**: Na koniec narysuj proszę poziomo trzy stykające się kwadraty, zawierające kolejno
liczby `2`, `1` i `2`. Nie masz wrażenia, że to jest z jednej strony to samo, ale, co najmniej z
drugiej strony, zdecydowanie nie to samo? Jeżeli możesz, spróbuj jeszcze w jakiś sposób pogrubić
obrys komórek na ostatnim rysunku.

TODO Funkcja i implementacja jak znaczenie słów i papier poplamiony tuszem

TODO konkatenacja

TODO tablice/wektory i listy w Leanie

TODO o implementacji list za pomocą wskaźników

TODO klasy typów ftw

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
    [PolyScience](https://www.polyscience.com/?srsltid=AfmBOorFp_HUvPQMqY0XBdM8eMrfSsjCDcHEkX6bFx0q_wcKN0oiG84X)
    (the existence of which implies the existence of MonoScience and PolyArt, the existence of which
    implies the existence of MonoArt {*Mono*Science/Art my
    [ass](https://en.wikipedia.org/wiki/Donkey)}), a jedyną krakowską restauracją, w której ta
    technika była stosowana, była [Bottiglieria 1881](https://1881.com.pl/), która obecnie jako
    jedyna w Krakowie ma dwie gwiazdki
    [Michelina](https://pl.wikipedia.org/wiki/Przewodnik_Michelin). (Mówiąc nawiasem i tak między
    nami, kiedy robiłem wstępne eksperymenty, żeby sprawdzić, czy to wszystko działa, funkcja
    sterująca w regularnych interwałach aktualizowała wykres zmian temperatury w czasie, który
    mogłem oglądać na komórce będąc na przykład w pracy. Ale na pewno nie w trakcie prowadzonych
    zajęć. Zmieńmy temat.)

[^2]: Jak na stronę poświęconą narzędziom informatycznym, można tam znaleźć ciekawe przykłady daleko
    idącej swobody językowej. I tak, o wektorach w R dowiadujemy się z pierwszego zdania, że *A
    vector is simply a list of items that are of the same type*. *Simply* a *list*? *Wektor* to
    *simply a list*? Uff.
