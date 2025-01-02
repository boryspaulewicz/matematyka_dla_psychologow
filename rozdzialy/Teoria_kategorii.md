# Nie ma to jak rysowanie

W tej książce nie ma na razie rysunków i nie wiem jeszcze, czy w ogóle jakieś będą. Mam ważny powód,
żeby ich unikać, ale na razie trudno mi to wyjaśnić. A teraz akurat będziemy potrzebowali rysunku, a
właściwie kilku, a tak naprawdę będziemy potrzebowali kilku *diagramów*.

**Polecenie**: Przygotuj czystą kartkę papieru i długopis albo cokolwiek innego do pisania. Może
najlepiej kartkę formatu A4. Połóż ją poziomo. Zaczniemy w lewym górnym rogu.

1. Zapisz literę *A*, a zaraz *po prawej* od niej małe
   [koło](https://pl.wikipedia.org/wiki/Ko%C5%82o) (nie
   [okrąg](https://pl.wikipedia.org/wiki/Okr%C4%85g)), jakbyś chciała zaznaczyć tylko pewien *punkt*
   i oznaczyć go literą *A*.

2. Po prawej od *punktu A*, w odległości równej powiedzmy mniej więcej połowie długości Twojego
   palca wskazującego (naprawdę nie musi być dokładnie), zaznacz drugie podobne koło, a *po prawej*
   od tego koła zapisz literę *B*. Odtąd dla własnej wygody pisania i Twojej wygody czytania będę
   nazywał tą odległość *krokiem*, a kiedy powiem, dla `X : Litera`, *oznacz* dany *punkt literą `X`
   z prawej*, albo *z lewej*, albo *z góry*, albo *z dołu*, to będzie mi chodziło o to, żebyś
   zapisała tą literę zaraz po prawej, albo zaraz z lewej, albo zaraz nad, albo zaraz pod tym
   punktem odpowiednio.

3. Narysuj strzałkę wychodzącą z punktu *A* i wchodzącą do punktu *B*, czyli taką z grotem
   wskazującym na punkt *B*. Może narysuj ją tak, żeby nie stykała się całkiem z punktami, ale to
   tylko sugestia. Ja robię to raz tak, a raz inaczej, i często się waham, którą wersję
   wybrać. Zgodnie z instrukcjami ta strzałka powinna być mniej więcej pozioma. Odtąd będę mówił
   krócej, na przykład: jeżeli na kartce `X : Punkt` i `Y : Punkt` (typowanie można czytać jak
   zdanie, pamiętasz?), to powiem *narysuj strzałkę z `X` do `Y`*, a właściwie powiem to nawet
   krócej (to tylko objaśnienie języka, jakim będę się w coraz większym stopniu posługiwał, nie
   instrukcja).

4. `Krok` poniżej `B : Punkt` narysuj `Punkt` i oznacz go z dołu literą `C`, a potem tak samo
   narysuj `Strzalka B C`, czyli strzałkę z punktu `B` do punktu `C`.

5. Zaraz nad `Strzalka A B` zapisz literę `f`, a zaraz po prawej od `Strzalka B C` zapisz literę
   `g`.

Masz teraz dwie strzałki, o których, gdy wymienimy je *w określonej kolejności*, możemy powiedzieć,
że są `Skladalne`, rozumiejąc przez to, że jedna strzałka (tutaj `f`) wchodzi do punktu (tutaj `B`),
z którego wychodzi druga (tutaj `g`). Ten fakt możemy więc zapisać jako zdanie `Skladalne f
g`. Zwróć uwagę, że *kolejność* strzałek ma tutaj znaczenie, bo nie jest prawdą, że `Skladalne g f`,
przecież strzałka `g` nie wchodzi do punktu, z którego wychodzi strzałka `f`.

Przydadzą nam się jeszcze słowa `Zrodlo` i `Cel`. Jeżeli `s : Strzalka` (na Twoim rysunku akurat
`f : Strzalka` i `g : Strzalka`, ale chcę podkreślić, że ta reguła obowiązuje ogólnie), to term
`Zrodlo s` będzie oznaczał odtąd (zauważyłaś, że to jest pół-formalna *definicja*?) `Punkt`, z
którego wychodzi `s`, a term `Cel s` będzie oznaczał `Punkt`, do którego wchodzi `s`.

Przyjmiemy teraz ważną *regułę* dotyczącą *strzałek*: Zawsze gdy mamy takie `f : Strzalka` i `g :
Strzalka`, że `Skladalne f g`, musimy *dorysować* (na razie *anonimową*) strzałkę, albo przynajmniej
*przyjąć, że istnieje* strzałka, której `Zrodlo` to `Zrodlo f` i której `Cel` to `Cel g`. Czyli w
przypadku tego rysunku to byłaby pewna narysowana ukośnie `Strzalka A C`. Ale w tej chwili jeszcze
nie będziemy jej rysować.

`Skladalne` oznacza więc tylko, a właściwie będzie niebawem oznaczało (po wprowadzeniu odpowiedniego
aksjomatu), że da się zawsze zrobić taką (unikalną) strzałkę. Konsekwencje jeszcze nie wprowadzonych
aksjomat*ów* (liczba mnoga), dotyczących operacji składania strzałek, można zapamiętać tak: *Dla
każdej skierowanej ścieżki istnieje jednostrzałkowa droga na skróty równa złożeniu wszystkich
strzałek należących do tej ścieżki* (czyli strzałka, której `Zrodlo` jest początkiem tej ścieżki, a
`Cel` jest jej końcem). Jeżeli to w tym momencie za dużo, nie przejmuj się, będziemy się do tego
bardzo stopniowo zbliżać.

Żeby zwiększyć szanse, że przypomnisz sobie o tej ważnej własności, jaką jest składalność, gdy to
pojęcie okaże się później potrzebne, poproszę Cię teraz o narysowanie, po prawej od *diagramu* (to
*niejawna definicja*, stałej *diagram*, zauważyłaś?), który już zaczęłaś rysować, pewien inny
diagram z *komentarzem*.

6. Narysuj, po prawej od diagramu ze `Strzalka`-mi `f` i `g`, dwie poziome `Strzalka` oznaczone z
   góry literami `i` i `j`, tworzące *ścieżkę skierowaną* zaczynającą się w `Punkt X`, przebiegającą
   przez `Punkt Y` i kończącą się na `Punkt Z`. Powiedziałem to tym razem trochę inaczej i dość
   skrótowo, ale wiesz, o co mi chodzi, prawda? Na tym nowym diagramie powinny być dwie poziome
   strzałki, `i` i `j`, takie, że `Zrodlo i` to `Punkt X`, `Cel i` to `Punkt Y`, `Zrodlo j` to
   `Punkt Y` i wreszcie `Cel j` to `Punkt Z`.

7. Otocz ten diagram prostokątem i napisz pod nim następujący komentarz: *Takie pary strzałek są
   składalne. Zawsze, gdy mówimy o składalności strzałek, ważna jest* **kolejność** *w jakiej
   wymieniamy strzałki. W tym przypadku możemy powiedzieć, że składalne są strzałki `i` i `j`, ale*
   **nie** *możemy powiedzieć, że składalne są strzałki `j` i `i`, bo* **nie wiemy**, *czy `Cel j`
   to `Zrodlo i`* (niedługo wyjaśnię o co chodzi z tym "nie wiemy").

Teraz, gdy mam nadzieję będziesz mogła trochę swobodniej operować formalnym pojęciem składalności,
możemy wrócić do pierwszego diagramu.

8. Narysuj `Strzalka`, której `Zrodlo` to `Zrodlo f` i której `Cel` to `Cel g`. Oznacz tą strzałkę
   zapisując po zewnętrznej stronie trójkąta, który w ten sposób powstał, literę `h`. Od tego
   momentu ta strzałka nie jest już anonimowa, bo nadaliśmy jej nazwę (`h`).

Byłbym zapomniał, a to jest przecież ważne. Wróćmy na chwilę do drugiego diagramu.

9. Pod zapisanym już komentarzem dodaj jeszcze ten: **Trudne (więc wymaga czasu), ale ważne**:
   *Rysunek* **sugeruje** *tutaj, że `X`, `Y` i `Z` to* **różne** *punkty i że `i` i `j` to*
   **różne** *strzałki i to faktycznie* **są** *różne punkty i strzałki* **na tym rysunku**, *ale to
   są jednocześnie tylko* **reprezentacje** *i te punkty i strzałki mogą, ale nie muszą*
   **oznaczać** *te same obiekty* (odpowiedniego typu). *Punkty `X`, `Y` i `Z` pełnią tu więc role
   abstrakcyjnych* **reprezentacji** *czegoś, co spełnia pewne wymagania* (jak się okaże, będą to
   wymagania kategorii), *to są więc takie* **rysunkowe zmienne** *i tak samo zmiennymi są również
   wszystkie strzałki* (chyba, że z jakiś powodów przyjmiemy określone *definicje* tych symboli i
   staną się przez to *stałymi*).

Wiesz, o co mi chodzi? Teraz **Ty jesteś funkcją**, *która widzi, że dostała* **jakieś**,
*niekoniecznie różne obiekty, które dla Ciebie są oznaczone* (albo *reprezentowane*) *przez `Punkt`
`X`, `Y` i `Z` i* **jakieś**, *niekoniecznie różne obiekty, które dla Ciebie są oznaczone jako
`Strzalka` `i` i `j`, o których to obiektach wiesz tylko tyle, że `Skladalne i j`. Te obiekty są dla
Ciebie "opakowane" i nie możesz otworzyć tych opakowań.*

*To jest więc teraz* **"Twój" kontekst** *albo* **kontekst "Ciebie" jako funkcji**. *To całkiem
dosłownie* **"Twój" kontekst** *ponieważ to jest teraz część* **fragmentu środowiska fizycznego**,
*który, chociaż się nieustannie zmienia i nie jest tak naprawdę oddzielony od reszty świata żadną
ścisłą i nieprzepuszczalną granicą, jest jednak dla "Ciebie" szczególnie ważną częścią środowiska,
bo jest zawsze przy "Tobie", albo "jest" - przynajmniej do pewnego stopnia - "Tobą", zależnie od
punktu widzenia. Tą zawsze dla "Ciebie" łatwo dostępną i stosunkowo kontrolowalną część środowiska
nazywasz* **"własnym" ciałem**. *A część "Twojego" ciała, która* **pełni teraz rolę kontekstu
"Ciebie" jako pewnej funkcji** *nazywasz "Twoją"* **pamięcią**.

Nie ma znaczenia, czy się z tym zgadzasz, czy nie, bo tworząc ten rysunek i stosując zaproponowany
przeze mnie język opisu *sama* sprawiłaś, że to się już *stało*. I co Ty na to? Niby zwyczajna
(prawie) rozmowa, a jednocześnie nie taka całkiem zwyczajna, prawda? Właściwie nie różni się to
niczym od wszystkich moich wcześniejszych prób wytłumaczenia Ci czegoś, bo pisząc musiałem zakładać,
że będziesz w określony sposób ze mną *współpracować*, a w każdym razie miałem przez cały ten czas
taką nadzieję. Jeżeli więc tylko próbowałaś zrozumieć to, o czym do Ciebie mówiłem, a skoro czytasz
ten fragment, to mogę założyć, że tak, to przez cały ten czas działo się dokładnie to samo, teraz
tylko szczegóły są nowe. A właściwie przecież już
[wtedy](https://github.com/boryspaulewicz/matematyka_dla_psychologow/blob/main/rozdzialy/Pierwszy_spacerek.md#ten-tytu%C5%82-jest-tylko-po-to-%C5%BCeby-do-niego-p%C3%B3%C5%BAniej-wr%C3%B3ci%C4%87),
niemal na samym początku, nawet szczegóły były dosyć podobne. Zgaduję jednak, że Twoje *wrażenie* na
czym to polega może być tym razem w jakiś trudny do określenia sposób inne.

Wróćmy już jednak do pierwszego diagramu.

10. Narysuj, omijając z zewnątrz łukiem literę `h`, taką `i : Strzalka`, że `Rownolegle h i` i oznacz
    ją zapisując po zewnętrznej stronie literę `i`.

Przypuszczam, że od razu domyśliłaś się, o co mi chodzi, ale na wszelki wypadek wyjaśniam. Odtąd
czasem przyda nam się term `Rownolegle`. Jeżeli `i : Strzalka` i `j : Strzalka` i jednocześnie
`Zrodlo i` to `Zrodlo j`, a `Cel i` to `Cel j`, czyli jeżeli `i : Strzalka` i `j : Strzalka` mają to
samo `Zrodlo` i ten sam `Cel`, to możemy powiedzieć (bo te założenia pozwalają to zawsze udowodnić
na mocy \{tutaj niejawnie wprowadzonej\} aksjomatycznej definicji), że `Rownolegle i j`.

Myślę, że od razu widzisz, że `h` i `i` są nie tylko równoległe, ale również w taki sam, ważny dla
nas odtąd sposób związane ze strzałkami `f` i `g`. Można powiedzieć, że zarówno `h` jak i `i` są
jakby brakującymi bokami trójkąta o bokach `f : Strzalka` i `g : Strzalka` *i jednocześnie* (to też
jest w tym wypadku ważne) zachodzi między nimi coś w rodzaju *uogólnionej `Rownoleglosc`*, bo
(dwustrzałkowa) *ścieżka* `f - g` i *jednostrzałkowe ścieżki* `h` i `i` są wszystkie *kierunkowe* i
mają ten sam *początek* i *koniec*, jak dwie (niekoniecznie różne \{zacząłem teraz nagle mówić o
potencjalnym *znaczeniu* tych symboli\}) jednokierunkowe ulice, którymi możemy wyjechać z tego
samego miejsca i dojechać do tego samego miejsca. 

To ostatnie zdanie jest dosyć perfidne, więc nie przejmuj się nim, jeżeli jeszcze Ci się dobrze nie
"przykleja". Spokojna [tafla tego oceanu](https://ncatlab.org/nlab/show/The+Rising+Sea) będzie się i
tak powoli unosić, aż w końcu niemal bez użycia siły [rozłupiemy razem ten twardy orzech do
zgryzienia](https://people.math.harvard.edu/~knill/teaching/math22b2019/handouts/lecture15.pdf),
musimy tylko poczekać, żeby się trochę namoczył. O ile oczywiście zdecydujesz, żeby czytać dalej.

Jeszcze bardziej przyda nam się odtąd term `Kompatybilne`. Jeżeli `f : Strzalka`, `g : Strzalka` i
`h : Strzalka`, to jeżeli `Skladalne f g` i `Zrodlo h` to `Zrodlo f`, a `Cel h` to `Cel g`, tak jak
na pierwszym diagramie, to `Kompatybilne f g h`. Na Twoim rysunku taką relację spełniają więc dwie
trójki: `Kompatybilne f g h` i `Kompatybilne f g i`.

Wprowadzimy teraz pewnego rodzaju *działanie na strzałkach*, czyli operację podobną na przykład do
dodawania, ale ta operacja nie będzie dotyczyła liczb, tylko naszych strzałek. Będziemy ją
*zapisywać* tak, jak znaną Ci już *aplikację*, tylko jakby *w odrwotnej kolejności*: 

Jeżeli `f : Strzalka` i `g : Strzalka` i `Skladalne f g`, to `Zlozenie f g : Strzalka`. Działanie
nazywa się tutaj `Zlozenie` i stwierdziliśmy właśnie o nim, że złożenie dwóch kompatybilnych
strzałek `f` i `g` (w tej kolejności) jest również `Strzalka`, analogicznie do tego, że suma dwóch
liczb naturalnych jest również liczbą naturalną. Nasza operacja `Zlozenie` różni się jednak od
dodawania między innymi w ten ważny sposób, że dodawanie ma sens dla *każdej* pary liczb, a
`Zlozenie` ma sens *tylko* dla tych (uporządkowanych) par `Strzalka`, które są `Kompatybilne`. Można
więc już całkiem nieformalnie powiedzieć, że `Zlozenie` jest działaniem *wybrednym*.

Umówiliśmy się więc, że gdy `Skladalne f g`, to *musi istnieć* `Strzalka`, która jest *unikalnym*
`Zlozenie f g`, w tej kolejności. Mamy teraz do wyboru dwie strzałki, `h` i `i`. Wybierzemy `h`, bez
żadnego powodu, i wobec tego proszę Cię jeszcze, żebyś wewnątrz tego diagramu-trójkąta zapisała
symbol `✓`, który po polsku nazywamy [*fajką*](https://pl.wikipedia.org/wiki/Fajka_(znak_wyboru)),
*ptaszkiem*, *haczykiem* lub *parafką*. Wybieram *ptaszka*. 

Będziemy odtąd rozumieć, że *diagram*, wewnątrz którego znajduje się ptaszek, jest (z założenia,
albo z jakiegoś powodu, wszystko jedno, po prostu jest) *przemienny*. Wydaje mi się, że w tym
momencie najlepiej objaśnić to pojęcie skupiającc się tylko na Twoim diagramie. Ponieważ naniosłaś
ptaszka, z Twojego rysunku możemy teraz odczytać, że `Zlozenie f g` *jest tym samym (czymś) co*
`h`. *Gdybyś* dodała jeszcze *ptaszka* między `i` i `h`, znaczyłoby to, że `i` jest tym samym
(czymś) co `h`, a skoro `h` jest już (na mocy samej naszej decyzji) tym samym czymś, co `Zlozenie f
g`, to znaczyłoby to również, że `i` jest tym samym (czymś), co `Zlozenie f g`. Ale nie rób tego,
chyba, że musisz.

Może dam sobie już spokój z tą zabawą w pół-sformalizowany pół-dialog.

Dużo tego było, ale można to wszystko podsumować dosyć krótko mówiąc, że rozważamy teraz *świat z
samych strzałek i punktów, które zawsze* (o tym jeszcze nie mówiłem) *są źródłami albo celami jakiś
strzałek*. Czyli w naszym świecie nie ma punktów które nie są w ogóle "strzałkowe". A nie ma w tym
świecie żadnych punktów, które nie są ani źródłem ani celem jakiejś strzałki, bo *jedyne, do czego
tutaj służą punkty*, to *ograniczanie działania relacji składania*. A więc te punkty są *tylko* po
to, żeby można było elastycznie określać sposób, w jaki operacja składania jest wybredna (w różnych
sytuacjach).

Dodamy jeszcze dwie reguły, ale najpierw musimy wprowadzić coś, czego do tej pory jeszcze nie
definiowaliśmy, a co odgrywa w matematyce niezwykle ważną rolę, to znaczy *relację równości*.

## Równość (Wolność i Braterstwo)

Nie wiem, czy to zauważyłaś, ale od dłuższego czasu w ogóle nie posługiwaliśmy się relacją równości
inaczej, niż korzystając z niej w przykładach, które odgrywały rolę wyłącznie ilustracyjną. Gdy na
przykład ta relacja pojawiła się, gdy pisałem o twierdzeniu o przemienności dodawania, które jest
wartością stałej `Nat.add_comm`, to tylko o tym wspominałem. Nie korzystaliśmy przecież z tego
twierdzenia, żeby cokolwiek udowodnić. Zrobimy to teraz.

Zamiast znowu definiować twierdzenie, skonstruujemy *dowód anonimowy* używając słowa kluczowego
`example`, które działa tak samo jak `theorem`, ale nie definiuje żadnej nowej stałej. Będziemy
korzystać z relacji równości dotyczącej trzech liczb naturalnych, `a`, `b` i `c`, o których
założymy, że `a = b` i `b = c` i na temat których udowodnimy, że `a = c`. W zwykłej książce do
matematyki taki dowód mógłby wyglądać tak ...

$a = b = c$

i to byłby pełnowartościowy dowód, ponieważ wiemy, że relacja równości jest przechodnia, więc w tym
zwięźle zapisanym "podwójnym" równaniu mamy wszystkie informacje potrzebne do tego, żeby stwierdzić,
że $a = c$. Jakiś bardziej pedantyczny autor mógłby napisać też tak:

$a = b$ (1)  
$b = c$ (2)  
$a = c$ przechodniość równości (1) (2)

albo tak:

Jeżeli (1) $a = b$ i (2) $b = c$, to:

$a = b$ (1)  
$\ = c$ (2)  
$a = c$ przechodniość równości (1) (2)

Ponieważ jednak w Leanie możliwości posługiwania się tego rodzaju *pół-formalnymi skrótami
myślowymi* są ograniczone, musimy napisać więcej:

```lean
-- Niech a, b i c będą jakimiś liczbami naturalnymi ...
variable (a b c : Nat)

-- ... o których zakładamy, że:
variable (h1 : a = b)
variable (h2 : b = c)

-- ... to a = c:
example : a = c :=
    -- Konstruowanie *dowodu rachunkowego* rozpoczynamy za pomocą słowa kluczowego *calc*:
    calc
        a = b := h1
        _ = c := h2
```

Zwracam uwagę, że *każda linia* takiego dowodu wymaga *osobnego dowodu* (podanego za symbolem
definiowania `:=`) i że możemy uprościć zapis korzystając z symbolu podkreślenia `_` i od pewnego
momentu podawać jawnie tylko prawe strony równań, tak jak tutaj podajemy tylko `c` w ostatnim
równaniu.

**Polecenie**: Dokończ dowód rachunkowy posługując się poprzednim dowodem jako przykładem. Twój
dowód będzie wyglądał bardzo podobnie, ale będzie miał o jedną linię więcej i ta dodatkowa linia
będzie wymagała zastosowania hipotezy, której nie było w poprzednim dowodzie.

```lean
variable (a b c d : Nat)

variable (h1 : a = b)
variable (h2 : b = c)
variable (h2 : c = d)

example : a = d :=
    calc
```
