## O czym teraz będzie

Teraz będzie przede wszystkim o zasadzie dualności w teorii kategorii i to będzie technicznie dosyć
proste, ale konceptualnie raczej trudne. Za to
[ilość](https://sjp.pwn.pl/poradnia/haslo/ilosc-czy-liczba;1856.html) problemów stanie się w pewnym
sensie mniejsza o połowę.

# p ∧ q ~ p ← ∘ → q ~ X ← ∘ → Y ~ X → ∘ ← Y ~ p → ∘ ← q ~ p ∨ q

Na pewien czas oddaliliśmy się od zdań, spójników logicznych i dowodów. Teraz wrócimy do tego
znanego Ci już kontekstu i popatrzymy na logikę zdań z kategoryjnego punktu widzenia. Ustalimy
najpierw, czy da się opisać logikę zdań tak, żeby wyszła z tego jakaś kategoria. Niech:

1. Różne punkty oznaczają różne zdania.

2. Dla każdego punktu (odpowiadającego zdaniu) `P` i punktu `Q`, strzałka z punktu `P` do
   punktu `Q` oznacza dowód implikacji `P → Q`.

3. Dla każdego punktu `P`, pętla identycznościowa tego punktu oznacza dowód tautologii `P → P`.

4. Składanie strzałek będzie składniem dowodów.

Możemy łatwo udowodnić, że w ten sposób uzyskujemy kategorię zdań i dowodów:

```lean
-- Ta definicja stałej ID różni się od wcześniejszej tylko tym, że zamiast typu Type występuje 
-- tutaj typ Prop.
def ID (P : Prop) : P → P := fun (hp : P) => hp

-- Poza tym, że skróciłem nazwę stałej i zamiast Zlozenie jest tutaj Z, to jedyna różnica między
-- tą i wcześniejszą definicją składania jest taka, że zamiast typu Type mamy tutaj typ Prop.
def Z {P Q R : Prop} (f : P → Q) (g: Q → R) : (P → R) := 
  fun (hp : P) => g (f hp)

-- Dowody własności, których wymagamy od strzałek identycznościowych, też różnią się tylko typem,
-- ...
example (P Q : Prop) (f : P → Q) : Z f (ID Q) = f := by rfl
example (P Q : Prop) (f : P → Q) : Z (ID P) f = f := by rfl

-- ... podobnie jak dowód łączności składania dowodów.
example (P Q R S : Prop) (f : P → Q) (g : Q → R) (h : R → S) : 
  -- (h ∘ g) ∘ f = h ∘ (g ∘ f)
  Z f (Z g h) = Z (Z f g) h := by rfl
```

### Dygresja na temat słowa kluczowego `example`

Przy okazji widzimy, że dowody anonimowe, które konstruujemy za pomocą słowa kluczowego `example`,
mogą mieć parametry tak samo jak twierdzenia. A więc `example` to *niemalże* alternatywny sposób
konstruowania funkcji anonimowych. Możemy stosować to słowo kluczowe do konstruowania dowolnych
*prawie* funkcji anonimowych ...

```lean
example (n m : Nat) : Nat := n + m
```

... ale to nie będą funkcje anonimowe, bo nie da się ani sprawdzić typu takich wyrażeń, ani ich
aplikować:

```lean
-- Tutaj pojawia się błąd ...
#eval (example (n m : Nat) : Nat := n + m) 2 2

-- ... i tutaj też pojawia się błąd:
#check (example (n m : Nat) : Nat := n + m) 2 2
```

Takie fragmenty kodu służą więc tylko do sprawdzania, czy jakaś funkcja, która może, ale nie musi
być dowodem jakiegoś zdania, może być w pewien sposób skonstruowana.

<hr>

Dla każdego zdania `P`, dowód tautologii `P → P` jest elementem neutralnym ze względu na operację
składania dowodów, bo jest funkcją identycznościową przekształcającą każdy dowód swojego zdania w
niego samego. Ponieważ dowody są dla nas funkcjami jak każde inne, z tą tylko różnicą, że mają typ
będący termem typu `Prop`, to składanie dowodów, co właśnie udowodniliśmy, jest łączne. Skoro już
ustaliliśmy, że mamy do czynienia z kategorią, od tego momentu możemy o tych dowodach zapomnieć.

Ta kategoria ma zdecydowanie inny charakter *jako kategoria* niż kategoria zbiorów i funkcji. W
kategorii zbiorów i funkcji występują strzałki, które są zarazem *równoległe* i *różne*. Na
przykład, jeżeli `X` to jakiś singleton a `Y` to jakiś zbiór dwuelementowy, to istnieją dokładnie
dwie funkcje z `X` do `Y`, a więc w kategorii `Set` istnieją dokładnie dwie strzałki równoległe z
punktu odpowiadającego zbiorowi `X` do punktu odpowiadającego zbiorowi `Y`.

Czy widzisz, że ten ostrożny sposób mówienia staje się już zbędny i trochę uciążliwy? Zamiast ...

*W kategorii* `Set` *istnieją dokładnie dwie strzałki równoległe z punktu odpowiadającego zbiorowi*
`X` *do punktu odpowiadającego zbiorowi* `Y`.

... moglibyśmy powiedzieć krócej ...

*W kategorii zbiorów istnieją dokładnie dwie funkcje równoległe ze zbioru* `X` *do zbioru* `Y`.

... i wiedzielibyśmy, że chodzi tak naprawdę o punkty i strzałki, tylko w pewien sposób zdefiniowane
albo zinterpretowane (w tym wypadku jako zbiory i funkcje). Dlatego będę od pewnego momentu coraz
częściej mówił właśnie w ten sposób.

## Cienka ta kategoria

W kategorii punktów jako zdań i strzałek jako dowodów, której się teraz przyglądamy, istnieje
strzałka z punktu `P` do punktu `Q` wtedy i tylko wtedy, gdy zakładając (zdanie odpowiadające
punktowi) `P` można udowodnić (zdanie odpowiadające punktowi) `Q`. W tej kategorii nie ma nigdy
dwóch różnych strzałek równoległych, bo zgodnie z zasadą *proof irrelevance* wszystkie dowody tego
samego zdania są równe. Takie kategorie, które nie mają par różnych strzałek równoległych nazywamy
[*cienkimi*](https://ncatlab.org/nlab/show/thin+category) (ang. *thin*).

Mamy tu zatem cienką kategorię, to jest taką, że dla każdej pary punktów `P` i `Q`, istnieje *co
najwyżej jedna* strzałka z `P` do `Q`. Tego rodzaju kategorie opisują pewnego rodzaju *relacje
binarne*, bo między dwoma elementami jakaś relacja albo zachodzi, albo nie; z powodu tego, jak słowo
*relacja* jest używane jako termin techniczny w matematyce, stwierdzenie, że jakaś konkretna relacja
zachodzi między dwoma elementami na więcej niż jeden sposób nie ma sensu. W przypadku kategorii,
którą teraz badamy, strzałka *nie* oznacza więc tak naprawdę *konkretnego dowodu*, tylko pewien
*fakt*; w tym wypadku to jest zawsze fakt polegający samym *istnieniu* dowodu pewnej implikacji,
czyli na zachodzeniu *relacji dowiedlności* między jakimiś dwoma zdaniami. Ta kategoria ma więc
wyraźnie inny charakter niż kategoria zbiorów i funkcji.

Nie wszystkie relacje dają się w ten sposób reprezentować jako kategorie. Możemy tak zrobić z
relacją *mniejsze lub równe*, określoną na dowolnym zbiorze `X` zawierającym jakieś liczby. Wtedy
każda liczba należąca do `X` może być osobnym punktem i dla każdych dwóch, niekoniecznie różnych
liczb `x` i `y` należących do `X`, fakt `x ≤ y` może być reprezentowany przez strzałkę. Ponieważ
relacja `≤` jest [*zwrotna*](https://pl.wikipedia.org/wiki/Relacja_zwrotna), to znaczy `∀ x ∈ X, x ≤
x`, to od razu mamy strzałki identycznościowe, a ponieważ taka relacja jest *przechodnia*, to znaczy
`∀ x, y, z ∈ X, x ≤ y → y ≤ z → x ≤ z`, to dla każdej pary składalnych strzałek istnieje strzałka
kompatybilna, która mogłaby być ich złożeniem. Pozostaje tylko ustalić, czy ...

1. `f Id = f = Id f`

2. `(h g) f = h (g f)`

... ale ponieważ nie ma tutaj nigdy dwóch różnych strzałek równoległych, to składanie "nie ma
żadnego wyboru", bo zawsze istnieje dokładnie jedna strzałka kompatybilna (przypominam, że
wymyśliłem ten termin, żeby łatwiej mi się o tego rodzaju sprawach mówiło). 

Na przykład, jeżeli `Id : X → X` i `f : X → Y`, to złożenie `f Id` może być tylko strzałką `f`, bo
nie może istnieć inna strzałka z `X` do `Y`, a więc prawostronna neutralność strzałki `Id` jest
automatycznie spełniona i tak samo spełniona jest lewostronna neutralność każdej endostrzałki, a
więc każdej identyczności w tej być może kategorii.

A gdy mamy jakieś strzałki `f : X → Y`, `g : Y → Z` i `h : Z → V`, to nie ma znaczenia, czy najpierw
uzyskamy jako złożenie `h g` jedyną strzałkę z `Y` do `V` jaka istnieje, a potem złożymy ją ze
strzałką `f` uzyskując jedyną strzałkę z `X` do `V` jaka istnieje, czy najpierw uzyskamy jako
złożenie `g f` jedyną strzałkę z `X` do `Z` jaka istnieje, a potem dołożymy do niej strzałkę `h`,
uzyskując jedyną strzałkę z `X` do `V` jaka istnieje, bo na końcu uzyskamy ... jedyną strzałkę z `X`
do `V` jaka istnieje, a więc w obydwu przypadkach uzyskamy tą samą strzałkę. Widzimy więc, że sama
przechodniość relacji daje nam automatycznie łączność składania strzałek zinterpretowanych jako
oznaczające fakt zachodzenia tej relacji.

Zauważyłaś, że udowadniając, że z relacji `≤` można zrobić kategorię, korzystaliśmy *tylko* z tego,
że ta relacja jest zwrotna i przechodnia? Nie było łatwo to zauważyć, prawda? A to jest ważne, bo
wynika stąd, że w ten sposób możemy *zawsze* uzyskać cienką kategorię z *jakiegokolwiek* zbioru, nie
tylko ze zbiorów liczb i z *jakiejkolwiek* określonej na tym zbiorze relacji, *o ile* ta będzie
*zwrotna* i *przechodnia*, bo wtedy ta relacja ...

1. ... "sama" (dzięki zwrotności) dostarczy nam po jednej endostrzałce dla każdego punktu i ...

2. ... (dzięki przechodniości) każdej parze składalnych strzałek będzie odpowiadała jakaś strzałka
   kompatybilna, w dodatku będzie zawsze istniała dokładnie jedna (bo to jest relacja) taka
   strzałka.

Wtedy dzięki 2 składanie będzie automatycznie łączne, a dzięki 1 i 2 będziemy mieli strzałki
identycznościowe.

**Rysunek 1**: Może domyślasz się już, jak narysować te wszystkie własności? W przypadku łączności
składania diagram jest co prawda bardziej (hm) złożony, ale sposób, w jaki dobrze jest go narysować
w zasadzie narzuca się sam. `Narysuj` w szeregu w odstępach o krok od siebie punkty `X`, `Y`, `Z` i
`V`. Dodaj strzałki `f`, `g` i `h`. `Narysuj` złożenia `h g` i `g f` jako strzałki wygięte w dół, a
na koniec dodaj strzałkę z `X` do `V` i oznacz ją jako `(h g) f = h (g f)`. To nie będzie
szczególnie łatwy do odczytania diagram, a poza tym można to samo wyrazić inaczej, więc nie przejmuj
się, jeżeli będziesz miała wrażenie, że jest niezbyt przekonujący.

Diagramatycznie każde złożenie jest przemiennym "trójkątem skierowanym", bo odpowiada jednej
konkretnej strzałce, która jest wynikiem składania jednej konkretnej pary składalnych strzałek. W
przypadku tego diagramu mamy dwa trójkąty - każdy z jednym kątem wewnętrznym 180 stopni i wygiętymi
bokami, ale i tak możemy je nazywać trójkątami - które na siebie zachodzą. Dlatego naniesienie
ptaszków wyrażających przemienności wszystkich równoległych ścieżek skierowanych w taki sposób, żeby
było widać, o które złożenia chodzi, może wymagać chwili namysłu, ale poza tym ten diagram nie różni
się specjalnie od tych, które rysowałaś wcześniej.

**Rysunek 2**: Diagram wyrażający neutralność strzałek identycznościowych wymaga innego
podejścia. Gdybyś narysowała strzałkę `f` z pętlami identyczności u źródła i u celu, to nie dałoby
się wyrazić na takim diagramie podwójnego równania `Id f = f = f Id` za pomocą ptaszków, bo nie
byłoby na nim ani żadnych trójkątów, ani żadnych innych obszarów otoczonych skierowanymi ścieżkami
równoległymi, w których takie ptaszki dałoby się zamknąć. Możemy jednak skorzystać z tego, że
*punkty i strzałki na diagramie to jedno, a ich nazwy to co innego*, rysując diagram zawierający
*kopie*. Bo kto nam zabroni?

`Narysuj (Punkt X)` (użyłem nawiasów, żeby było wiadomo, o co chodzi), a potem `Narysuj (Punkt Y)
(SE X)`[^1]. O krok pod punktem `X`, czyli w położeniu `S X`, również `Narysuj (Punkt X)` i połącz
te dwie kopie skierowaną w dół strzałką o nazwie `Id`. Następnie `Narysuj (Strzalka X Y)` z górnej
kopii `X` do punktu `Y` i oznacz ją jako `f`. O krok poniżej punktu `Y` `Narysuj` jego kopię i dodaj
strzałkę identycznościową z górnego `Y` do dolnego `Y`. Dodaj strzałkę z dolnej kopii `X` do dolnej
kopii `Y` i oznacz ją jako `f`. Na koniec oznacz ten diagram jako przemienny. W ten sposób można
wyrazić *pojedyncze* równanie `Id f = f Id`. Jeżeli chcesz, żeby na tym diagramie było widać też
równania `Id f = f` i `f = f Id`, możesz dodać kopię strzałki `f` przecinającą ten diagram na pół i
narysować po obydwu stronach tej strzałki ptaszki.

Znanym Ci doskonale przykładem relacji, z której *nie* powstaje kategoria w taki sam sposób jak z
relacji `≤` jest - zwykle oznaczana symbolem `<` - relacja *mniejsze niż*, określona na jakimś
zbiorze liczb, ponieważ ta relacja nie jest zwrotna. Jest wręcz przeciwnie, bo jest
[*przeciwzwrotna*](https://pl.wikipedia.org/wiki/Relacja_zwrotna) (musiałem), to znaczy, *żadna*
liczba nie jest w tej relacji sama ze sobą (dokładnie to oznacza przeciwzrotność relacji), bo żadna
liczba nie jest mniejsza sama od siebie. A więc ta relacja nie dostarcza w ten sam sposób co relacja
`≤` strzałek identycznościowych.

Z drugiej strony, relacja `<` jest mimo wszystko przechodnia, bo przecież dla każdych trzech liczb
`m`, `n` i `o` zachodzi `m < n → n < o → m < o`, a więc gdybyśmy ją reprezentowali za pomocą
strzałek, wymaganie *istnienia* wyniku składania składalnych par strzałek byłoby spełnione, a
wymaganie łączności składania byłoby spełnione automatycznie dzięki temu, że dla każdej pary
składalnych strzałek istniałaby zawsze dokładnie jedna strzałka kompatybilna z tą parą. Brakowałoby
więc tylko identyczności.

Moglibyśmy wtedy jednak *dodać identyczności*, które *niczego by nie oznaczały* i *przyjąć
konwencję*, że te są elementami neutralnymi i też uzyskalibyśmy pewną kategorię. Możemy przecież
stworzyć kategorię jaką tylko chcemy, z czego tylko chcemy i według jakich tylko chcemy zasad, o ile
tylko będzie spełniała aksjomaty kategorii (jeżeli chcemy być konsekwentni i unikać bredzenia, co
też oczywiście bywa przyjemne i pożyteczne). W końcu jesteśmy wolni i nigdzie nie doświadczymy
takiej wolności jak w sferze fantazji. Ostatecznie liczy się *tylko* to, czy uda nam się z taką
kategorią zrobić coś pouczającego, interesującego, albo nawet tylko zabawnego.

Matematyka pozwala nam skutecznie myśleć o *dowolnych zagadnieniach, na dowolnym poziomie ogólności
i z dowolnych punktów widzenia*. O ile tylko będziemy w naszym myśleniu konsekwentni, w czym *nic*
tak nie pomaga jak matematyka i o ile nie przyjmiemy jednocześnie założeń, które prowadzą do
sprzeczności, to będziemy mieć gwarancję, że wyprowadzone dedukcyjnie wnioski, jakie by nie były,
będą prawdziwe na mocy przyjętych założeń, definicji i aksjomatów (które też są zresztą definicjami,
tylko że pozbawionymi ciała). Co prawda nie istnieje uniwersalna metoda *znajdywania* dowodów
arbitralnych zdań, ale dzięki temu zawsze ważny będzie przebłysk intuicji, a *potencjalne* dowody
możemy zawsze sprawdzić za pomocą algorytmu, który zawsze da nam jednoznaczną odpowiedź, czy są
poprawne. W tym sensie matematyka jest strefą logicznie bezpiecznej, ale poza tym niczym
nieskrępowanej fantazji.

Wracając do określonej na jakimś zbiorze liczb relacji `<` jako (cienkiej) kategorii: Gdyby było
tak, że dla niektórych, ale nie wszystkich liczb zachodzi zwrotność relacji `<`, czyli gdyby
istniała co najmniej jedna liczba mniejsza od samej siebie, ale istniałaby też liczba, która nie
jest mniejsza od samej siebie, to byłby problem, bo wtedy niektóre nasze strzałki identycznościowe
odpowiadałyby liczbom, a niektóre nie odpowiadałyby niczemu i nie byłoby zgodności między kategorią
i opisywaną przez nią strukturą. No ale w przypadku relacji `<` *żadna* liczba nie wchodzi ze sobą w
tą relację, a więc taka "kategoryfikacja" przez dodanie "pustych w środku" identyczności nie
wprowadza zniekształceń, tylko polega na *zmianie konwencji opisywania tej samej
struktury*. Wystarczyłoby wtedy pamiętać albo zapisać, że pętle identyczności są "puste" i służą
tylko jako konieczne uzupełnienia pozwalające uzyskać kategorię.

Zanim przejdziemy dalej, przypomnę Ci niektóre wprowadzone wcześniej definicje kategoryjne, tylko
tym razem dwie z nich nazwę tak, jak przyjęło się je nazywać i jednocześnie dwie z nich wprowadzę z
innej, interesującej i chyba trochę dziwnej perspektywy.

**Obiektem początkowym** w jakiejś kategorii nazywamy taki obiekt (czyli w naszej terminologii
punkt) `I` (od angielskiego *initial*), że dla każdego obiektu `X` w tej kategorii istnieje
dokładnie jedna strzałka `I → X`.

Znanym Ci już przykładem obiektu początkowego jest zbiór pusty w kategorii `Set`, czyli w kategorii
zbiorów i funkcji, ponieważ istnieje dokładnie jedna funkcja ze zbioru pustego do każdego
zbioru. Takie funkcje nazywamy zresztą *funkcjami pustymi*.

**Produktem** obiektów (czyli naszych punktów) `X` i `Y` nazywamy taki obiekt (czyli punkt) `X × Y`,
że istnieją takie strzałki `π₁ : X × Y → X` i `π₂ : X × Y → Y`, że dla każdego obiektu `Z` i pary
strzałek `f : Z → X` i `g : Z → Y`, istnieje unikalna strzałka `h`, spełniająca warunki `π₁ h = f` i
`π₂ h = g`. Ponieważ taka strzałka jest z definicji tylko jedna, zwykle zapisujemy ją jako `<f,g>`.

Oficjalnie nazywamy strzałki `π₁` i `π₂` raczej rzutami kanonicznymi, ale ja wolę nazywać je
projekcjami. Jak już wiesz, produkty w kategorii `Set` to "pod spodem" (bo `Set` to kategoria, a nie
przestrzeń zbiorów i funkcji) dokładnie iloczyny kartezjańskie zbiorów. Poza tym wiesz również, że
produkt to tak naprawdę para współźródłowych strzałek, spełniająca wymienione w definicji wymagania,
ale często wygodniej jest mówić o produktach jako o obiektach, czyli w naszej terminologii punktach.

## Wolne żarty

Popatrzymy sobie teraz na *najprostszą możliwą* abstrakcyjną (czyli nie rozważamy żadnej jej
interpretacji) kategorię zawierającą strzałkę `f : X → Y`. Jeżeli to ma być kategoria, punkty `X` i
`Y` *muszą* mieć swoje *unikalne i charakterystyczne* endostrzałki identycznościowe. A więc musimy
*sami dodać* te dwie endostrzałki. Te trzy strzałki to jedno, a operacja składania to co
innego. Musimy więc jeszcze *sami zdefiniować* tą operację w taki sposób, żeby aksjomaty kategorii
były spełnione.

Po dodaniu pętli `Id` do `X` i pętli `Id` do `Y` pojawiają się nam dokładnie dwa możliwe złożenia,
to jest `Id f` i `f Id`. W tym wypadku aksjomaty kategorii *nie pozostawiają nam wyboru* i musi być
tak, że `Id f = f = f Id`, ale poza tym nie ma tu żadnych innych możliwych złożeń. Tak oto
uzyskujemy *najprostszą* kategorię *"wyrastającą naturalnie" z samej strzałki* `f`.

Dodaliśmy *to, co było konieczne*, żeby uzyskać kategorię i *tylko to*, co było konieczne, a więc to
jest najprostsza albo najmniejsza tego rodzaju kategoria, chociaż to, że jest najprostsza albo
najmniejsza możemy powiedzieć tylko nieformalnie, bo nie zdefiniowaliśmy żadnej miary złożoności ani
wielkości kategorii. Możemy też powiedzieć, że to jest *najlepsza* albo doskonała kategoria tego
rodzaju, *o ile* przyjmiemy, że to, co jest prostsze albo mniejsze jest też *lepsze*, bo słowa
"lepszy" i "doskonały" mają akurat charakter *ocenny*, a możemy tak przyjąć, bo taki sposób mówienia
i myślenia ma intuicyjny sens.

Strzałka `f` *jako taka* nie jest endostrzałką, bo łączy dwa *różne* punkty. Gdyby ta strzałka coś
oznaczała, to w ogólnym przypadku musilibyśmy dopuścić możliwość, że te punkty oznaczają to samo,
ale w tym wypadku ta strzałka niczego nie oznacza. Przyda nam się odtąd nazwa na takie strzałki,
żeby mówić o tym prościej, dlatego będę czasem nazywał je *egzostrzałkami*. Egzostrzałką będzie więc
taka strzałka, że jej źródło i cel to *inne punkty*, które co prawda w ogólnym przypadku *nie muszą
oznaczać innych obiektów*, ale to akurat *nie będzie miało znaczenia*, kiedy będziemy się skupiać
tylko na tej własności strzałek.

Struktury matematyczne (takie jak kategoria), które powstają w taki wymuszony przez ich definicje
sposób (który tutaj polega na dodaniu endostrzałek i operacji składania tak, żeby aksjomaty
kategorii były spełnione) z części czy obiektów, które same jeszcze nie muszą być tego rodzaju
strukturami (a sama strzałka nie jest jeszcze kategorią), nazywamy *wolnymi*. Wolne konstrukcje są
więc takimi jakby dopowiedzeniami opisu struktury określonego rodzaju. W tym przypadku to jest
*wolna kategoria generowana przez jedną egzostrzałkę*.

## icśonlaud adasaZ

Jeżeli teraz *czysto formalnie*, czyli tak jakby dla zabawy, odwrócimy strzałkę `f` i zapiszemy ją
jako `X ← Y`, to z takiej egzostrzałki też będziemy mogli w ten sam sposób wygenerować unikalną
wolną kategorię i to będzie *taka sama kategoria*, bo zmienią się *tylko nazwy* części jej
struktury. Jeśli masz ochotę, możesz to sama sprawdzić, zresztą to jest niezłe ćwiczenie, bo nie
jest szczególnie trudne, a na pewno sprawi, że będziesz trochę lepiej pamiętać pewne rzeczy i
łatwiej Ci się będzie potem o nich myślało.

A co gdyby punktem wyjścia był (statyczny, jak to graf) graf `A ← B → C`, gdzie strzałkę `A ← B`
moglibyśmy oznaczyć arbitralnie jako `f`, a strzałkę `B → C` jako `g`? Wtedy też musielibyśmy tylko
dodać identyczności i zdefiniować wyniki składania `f` lub `g` z identycznościami na ich obu końcach
jako `f` i `g` odpowiednio i uzyskalibyśmy wolną kategorię nad tym grafem. Gdybyśmy jednak odwrócili
strzałki na *tym* grafie, uzyskując w ten sposób graf `A → B ← C`, to wolna kategoria generowana
przez ten nowy graf nie byłaby już taka sama w przyjętym (niejawnie) znaczeniu.

Z drugiej strony, *w innym znaczeniu* wolne kategorie generowane przez obydwa grafy *byłyby* takie
same, bo *jako kategorie wyrażałyby właściwie to samo*, tylko to coś byłoby *inaczej
zapisane*. Zastanawiasz się pewnie, o co mi teraz chodzi? Żeby to lepiej objaśnić, może skorzystam z
innego przykładu: Moglibyśmy przyjąć *konwencję interpretowania* wyrażeń o postaci `n < m` jako
oznaczających, że `n` jest *większe* niż `m`, czyli interpretować ten symbol *odwrotnie* niż to
zwykle robimy i gdybyśmy stosowali tą konwencję *konsekwentnie*, to *sens* tego, co byśmy mówili
*nie* uległby zmianie, zmieniłby się *tylko sposób zapisu* albo *sposób mówienia*. Tylko *czemu by
to mogło służyć*? Otóż temu:

**Sugestia**: Przepisz teraz proszę definicję *obiektu początkowego*, albo krócej i mniej oficjalnie
*początku*, ale w taki sposób, żeby wszystkie strzałki, które się tam pojawiają, były odwrócone, a
więc trzeba będzie odwrócić też wszystkie złożenia, których akurat w tej definicji nie ma, a więc
jeżeli chodzi o złożenia akurat w tym przypadku nic nie będzie trzeba robić. Nie nazywaj jednak
tego, co ta definicja będzie charakteryzować, jako obiekt początkowy, bo w ten sposób uzyskasz
definicję obiektu *końcowego*, oznaczanego często literą `T` od angielskiego słowa *terminal*,
którego szczególnym przypadkiem jest każdy singleton w kategorii `Set`.

Jak widać na tym przykładzie, z każdego pojęcia kategoryjnego uzyskujemy automatycznie dwa. Nazywamy
to [*zasadą dualności*](https://pl.wikipedia.org/wiki/Zasada_dualno%C5%9Bci_w_teorii_kategorii) w
teorii kategorii. Ta druga wersja defincji jest tak zwaną *dualną postacią* albo wersją tej
pierwszej i odpowiednio to drugie pojęcie (albo konstrukcja) jest dualne względem albo do tego
pierwszego. I odwrotnie, to pierwsze pojęcie (albo konstrukcja) jest dualne względem drugiego, bo
*operacja odwracania wszystkich strzałek i złożeń jest odwracalna*. Przyszło Ci teraz może do głowy
pojęcie izomorfizmu?  Jeżeli tak, to wspaniale, ale zwróć proszę uwagę, że dualne struktury nie są
jednak w ogólnym przypadku izomorficzne w technicznym znaczeniu tego słowa. Na przykład, wolna
kategoria nad grafem `A ← B → C` jest zdecydowanie *nie całkiem* taka sama jak wolna kategoria nad
grafem `A → B ← C`, nawet jeśli zignorujemy oznaczenia punktów i strzałek.

*Każda* kategoria ma swój dualny odpowiednik. Jeżeli mamy jakąś kategorię `ℂ`, to każdy punkt w tej
kategorii musi mieć swoją identyczność, składalne strzałki muszą odpowiadać unikalnym złożeniom i
operacja składania strzałek musi być łączna. Jeżeli teraz odwrócimy wszystkie strzałki w tej
kategorii i - żeby się nie pogubić - oznaczymy te dualne odpowiedniki za pomocą apostrofów i
zdefiniujemy *nową* operację składania w taki sposób, że dla każdych dwóch składalnych strzałek `f`
i `g` w kategorii `ℂ`, złożeniem ich odwróconych odpowiednikow w kategorii dualnej do `ℂ` będzie `f'
g'`, to uzyskamy pewną kategorię, a konkretnie kategorię dualną do `ℂ`. 

Możemy wtedy przyjąć, że każda strzałka `f' : X → Y` w kategorii `ℂ'` "kryje pod sobą" strzałkę `f :
Y → X` w kategorii `ℂ`, z której powstała i vice versa, a każde złożenie `f' g'` w `ℂ'` "kryje pod
sobą" złożenie `g f` w `ℂ`, któremu odpowiada i vice versa. Nie będzie trzeba dodawać apostrofów do
nazw *punktów* w kategorii dualnej, bo punktów nie da się odwrócić. Mówiąc dokładniej (ale dla
uproszczenia pomijając kwantyfikatory):

1. Kategorie dualne `ℂ` i `ℂ'` mają te same punkty.

2. `f` jest strzałką w `ℂ` z `X` do `Y` wtedy i tylko wtedy, gdy `f'` jest strzałką w `ℂ'` z `Y` do
   `X`.

3. `f g = h` wtedy i tylko wtedy, gdy `g' f' = h'`

**Sugestia**: Może masz ochotę spróbować udowodnić, że `Id' f' = f' = f' Id'`? To ostatnia szansa,
żeby zrobić to całkiem samodzielnie, bo [za chwilę
powiem](Logika_zdan_z_perspektywy_kategoryjnej2.md), skąd to wynika.

### Przypisy

[^1]: Tak wyszło. Odprowadzę się do drzwi.
