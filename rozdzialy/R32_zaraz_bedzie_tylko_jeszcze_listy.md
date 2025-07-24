<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie, ...

... pytają [łabędzie](https://youtu.be/6qDq9eGUmMI?si=wyseYEGYCbGXz9if).

# ["zaraz", " ", "będzie", " ", "o", " ", "tych", " ", "klasach", " ", "typów", ", ", "tylko", " ", "jeszcze", " ", "powiem", " ", "coś", " ", "o", " ", "listach"]

W praktyce parametryczny typ indukcyjny `List` działa tak, jak można się spodziewać:

```lean
-- W ten między innymi sposób możemy konstruować w Leanie termy typu `List α`, gdzie `α` to dowolny
-- typ, czyli listy termów typu `α`. Literały takie jak `0`, `1`, `2`, itd. Lean interpretuje jako
-- termy typu `Nat, a więc to jest dla Leana term typu `List Nat`:
#check [1, 2, 1]          -- `[1, 2, 3] : List Nat`

#eval  [1, 2, 6].length   -- `3`

#eval  List.length [3, 8] -- `2`

-- Gdy natomiast napiszemy tak ...
--
-- `#eval  [].length`
--
-- ... Lean będzie się skarżył, bo nie będzie mógł wywnioskować, jakiego dokładnie typu ma być ta
-- *lista pusta*. Możemy mu to zawsze powiedzieć wprost, stosując jawne typowanie:
#eval ([] : List String).length -- 0
```

**Sugestia**: Zdefiniuj może co najmniej jedną stałą o typie lista liczb naturalnych i sprawdź jej
długość tak jak to zrobiłem wyżej. Dzięki temu będzie Ci się inaczej czytało dalszy ciąg. To znaczy,
jeśli to zrobisz, to będzie Ci się czytało, a przede wszystkim myślało i uczyło się w taki sposób A,
że gdybyś wcześniej nie zastosowała się była do tej sugestii, to zamiast sposobu A pojawi się sposób
B, który jest nie tylko pod ważnymi względami (funkcjonalnie) inny niż A, ale jest w dodatku,
przynajmniej według mnie, gorszy. Tych dwóch możliwych sposobów doświadczania nie da się porównać z
definicji, ponieważ dotyczą zdarzeń zachodzących w tym samym momencie, ale jako etapy różnych
historii, z których tylko jedna "się rozegra".

W Leanie typ `String` jest zdefiniowany jako *rekord* zawierający tylko jedno pole o nazwie `data` i
typie `List Char`, czyli o typie lista znaków:

```lean
-- Termy typu `Char`, inaczej termy znakowe albo po prostu znaki, zapisujemy tak ...
#check 'x' -- 'x' : Char

-- ... a tak nie, bo `xy` nie jest *pojedynczym* znakiem:
--
-- #check 'xy'

#eval "jakiś tekst".data        -- ['j', 'a', 'k', 'i', 'ś', ' ', 't', 'e', 'k', 's', 't']

-- Jak wiesz, każdy typ rekordowy ma konstruktor, który domyślnie nosi nazwę `mk`.
#eval String.mk ['a', 'b', 'c'] -- "abc"

-- Ponieważ `String.data : List Char` (pole `data` rekordu `String` ma typ `List Char`), możemy do
-- tego pola zastosować funkcję `List.length`:
#eval "abc".data.length         -- 3
```
<hr>

## Różne wcielenia typów sekwencyjnych

Operacja dodawania elementu do *czoła* (ang. *head*) listy, o ogólnie przyjętej nazwie
[*cons*](https://en.wikipedia.org/wiki/Cons), to w pewnym sensie najbardziej podstawowa operacja na
(pewnego rodzaju) listach.

Nie bez powodu różnego rodzaju listy odgrywają ważną rolę w wielu językach programowania. Występują
na przykład w języku [R](https://pl.wikipedia.org/wiki/R_(j%C4%99zyk_programowania)) pod nazwą
`list`. Z językiem R albo już się zetknęłaś, albo prędzej czy później się zetkniesz, jeśli
studiujesz na przykład psychologię, bo ten język jest obecnie najczęściej stosowanym narzędziem
informatycznym we wszelkiego rodzaju analizach statystycznych. Listy w języku R tworzymy tak ...

```r
moja_lista = list(1, 5, list("jakiś tekst"))

## ... a używamy ich między innymi tak (wynik ewaluacji widoczny w następnym komentarzu czytamy
## jako: wektor jednoelementowy (`[1]`) zawierający element `5`):
moja_lista[[2]]
## [1] 5
```

Niektóre różnice między listami w Leanie i w R, takie jak szczegóły notacji, są powierzchowne. Ale
niektóre są głębsze. Jedna z tych głębszych różnic polega na tym, że listy w R nie muszą zawierać
elementów tego samego typu. Dlatego pod pewnymi względami bliższym odpowiednikiem list Leana w R są
typy nazywane w R [*wektorami*](https://www.w3schools.com/r/r_vectors.asp)[^2]. Inne głębsze różnice
wynikają stąd, że R jest językiem imperatywnym, a więc służącym przede wszystkim do opisu
oczekiwanych zmian fizycznego stanu komputera. Ponieważ R jest dosyć zwyczajnym językiem
imperatywnym, jego system typów jest zdecydowanie zbyt prymitywny, żeby można było z niego korzystać
wygodnie do uprawiania na poważnie matematyki.

Co jest w mojej ocenie intrygujące, gdy popatrzymy na różnice między takim dajmy na to Leanem i R z
następującej strony: *Wnioskowanie statystyczne* to szczególna postać *dedukcji*. Gdybyśmy
przeprowadzili wnioskowanie statystyczne z jakiś danych za pomocą Leana, wnioskom towarzyszyłby
ostateczny dowód ich poprawności (jako wniosków statystycznych). Zamiast tego, do krojenia
pietruszki rozumowania dedukcyjnego używamy najczęściej piły elektrycznej pewnego języka
imperatywnego. Trzeba potem samemu sobie regularnie wmawiać niejasne powody, by ufać w jakość
ostatecznego wyniku i wcinać tą zagadkową sałatkę starając się nie grymasić. Moim skromnym zdaniem,
dzieje się tak głównie dlatego, że wszyscy *z osobna* jesteśmy wspaniałymi, ale jednak ostatecznie
debilami (albo debilkami).

Istnieje nawet cały *język* programowania, w którym `cons` jest operacją podstawową. Ten wspaniały i
zarazem dla prawie każdego zawodowego programisty składniowo niemal odpychająco egzotyczny język, a
raczej rodzina języków, nazywa się [Lisp](https://pl.wikipedia.org/wiki/Lisp). Nazwa jest skrótem od
*List processing* i nie ma zdaje się związku z [seplenieniem](https://en.wikipedia.org/wiki/Lisp),
chociaż kto wie, seplenienie jest przecież własnością wy*mowy*.

To drugi, po Fortranie, najstarszy nadal używany język programowania wysokiego poziomu. Powstał, jak
dowiadujemy się z Wikipedii, "jako wygodna matematyczna notacja dla programów komputerowych, oparta
na rachunku lambda stworzonym przez Alonzo Churcha" i przez wiele lat był wykorzystywany głównie do
prowadzenia badań nad sztuczną inteligencją, o czym można się też dowiedzieć z
[tej](http://jmc.stanford.edu/articles/lisp.html) krótkiej opowieści o jego historii, napisanej
przez samego pomysłodawcę i autora, czy może raczej odkrywcę (?) Lispa, [Johna
McCarthy'ego](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)).

Dzwonki dzwonią? Notacja matematyczna, rachunek lambda, coś dzwoni, prawda? Skoro przytoczony
fragment kodu w R wyglądał podobnie do kodu operującego na listach napisanego w Leanie, to można się
spodziewać, że fragment kodu napisanego w jakimś dialekcie Lispa też będzie wyglądał podobnie. I
wygląda, pod pewnymi względami. W artykule Wikipedii przytoczono na przykład taki fragment kodu, ...

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
to aplikacja funkcji `list` do liczb `3` i `4`.

I wszystko byłoby fajnie i wszystko byłoby cacy i to . by . w za . sa . dzie . już . by . ło . na
. ty. le, gdyby nie fakt, że wynik ewaluacji pierwszego wyrażenia, który to wynik jest w Lispie
listą, a więc jest pewną *strukturą danych*, jest *zapisany tak samo*, to jest jako dwie
zagnieżdżone sekwencje oddzielonych okrągłymi nawiasami elementów, jak fragment generującego te dane
*kodu*. Jest tak dlatego, że *kod napisany w dialekcie Lispa jest strukturą danych tego dialektu*, a
mówiąc dokładniej, kod Lispa jest listą. Co znaczy, że w Lispie można (łatwo!) tworzyć *funkcje*,
które przetwarzają *kod*. Nie funkcje, które przetwarzają *funkcje* (chociaż to też można robić)
albo *typy* (i to też można robić, ale z większym trudem), tylko *kod*; w tym również *własny* kod.

Dzięki temu w Lispie wyjątkowo wygodnie można się bawić w
[*metaprogramowanie*](https://pl.wikipedia.org/wiki/Metaprogramowanie). A w odpowiednich rękach
metaprogramowanie może działać w niesamowity sposób, nierzadko dając komuś, kto je opanował,
poczucie niemal nieznośnie swędzącej mocy. Jeżeli sprawnie władający Lispem użytkownik ma ochotę
zacząć korzystać na przykład z [paradygmatu programowania
obiektowego](https://pl.wikipedia.org/wiki/Programowanie_obiektowe), ale używa implementacji Lispa,
która mu nie dostarcza tego, czego sobie życzy, może *pisząc odpowiedni kod przerobić sam język* na
taki, który wspiera programowanie obiektowe w pożądanym stylu (istnieją różne). 

Czy metaprogramowanie ma jakiś związek z inteligencją i celowością? Oczywiście, że tak. A jaki?
Trudno tak w skrócie powiedzieć! Mogę natomiast już teraz powiedzieć to:

*Ta książka jest aktem wspólnego wieloprzedmiotowego metaprogramowania (siebie \{nawzajem\})*.

[Zaskoczona](https://youtu.be/010KyIQjkTk?si=k5ZjpbKAhM98YcJZ)? A chociaż trochę?

Edytor programisty Emacs, którego używam do wszystkiego, łącznie z gotowaniem[^1], jest napisany
właśnie w dialekcie Lispa. Ale to jest akurat drobiazg. Ciekawsze jest to, że sama *konfiguracja*
sposobu działania tego edytora polega często na *pisaniu programów* w dialekcie Lispa, którego używa
Emacs. Niemniej, jak kocham Lispa i kocham Emacsa miłością głęboką, szczerą i niezmienną, tak muszę
niestety przyznać, że dialekty Lispa też mają zbyt prymitywny wbudowany system typów, żeby można ich
było używać wygodnie i z sensem do uprawiania wszelkiej matematyki.

<hr>

Ponieważ listy są tak ważne i ponieważ ta operacja jest taka podstawowa, Lean ją solidnie słodzi:

```lean
-- Zwracam uwagę na brak nawiasów kwadratowych wokół pierwszego argumentu funkcji `List.cons`, którą
-- tutaj stosujemy w notacji wzrostkowej, oznaczając ją symbolem `::`. Ten pierwszy argument musi
-- być termem takiego typu, jak typ elementów listy, do której go (z przodu) dostawiamy, ...
#eval 1 :: [2, 3] -- [1, 2, 3]

-- Dlatego to jest błąd ...
--
-- `#eval "X" :: [1, 2]`
--
-- ... i to też jest błąd:
--
-- #eval [5] :: [4, 3]
```

**Sugestia**: Spróbuj może, używając tego lukru, stworzyć jakąś krótką listę termów typu `String`?
Jako drugi argument do `::` możesz podać również listę pustą. Wtedy będzie najkrócej jak się da i
Lean się domyśli, że skoro pierwszy argument ma typ `String`, to drugi jest listą pustą typu `List
String`.

Lista elementów na przykład typu `Nat`, czyli term typu `List Nat`, to albo lista pusta `[]` (a pod
lukrem `List.nil`), albo lista `[n]`, gdzie `n : Nat` (a pod lukrem `List.cons n List.nil`), albo
`[m, n]`, gdzie `m n : Nat` (a pod lukrem `List.cons m (List cons n List.nil)`), i tak
dalej. Definicja listy, poza tym, że jest parametryczna, jest więc też rekurencyjna, bo słowo (ale
czy stała? to przecież język naturalny) "lista" występuje w
[*definiensie*](https://pl.wikipedia.org/wiki/Definicja#Budowa_definicji). 

A *termy typów rekurencyjnych* często najwygodniej jest przetwarzać za pomocą *funkcji
rekurencyjnych*, takich jak ta:

```lean
def suma_elementow (lista : List Nat) : Nat :=
  match lista with
  | [] => 0
  | pierwszy_element :: lista_pozostalych_elementow => 
     pierwszy_element + (suma_elementow lista_pozostalych_elementow)

-- To jest ta sama funkcja, tylko mniej przegadana.
def suma (l : List Nat) :=
  match l with
  | [] => 0
  | x :: xs => x + (suma xs)
```

Pisałem już o strukturze takich funkcji, ale to było dawno, więc w ramach kolejnej odroczonej
powtórki wyjaśniam, że ciało tej funkcji **czytamy jako**: Dopasuj zmienną `lista` do jednego z
dwóch wzorców (`match lista with`) 1. lista pusta, czyli pierwszy konstruktor list `List.nil`, a z
lukrem `[]`, a jeśli pasuje, zwróć `0` (`| [] => 0`) i 2. pierwszy *element* i *lista* pozostałych
elementów, czyli lista pasująca do drugiego konstruktora list `List.cons <element> <lista>`, a z
lukrem `pierwszy_element :: lista_pozostalych_elementow`, a jeśli pasuje, dodaj ten pierwszy
*element* do *wyniku zastosowania funkcji* `suma_elementow` (włąśnie w tym miejscu ta funkcja
wywołuje rekurencyjnie samą siebie) do listy pozostałych elementów. Pozwolisz, że tego fragmentu
kodu nie będę już tu (w nawiasie) kopiował.

Zwracam uwagę na dwa warunki, które musi spełniać każda zwykła (można to obejść) definicja funkcji
rekurencyjnej:

1. Proces ewaluacji musi się zakończyć dla każdego możliwego argumentu. W przypadku tej funkcji
   wywołanie rekurencyjne jest zawsze aplikacją do *coraz mniejszej* listy, która ostatecznie musi
   stać się listą pustą, na której przetwarzanie całej wyjściowej listy się skończy. Lean sprawdza
   takie rzeczy i pozwala nam tworzyć definicje funkcji rekurencyjnych tylko wtedy, gdy sam znajdzie
   dowód, albo my mu dostarczymy jakiś dowód, że ewaluacja musi się zakończyć dla każdego możliwego
   argumentu.

2. W ciele funkcji musimy obsłużyć wszystkie możliwe sposoby konstruowania termów dopasowywanego
   typu, czyli termów typu, którego term występuje zaraz po słowie kluczowym `match`. Akurat
   parametryczny typ indukcyjny `List` ma dwa konstruktory, które już poznałaś.
   
Obsłużenie wszystkich metod konstrukcji można zagwarantować również w taki "leniwy" sposób:

```lean
-- `Bool` to (nieparametryczny i nierekurencyjny) indukcyjny typ danych o dwóch konstruktorach,
-- `true` i `false`. Ale prawie wszyscy zdają się widzieć w nim tylko jedno - typ wartości
-- logicznych.
def przepraszam_cz_t_lst_jst_pst (lista : List α) : Bool :=
  match lista with
  | [] => true
  -- A dla wszystkich innych postaci termu `lista` (_) zwróć `false`
  | _ => false

#eval przepraszam_cz_t_lst_jst_pst ([] : List Nat) -- `true`

#eval przepraszam_cz_t_lst_jst_pst [3, 3, 3]       -- `false`
```

**Sugestia**: Jeżeli nie masz wieloletniego doświadczenia w programowaniu, to nawet jeśli wydaje Ci
się to zbyt proste żeby było ciekawe, spróbuj może przerobić funkcję `suma_elemnentow` na działającą
analogicznie funkcję `iloczyn_elementow`. Potem sprawdź, czy ta funkcja działa poprawnie dla jakiejś
jednej czy dwóch krótkich list liczb naturalnych. Uważaj wtedy na wartość zwracaną dla listy pustej,
bo mnożenie liczb działa inaczej, niż ich dodawanie. Spróbuj potem zdefiniować analogiczną funkcję
działającą na listach *tekstów*, używając, zamiast dodawania, aplikowanego w stylu przedrostkowym
działania (bo ta funkcja jest przecież działaniem) `String.append`. Tą funkcję też sprawdź na jednej
albo dwóch listach. Wybór wartości zwracanej dla listy pustej będzie wtedy tekstowym analogonem zera
(ze względu na dodawanie) i jednocześnie jedynki (ze względu na mnożenie), bo będzie *elementem
neutralnym* (ze względu na operację sklejania tekstów).

Co jeszcze na początek ... A tak, poszczególne elementy list można wskazywać używając takiego lukru:

```lean
#eval [5, 6][0] -- `5`

#eval [5, 6][1] -- `6`

-- Ten kod jest błędny, bo indeksujemy pozycje list zaczynając od zera, a więc `<lista>[2]` oznacza
-- próbę wskazania *trzeciego* elementu, którego tutaj nie ma:
--
-- `#eval [5, 6][2]`
```

## Wiele hałasu o Coś

Być może pomyślałaś sobie, że typ list to takie wiele hałasu o nic. W końcu to tylko skończone
sekwencje termów/elementów/obiektów tego samego typu, którym towarzyszy interfejs dostawiania
elementu na czoło, wskazywania elementów (do *odczytu*), i inne tego rodzaju funkcjonalności. No i o
co właściwie chodzi z tymi różnicami między implementacjami typu list w różnych językach?  Nawet,
jeżeli tak pomyślałaś, co by mnie wcale nie zdziwiło, bo sam tak kiedyś wiele razy pomyślałem, to
zgodzisz się chyba, że *ogólne pojęcie skończonej sekwencji elementów* jest dla nas, ludzi,
fundamentalne.

Skończone ciągi dowolnej długości, nazywane również n-tkami, występują niezwykle często w
przeróżnych działach matematyki. Ten akapit jest pewnym skończonym ciągiem elementów tego samego
typu. Każde wielokrotne dodawanie lub mnożenie liczb, czy wielokrotne zastosowanie jakiejkolwiek
innej operacji łącznej można równie dobrze zapisać jako skończony ciąg elementów tego samego
typu. Dni tygodnia są tego rodzaju sekwencją i tak też o nich myślimy, podobnie jak o sekundach,
godzinach, miesiącach i latach. Droga z jakiegoś punktu `A` do jakiegoś punktu `B`, *niemal dowolnie
rozumiana droga*, na przykład taka, która polega na przejściu się do sklepu mijając po drodze
kolejne skrzyżowania ulic, albo taka, która polega na przejściu od założeń przez kolejne kroki
dowodu do wniosku, albo taka, która polega na przejściu od pierwszej liczby przez dodawanie
kolejnych do ostatecznej sumy liczb od pierwszej do ostatniej, czyli sekwencja jako droga jako
sekwencja *działań*, to *jednocześnie* pewna skończona sekwencja *elementów* tego samego
typu. Pojęcie sekwencji jest niemal tak uniwersalne, proste, oczywiste i płytkie jak pojęcie
elementu, i tak samo trudne do zobaczenia w nowy sposób, a przez to, przynajmniej potencjalnie,
bezdennie głębokie.

No więc sekwencje skończone są *implementowane* w językach programowania na między innymi takie dwa,
fundamentalnie różne sposoby: 

Pierwszy sposób odpowiada typowi list w Leanie: Skończony ciąg jest wtedy zbudwany z dwóch rodzajów
pod-struktur, 1. *listy pustej* i 2. *aplikacji* konstruktora `cons` do *dwóch* termów:
2.1. elementu, który ma być dołożony na czoło i 2.2. listy, która ma dostać nowe czoło. W Leanie te
dwa rodzaje termów, lista pusta i aplikacja funkcji `cons`, są *nieredukowalne* (bo definicja
parametrycznego indukcyjnego typu danych to funkcjonalnie schemat aksjomatu, pamiętasz?).

To zatem tylko *napisy*, które *traktujemy* - za pomocą interfejsu złożonego z różnych funkcji -
*jak* listy puste i listy niepuste, co *czyni je* listami pustymi i niepustymi. Ten *zapis*, ...

`List.cons 1 (List.cons 2 List.nil)`

... na przykład, *jest* listą (którą posługując się lukrem możemy również zapisać jako `[1,
2]`). Widzimy tutaj pewien *fragment*, bo nie widzimy tu funkcjonalnego interfejsu, *logicznej*
struktury tego typu danych i *nic więcej*, to znaczy nie ma nic "pod spodem" tego zapisu, a w
szczególności nie ma "pod" nim żadnej struktury fizycznej, takiej jak pamięć komputera, ponieważ to
jest zapis w czystym języku funkcyjnym.

<hr>

### Interfejs jest prawie (?) wszystkim

**Ten fragment można na spokojnie pominąć bez większej szkody dla zrozumienia dalszego ciągu**: Żeby
docenić znaczenie interfejsu, rozważmy takie dwa, ściśle związane z wszelkimi sekwencjami
skończonymi typy danych:

```lean
-- Stworzenie przestrzeni nazw `przyklad` pozwala nam zdefiniować stałą `Nat`, bo tak naprawdę
-- definiujemy wtedy stałą `przyklad.Nat`, która nie jest jeszcze "zajęta" (ciałem).
namespace przyklad

inductive Nat where
  | zero : Nat
  | succ (n : Nat) : Nat
 
inductive Pos where
  | one : Pos
  | succ (p : Pos) : Pos

-- Te dwa typy są w oczywisty sposób izomorficzne, ...
def np_iso (n : Nat) : Pos :=
  match n with
  | Nat.zero => Pos.one
  | Nat.succ m => Pos.succ (np_iso m)

def pn_iso (p : Pos) : Nat :=
  match p with
  | Pos.one => Nat.zero
  | Pos.succ o => Nat.succ (pn_iso o)
  
-- ... za to, z powodu rekurencyjnej struktury obydwu typów danych, dowody izomorficzności nie są
-- takie oczywiste, bo mają nietrywialną strukturę rekurencyjną. Mówiąc dokładniej, te dowody
-- korzystają z *zasady indukcji*, o której porozmawiamy kiedy indziej.
theorem pn_of_np : ∀ n : Nat, pn_iso (np_iso n) = n :=
  fun n => match n with
  | Nat.zero => rfl
  -- O tym porozmawiamy kiedy indziej.
  | Nat.succ m => congrArg Nat.succ (pn_of_np m)

theorem np_of_pn : ∀ p : Pos, np_iso (pn_iso p) = p :=
  fun p => match p with
  | Pos.one => rfl
  | Pos.succ m => congrArg Pos.succ (np_of_pn m)

-- A zatem `pn_of_np` i `np_of_pn` to funkcje odwrotne. Nie napisałem `pn_iso (np_iso n) = id n` w
-- nadziei, że to wywoła pewne wątpliwości i pobudzi Cię do ponownego przemyślenia tematu.

-- No więc definiując w ten piękny, rekurencyjny sposób dla tych typów danych *dodawanie* ...
def Nat.add (m n : Nat) : Nat :=
  match m with
  | Nat.zero => n
  | Nat.succ m' => Nat.add m' (Nat.succ n)

def Pos.add (m n : Pos) : Pos :=
  match m with
  -- Kluczowa różnica jest tutaj.
  | Pos.one => Pos.succ n
  | Pos.succ m' => Pos.add m' (Pos.succ n)

-- ... sprawiamy, że te dwa, izomorficzne *jako typy danych* typy danych są *nie*izomorficzne *jako
-- narzędzia dodawania*, to jest (na przykład) jako *półgrupy* (Nat, Nat.add, Nat.zero) i (Pos,
-- Pos.add, Pos.one). *Nie* jako monoidy, bo `Pos.add` nie ma elementu/termu neutralnego, a więc nie
-- jest monoidem, natomiast, jak można wykazać również posługując się zasadą indukcji, oba działania
-- są łączne, a więc "półgrupowe".

end przyklad
```

<hr>

Logiczną strukturę [*listy jednokierunkowej*](https://pl.wikipedia.org/wiki/Lista) możemy równie
dobrze zakodować za pomocą par stykających się "komórek", z których *pierwsza* zawiera jakąś
*wartość*, a *druga* zawiera *strzałkę*, interpretowalną jako adres, do *innej pary
komórek*. Przyszło Ci do głowy, że te strzałki mogłyby wskazywać kolejne pary komórek w taki sposób,
że posługując się skończoną liczbą takich "wartościowo-strzałkowych" par komórek dałoby się,
używając do tego tylko *zbiorów skończonych*, skonstruować *ciąg nieskończony*? Wystarczyłoby
zdefiniować jakąkolwiek pętlę kierunkową i ta struktura reprezentowałaby wtedy sekwencję
xnieskończoną. I skąd by się ta nieskończoność brała? Oczywiście (?), że ze strzałek, a właściwie ze
*sposobu używania strzałek*. No więc wymagamy, żeby dla każdej listy dało się dojść, idąc tropem
(albo drogą) strzałek, do specjalnej pojedynczej komórki "bezwartościowej", której rolą jest jedynie
reprezentowanie końca listy. Co znaczy dokładnie to samo co: interfejs funkcji działających na
listach działa na tej komórce tak, jakby była listą pustą.

**Rysunek 1**: Narysuj proszę w miejscach wierzchołków wyobrażonego trójkąta równobocznego trzy pary
stykających się kwadratów, a po lewej od lewej dolnej pary narysuj pojedynczy kwadrat z kółkiem w
środku. W lewej komórce górnej pary zapisz `2`, w lewej komórce prawej dolnej pary zapisz `1`, a w
lewej komórce lewej dolnej pary zapisz `2`. Strzałki będziemy rysować od środków prawych komórek do
krawędzi lewych komórek albo do krawędzi komórki końcowej. Dorysuj więc proszę strzałki z górnego
wierzchołka do prawego dolnego, z prawego dolnego do (nie całkiem) lewego dolnego i z tego
ostatniego do komórki końcowej. To jest to samo, co lista `[2, 1, 2]`[^3]

**Rysunek 2**: Teraz proszę narysuj niżej tą samą listę, ale zamiast rysować podwójne komórki,
narysuj *pojedyncze okręgi* z wartościami, zamiast rysować strzałkę do komórki końcowej, narysuj
*endostrzałkę* i ułóż te trzy komórki inaczej przestrzennie na stronie. To jest w zasadzie to samo,
ale może się wydawać, że ta reprezentacja ma w jakiś trudny do uchwycenia sposób inny sens czy może
nawet zapach albo smak. I nie chodzi o układ przestrzenny komórek, bo jest dla Ciebie jak sądzę
całkiem jasne, że w przypadku tej reprezentacji ten aspekt jest nieistotny, prawda?

**Rysunek 3**: Na koniec narysuj proszę poziomo trzy stykające się kwadraty, zawierające kolejno te
same liczby, to jest `2`, `1` i `2`. Nie masz wrażenia, że to jest z jednej strony to samo, ale, co
najmniej z jakiejś jednej drugiej strony, zdecydowanie nie to samo? Jeżeli możesz, spróbuj w jakiś
sposób pogrubić krawędzie tych komórek.

Różnica między celem, albo sensem, albo treścią, albo funkcją rozumianą jako rola w rozwiązaniu
jakiegoś zadania albo problemu, a realizacją, albo ucieleśnieniem, albo implementacją tego
celu/sensu/treści/funkcji-jako-roli jest jak różnica między treścią komunikatu i przestrzennym
układem cząsteczek tuszu drukarskiego na kartce papieru. To pierwsze (sens) jest "w" tym drugim
(fizycznie zapisanym na kartce tekście) *tylko* w naszych oczach (i dzięki naszemu sposobowi
działania); bez naszego punktu widzenia i naszych intencji to są zupełnie inne, w *żaden* sposób nie
związane własności. Bo cel jest punktem widzenia czy raczej postawą *jakiejś* osoby.

Ale ponieważ interesuje nas tylko to, co można z czym zrobić, albo jakie są konsekwencje zdarzeń dla
naszych możliwości działania w fizycznym świecie, jest nam bardzo trudno zobaczyć, że te dwa wymiary
są tak bardzo różne. Tak jak na tych trzech rysunkach. 

Rysunek pierwszy jest typową reprezentacją typu list jednokierunkowych, ale swoim wyglądem
przynajmniej sugeruje szczegóły fizycznej implementacji: Kwadraty sąsiadujących komórek mogą się
łatwo kojarzyć z sąsiadującymi komórkami pamięci komputera, a strzałki z adresami fizycznych miejsc
w tej (zresztą również sekwencyjnej) pamięci. Dlatego ta reprezentacja jest dosyć *zwodnicza* i
jednocześnie może się nam wydawać bardziej *przyjazna* niż bardziej abstrakcyjna druga.

Druga reprezentacja to niemal czysta funkcjonalność. Okręgi raczej nie przywodzą na myśl komórek
pamięci, a nawet jeśli, to w mniejszym stopniu. Strzałki mogą się oczywiście łatwo kojarzyć, na
przykład zawodowym informatykom, z adresami fizycznych miejsc w pamięci, ale obecność endostrzałki w
tym trochę przeszkadza. Jest też jeszcze co namniej jeden ważny powód, dla którego wszystkie trzy
rysunki są zwodnicze: przedstawione na nich struktury są *małe*.

Gdybym Cię zapytał, co jest na drugiej pozycji listy, odpowiedziałabyś natychmiast z łatwością, bo
jesteś, zgaduję, w stanie doskonale operować "w głowie" *całą* strukturą każdej z tych trzech
reprezentacji. A jesteś w stanie łatwo takie rzeczy robić, bo to są listy tylko
trójelementowe. Gdyby to były listy złożone na przykład ze *stu* elementów i gdyby komórki
pierwszych dwóch list były porozrzucane w sposób przypadkowy na całej płaszczyźnie (każda osobnej)
kartki, a trzecia lista była zapisana tak, że pod każdą komórką byłby jej numer, czyli adres miejsca
w fizycznej pamięci, bo to byłby dla Ciebie dosłownie adres miejsca w fizycznej pamięci,
zobaczyłabyś natychmiast podstawową różnicę między pierwszymi dwoma strukturami i tą trzecią. I
zobaczyłabyś też może, że różnica między dwoma pierwszymi rysunkami jest albo mało istotna, albo
myląca.

Dla `n` znacznie większych niż 3, znalezienie `n`-tego elementu na liście pierwszego albo drugiego
rodzaju zajmowałoby Ci wtedy mniej więcej tyle czasu, ile musiałabyś zrobić *przejść*, mentalnie
albo wodząc palcem po kartce, od pierwszego do `n`-tego elementu. Natomiast znalezienie `n`-tego
elementu na liście trzeciego rodzaju zajmowałoby Ci mniej więcej tyle samo czasu dla każdego
`n`. Byłoby tak dlatego, że *funkcjonalna* struktura trzeciej listy ma ścisły związek z *fizyczną*
strukturą kartki papieru. Inaczej mówiąc, lista trzeciego rodzaju *jest* (Twoim) *interfejsem
fizycznej powierzchni papieru*.

Zastanawiasz się może, po co nam w takim razie w ogóle listy strzałkowe? Chodzi przecież o coś tak
prostego, jak szeregowo ułożone elementy, prawda? Otóż *nie* chodzi wcale o to, a w każdym razie nie
*tylko* o to. Jak zawsze, chodzi w istocie o trudne do wyraźnego zobaczenia jako coś odrębnego
funkcje jako role, co w tym kontekście oznacza operacje na listach, takie jak wyszukiwanie elementów
znajdujących się w danej odległości od pierwszego elementu, ale nie tylko o takie.

Gdybyś chciała *wstawić* jakiś element w miejscu `n` do pierwszej albo drugiej listy, byłoby Ci to w
ogólnym przypadku łatwiej zrobić, niż gdybyś miała wstawić element w miejscu `n` do trzeciej
listy. W przypadku pierwszych dwóch list trzeba wtedy znaleźć element `n`-ty, co wymaga czasu
proporcjonalnego do `n`, ale gdy już go znajdziemy, wystarczy usunąć jedną strzałkę i dodać dwie
łączące od razu wiadomo co z czym. W przypadku trzeciego rodzaju listy czy sekwencji trzeba
*fizycznie przenieść*, w sposób nieprzypadkowy, wszystkie elementy zapisane przed `n`-tym elementem.

Ten ostatni rodzaj sekwencji nazywamy *typem tablicowym*, a po angielsku zwykle *array* albo (tak
jak w językach R i C) *vector*. Za to listy jednokierunkowe *nie całkiem* odpowiadają typowi `List`
w Leanie, bo ten nie korzysta ze *wskaźników*. Pomijając listy puste, listy w Leanie są złożone z
par (oznaczonych arbitralnie etykietą `cons`) złożonych z elementu i *listy*, a nie wskaźnika do
następnego elementu. Mamy więc co najmniej trzy, zachowujące się pod pewnymi względami podobnie, ale
pod innymi nie, rodzaje ogólnie rozumianych struktur sekwencyjnych. Wiemy też, że takie struktury są
dla ludzi niezwykle ważne w najrozmaitszych kontekstach i że ludzie często używają ich do podobnych,
a nierzadko takich samych celów. Pod tym względem od w jakiś sposób zaprogramowanych komputerów
różnimy się głównie tym, że nie robimy tego niemal niezawodnie, tylko wystarczająco dobrze, żeby jak
dotąd przeżyć jako gatunek, czyli jak debile (i debilki).

## Konkatenacja list

**Wyzwanie!** Jeżeli Twoją pierwszą reakcją na napisane pismem pogrubionym słowo "wyzwanie", w
dodatku z wykrzyknikiem, było coś w rodzaju "a daj mi spokój", to *doskonale*. Słuchaj proszę tego
wewnętrznego głosu; moim zdaniem On Cię ostrzega przed niebezpieczeństwem "wypalenia
motywacyjnego". Jeżeli to było bardziej coś w rodzaju choćby tylko umiarkowanej ekscytacji, to też
*doskonale*, tylko *pod innym względem*. U kogoś, kto dotarł tak daleko, obojętność mogę spokojnie
wykluczyć.

Chemy mieć coś, co działa jak *sklejanie*:

```lean
         [] [a, b, c, ...] ↦ [a, b, c, ...]

         [a, b, c, ...] [] ↦ [a, b, c, ...]

[a, b, c, ...] [d, e, ...] ↦ [a, b, c, ..., d, e, ...]
```

Nawet bez bawienia się w dowodzenie równości pewnych zdań z dwoma parami nawiasów od razu widać, że
tak działające sklejanie to monoid, prawda? Jednostkę przecież ma, no i co by tu mogły zmienić
jakiekolwiek nawiasy?

Wracając do wyzwania, spróbuj proszę zastąpić słowo `sorry` odpowiednim fragmentem kodu *uważając na
frustrację* i *oddalając się od tej zagadki, gdy zaczniesz zauważać, że nie ustępuje*. *To* jest tu
moim zdaniem największym i o wiele ważniejszym niż sama zagadka wyzwaniem. Próby wykonania zadania,
do wykonania którego nie jest się jeszcze gotowym, pewnie nie we *wszystkich* tego typu sytuacjach,
ale w *trudnych do rozpoznania jako w ten sposób trudne* sytuacjach przypominają próby latania zanim
wyrosną nam skrzydła. Gdybyś teraz na przykład wróciła do zadań, z którymi miałaś kontakt na
początku tej książki, byłoby dla Ciebie jasne, że możesz je *łatwo* wykonać i to by było dla Ciebie
jasne *zanim* zaczęłabyś je wykonywać. Moim zdaniem tego rodzaju "moc" bierze się nie stąd, że w
międzyczasie wiele razy *wykonywałaś* te i inne podobne *zadania*, tylko stąd, że wiele razy,
*patrząc na nie z różnych stron*, wracałaś do takiego jakby "niezadaniowego", bo *spontanicznego* i
*swobodnego myślenia* o strukturach i działaniach na strukturach, których te zadania
dotyczą. Podkreślam jeszcze raz: to są, bardziej niż cokolwiek innego, na przykład niż zgodnie z
obecną wiedzą niemożliwy "trening inteligencji", skutki *zmian struktury Twojej pamięci*. Z nowym
językiem trzeba się *zrosnąć*.

```lean
def concat (l1 l2 : List α) : List α :=
    match l1 with
    |[] => l2
    -- Częściowe mise an place przez samo typowanie mówiąc do siebie:
    -- 
    -- 1. rezultatem musi być lista, 2. funkcja `concat` pobiera dwa argumenty, 3. `x` to pierwszy
    -- element, 4. a `xs` to pozostała część listy `l1`.
    --
    -- Albo możesz sobie rozpisać, używając *swobodnej* notacji, proces doklejania `[1, 2]` do `[3]`
    -- tylko za pomocą operacji `::` i operacji rozłożenia listy niepustej na pierwszy element/czoło
    -- i (być może pustą) listę pozostałych elementów.
    |x :: xs => sorry

-- Sprawdzamy, czy działa.
#eval concat [] [1, 2, 3]

#eval concat [1, 2, 3] []

#eval concat [1, 2, 3] [4, 5]
```

## Dla osób nadmiernie dociekliwych, przyozdobiony komentarzami opis typu list skopiowany z pliku Prelude.lean 

```lean -- To jest namespace kopia -- fragmentu zawartości pliku Prelude.lean.

-- Dzięki umieszczeniu kopii kodu z dokumentacją w nowej przestrzeni nazw, nie występuje konflikt
-- nazw wynikający ze zdefiniowania dwukrotnie tej samej stałej (tutaj stałej `List`).

-- Za pomocą pary oznaczeń `/--` i `-/` można wygodnie tworzyć komentarze zajmujące więcej niż jedną
-- linię:

/--
Linked lists: ordered lists, in which each element has a reference to the next element.

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

[^3]: Lubię to. Swoją drogą, czy ktoś wie, co się stało z Azealią?
