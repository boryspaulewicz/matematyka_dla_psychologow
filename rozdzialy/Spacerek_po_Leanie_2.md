# Spacerek po Leanie, wersja druga

Jedną z ważniejszych rzeczy, kiedy uczymy się czegoś nowego, jest moim zdaniem przyzwyczajenie się
do technicznych znaczeń niektórych słów. Tylko w ten sposób będziesz miała *szansę* dobrze
zrozumieć, o czym mówię. Z niektórymi z tych terminów zapoznasz się tak zwaną (przeze mnie od
dzisiaj) metodą mimowolnego oswojenia, bo nie będę ich dokładnie objaśniał, tylko pokażę Ci, jak ich
używam.

Polecenia i zadania, które pojawiają się w pierwszych rozdziałach nie wymagają instalacji Leana, ale
jeżeli dotyczałaś do tego momentu, to możliwe, że przynajmniej brałaś już to pod uwagę. Polecam
zainstalować, na przykład w połączeniu z darmowym edytorem VS Code. Instrukcje, jak szybko
zainstalować oba te narzędzia znajdziesz [tutaj](https://lean-lang.org/lean4/doc/quickstart.html).

**Polecenie**: Jeżeli nie używasz edytora VS Code, a w pierwszych rozdziałach zakładam, że nie, to
Skopiuj na początek do lewego okna taki fragment kodu:

```lean
-- Tekst zaczynający się od -- to komentarz. Komentarze są przez Leana ignorowane. Dzięki temu
-- możemy napisać na przykład to:
--
-- Lean jest głupi

-- Ta fascynująca funkcja pobiera jeden argument typu Nat, czyli liczbę naturalną, i nic 
-- z nią nie robi, poza tym, że ją zwraca
def nic_nie_robie (n : Nat) : Nat := n
```

**Czytamy to**: 

Definiuję (`def`) 

funkcję (funkcję, bo ma parametr) `nic_nie_robie`

która ma parametr `n` typu `Nat` (`(n : Nat)`) 

i zwraca (tak czytamy symbol `:` po specyfikacji ostatniego parametru funkcji) term typu `Nat`. 

*Ciałem* tej funkcji jest wyrażenie `n`. Właściwie to jest raczej ciałko niż ciało. Czy widzisz, że
składania Leana jest dość intuicyjna?  Nawet, jeżeli tego jeszcze nie widzisz, wklej poniżej
następny fragment kodu i umieść kursor na komendzie `#eval`. Zobaczysz wtedy po prawej rezultat
*ewaluacji* aplikacji funkcji `nic_nie_robie` do termu `1`. To będzie `1`, bo funkcja
`nic_nie_robie` nic nie robi, tylko zwraca swój argument.

```lean
#eval nic_nie_robie 1
```

Teraz będziemy *sprawdzać typ termu* `nic_nie_robie`. W tym celu wklej ten fragment:

```lean
#check @nic_nie_robie

#check nic_nie_robie
```

Gdy umieścisz kursor nad *pierwszym* wystąpieniem słowa `#check`, zobaczysz po prawej typ termu
`nic_nie_robie` zapisany w taki oto sposób:

`nic_nie_robie : Nat → Nat`

`Nat` to typ oznaczający właśnie liczby naturalne. Myślę, że zaczęłaś się już trochę oswajać z tym,
że w Leanie wyrażenie o postaci `M : N`, gdzie `M` i `N` to jakieś wyrażenia, oznacza, że `M` ma typ
`N`. Gdy `M` to zmienna, na przykład `x`, `M : N` jest *deklaracją* (typu tej zmiennej), na
przykład, `x : N` jest deklaracją, że `x` ma typ `N`. Brzmi strasznie? No to popatrz na to (ale nie
wklejaj tego do Leana):

`10 : Nat`

To jest deklaracja, że `10` ma typ `Nat`, czyli, że `10` jest liczbą naturalną. A zawsze, gdy po
stronie typu, czyli po prawej od symbolu `:`, widzisz strzałkę, to masz do czynienia z *typem
funkcyjnym*. Na przykład `nic_nie_robie` jest funkcją, bo ma w typie strzałkę. Komunikat, który
widzisz po prawej, gdy sprawdzasz typ tej stałej:

`nic_nie_robie : Nat → Nat`

możesz więc odczytać tak:

*`nic_nie_robie` jest funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę naturalną*.

Jeżeli umieścisz kursor nad drugim wystąpieniem komendy `#check`, tym, któremu nie towarzyszy symbol
`@`, to zobaczysz *tą samą informację*, tylko *przedstawioną w inny sposób* (zgodny z tym, jak ta
funkcja była zdefiniowana):

`nic_nie_robie (n : Nat) : Nat`

Wydaje mi się, że już rozumiesz, jak to odczytujemy, ale na wszelki wypadek jeszcze raz
wyjaśniam. Stąd, że obok stałej `nic_nie_robie` mamy fragment `(n : Nat)` możemy wywnioskować, że
`nic_nie_robie` jest funkcją, która wymaga jako argumentu liczby naturalnej. Nawiasem mówiąc,
nazwałm ten parametr `n`, ponieważ to pierwsza litera w słowie *naturalna*.

Gdy teraz skopiujesz do Leana jeszcze to:

```lean
#check nic_nie_robie 1 : Nat
```

i umieścisz kursor nad trzecim nad komendą `#check`, to zobaczysz po prawej komunikat:

`nic_nie_robie 1 : Nat`

W tym komunikacie po lewej od `:` widzimy tym razem *dwa* termy, które razem są jednym *termem
złożonym*, oznaczającym *aplikację* (funkcji do termu), czyli w tym wypadku zastosowanie funkcji
`nic_nie_robie` do `1`. Pierwszy z tych termów jest funkcją, a drugi to liczba `1`. Pierwszy i
jedyny parametr funkcji `nic_nie_robie` ma typ `Nat` i `1` też ma typ `Nat`, a zatem `1` jest termem
typu, którego ta funkcja wymaga. Dlatego aplikacja funkcji `nic_nie_robie` do termu `1` jest
poprawna.

**Definicja aplikacji**: Samo *zestawienie* funkcji i termu nazywamy *aplikacją funkcji do termu*,
albo krócej *aplikacją*.

W Lean wszystkie termy, w tym również złożone, muszą mieć jakiś typ. Ale uwaga, nie każdy term *ma*
typ. Można skonstruować termy, których nie da się typować. Dla Leana takie termy są
"bezsensowne". Jeżeli w tym momencie obawiasz się, że napiszesz jakieś termy bezsensowne, to
niepotrzebnie. Prawie na pewno napiszesz wiele termów bezsensownych. Im więcej piszesz, tym więcej
bzdur napiszesz, jak zauważył chyba Gombrowicz. To jest może zła wiadomość, chociaż nie jestem
pewien. Na pewno dobra wiadomość jest taka, że Lean Ci wtedy o tym powie.

Zgaduję, że od razu rzuca Ci się w oczy, że z termem `1 nic_nie_robie` jest coś nie tak. W końcu `1`
nie jest funkcją, a więc nie da się do niczego aplikować termu `1`. Myślę, że nie potrzebujesz
wsparcia Leana, żeby zauważyć, że to wyrażenie nie ma za bardzo sensu, prawda? To, że aplikacja
`nic_nie_robie 1` ma typ `Nat` też jest już dla Ciebie mam nadzieję w miarę oczywiste. Przecież
`nic_nie_robie` jest funkcją, która z dowolnej liczby naturalnej robi jakąś liczbę naturalną.

Czy to nie był sparecek po łączce? Nie? To może jeszcze jeden. Funkcja, którą zdefiniowaliśmy, to
identyczność albo inaczej funkcja identycznościowa. Ta funkcja wydaje się wręcz zbędna, ale tak jak
liczba zero, czasami nie można się bez niej obejść. Na przykład wtedy, gdy taka funkcja okazuje się
jedynym *rozwiązaniem problemu*. 

Wiele problemów w matematyce można wyrazić jako zbiór relacji między jakimiś funkcjami, z których co
najmniej jedna funkcja jest nieznana i trzeba ją znaleźć. Dokładnie tak, jak problem dotyczący liczb
może polegać na tym, że mamy na przykład jakiś układ równań z jedną lub wieloma niewiadomymi
reprezentowanymi przez zmienne i chcemy znaleźć wszystkie wartości tych zmiennych spełniające te
równania. Okazuje się wtedy czasem, że przynajmniej jedna niewiadoma może przyjąć wartość zero i
wtedy zero bardzo się przydaje.

Nasza funkcja identycznościowa jest ograniczona w tym znaczeniu, że dotyczy tylko liczb naturalnych,
a przecież pojęcie uniwersalnej funkcji identycznościowej, która zwraca bez zmian termy dowolnego
stypu, wydaje się całkiem sensowne. Żeby uzyskać taką ogólniejszą wersję identyczności, napiszemy
tak:

```lean
def identycznosc (typ : Type) (a : typ) : typ := a
```

Ta funkcja ma dwa parametry, a nie jeden, bo chociaż jest uniwersalną identycznością, to nadal "musi
wiedzieć, o co chodzi". Dlatego wymaga podania typu parametru, który ma zwrócić bez zmian. Żeby
zastosować tą funkcję do liczby naturalnej `1`, musimy ją najpierw poinformować, że zaraz dostanie
liczbę naturalną. Musimy więc podać typ `Nat` jako pierwszy argument aplikacji. Gdy po skopiowaniu
również poniższego kodu umieścisz kursor nad słowem `#eval` to zobaczysz, że gdy ta funkcja jest
odpowiednio poinformowana co dostanie jako drugi argument, to go zwraca:

```lean
#eval identycznosc Nat 1
```

Nowa wersja funkcji identycznościowej *działa dla dowolnego typu* dzięki temu, że *typ drugiego
argumentu* i zarazem *rezultatu* jest jej *parametrem*. To jest przykład *typu zależnego*. Język,
którego używamy pisząc w Leanie (albo innych podobnych asystentach dowodzenia) nazywa się teorią
typów zależnych i swoją oszałamiającą ekspresyjność zawdzięcza przede wszystkim właśnie obecności
tego rodzaju typów.

**Parametry i argumenty**: *Parametr* jest częścią definicji funkcji, natomiast *argument funkcji*
to term, do którego ta funkcja jest aplikowana:

```lean
-- n jest tutaj *parametrem*. Nie kopiuj tego kodu, jeżeli wprowadziła/eś już definicję tej funkcji
def nic_nie_robie (n : Nat) : Nat := 
    -- To jest całe (małe) ciało tej funkcji, tylko zapisane w następnej linijce
    -- Widać tu *zmienną* n, będącą parametrem tej funkcji
    n

-- Tutaj 1 jest *argumentem* (aplikacji funkcji nic_nie_robie), ale to tylko aplikacja,
-- bo sprawdzajac typ nie wymuszamy jeszcze ewaluacji
#check nic_nie_robie 1

-- Gdy wymusimy ewaluację, to otrzymamy *rezultat* tej aplikacji, czyli najprostszą postać 
-- termu, (tak zwaną postać normalną), do której to wyrażenie da się zredukować
#eval nic_nie_robie 1
```

## Obliczenia w dwóch wymiarach

Zarówno funkcja `identycznosc` jak i jej głupsza siostra `nic_nie_robie` pozwalają zaobserwować, że
w Leanie zachodzą dwa rodzaje "obliczeń". Funkcja `nic_nie_robie` ma typ `Nat → Nat`. Gdy aplikujemy
ją do termu `1`, żadne obliczenie "wewnątrz" czy za pomocą tej funkcji jeszcze nie zachodzi, bo
stakie obliczenie wymaga ewaluacji. Zachodzi jednak *zmiana typu* z `Nat → Nat` na `Nat`, a to też
jest pewnego rodzaju obliczenie (tekst zaczynający się od `--` jest komentarzem i jako taki jest
zawsze ignorowany przez Leana):

```lean
#check @nic_nie_robie -- nic_nie_robie : Nat → Nat

#check nic_nie_robie 1 -- nic_nie_robie 1 : Nat
```

Na skutek wystąpienia aplikacji to, co jest przed strzałką w wyrażeniu `Nat → Nat`, zostaje oderwane
i zostaje tylko to, co jest po strzałce. To jest zrozumiała zmiana, bo przecież zastosowanie funkcji
zwracającej liczbę naturalną jest jakimś sposodem zapisania ... liczby naturalnej. Tak samo *1 + 2*
jest jakimś sposobem zapisania liczby naturalnej. Wszędzie, gdzie możemy podstawić pod zmienną jakąś
liczbę naturalną, możemy podstawić też całe wyrażenie *1 + 2*. Widzimy więc konieczność zajścia w
ramach aplikacji pewnego rodzaju obliczenia "na poziomie typu" albo "w wymiarze typów".

W przypadku aplikacji funkcji `id` tego rodzaju obliczenie jest bardziej złożone, ale nadal
zrozumiałe:

```lean
#check @identycznosc -- identycznosc : (typ : Type) → typ → typ

#check @identycznosc Nat 1 -- @identycznosc Nat 1 : Nat
```

To obliczenie jest bardziej złożone, bo poza "oderwaniem się" typów odpowiadających dwóm podanym
argumentom następuje również *podstawianie na poziomie typu*. Możemy ten proces rozpisać na
kroki. Skoro argument `Nat` stał się wartością parametru `typ`, to następny argument i rezultat
aplikacji też muszą mieć ten typ:

```lean
identycznosc Nat : Nat → Nat
```

Widzimy w tym fragmencie kodu rezultat aplikacji do pierwszego argumentu. W Leanie możemy to zapisać
i ten term będzie poprawny (typowalny), ponieważ Lean pozwala na takie *częściowe aplikacje*. Typ
funkcji `identycznosc` jest więc czymś w rodzaju funkcji z jednym parametrem `typ`. To *nie* jest
funkcja, bo typu nie możemy do niczego aplikować, ale na etapie aplikacji ten typ działa, jakby był
funkcją i jakby ta funkcja była aplikowana do argumentu `Nat`. Nie przejmuj się, jeżeli mimo moich
zapewnień, że to naturalny proces, wydaje Ci się to zbyt trudne; szybko się do tego przyzwyczaisz.

# Funkcje, programy i implikacja

Na początku będę mówił o funkcjach rozumianych jako efektywne procedury obliczeniowe, albo po prostu
programy, procedury, czy algorytmy. Niedługo zacznę też mówić o implikacji. Mam powody, żeby od tego
zacząć, ale trudno mi je dobrze wyjaśnić już teraz, bo nie mogę zakładać, że wiesz o pewnych
sprawach, bez znajomości których moje wyjaśnienia byłyby pewnie niezrozumiałe, nieprzekonujące, a
może nawet onieśmielające (cel jest dość ambitny).

Może powiem tak: Istnieje sposób, żeby jednocześnie uczyć się podstaw matematyki, programowania,
formalizowania treści wyrażonych w języku naturalnym i konstruowania dowodów matematycznych, a
wszystko to w interakcji z programem, który w tym pomaga, takim jak Lean. Postaram się, żeby ta
nauka była dla Ciebie możliwie łatwa, przyjemna i porzyteczna, a jeśli w którymś miejscu mi się to
nie uda, proszę, żebyś mi o tym powiedział/a, żebym miał szansę zrobić to lepiej. 

Żeby skorzystać z tego "sposobu na matematykę" (i metodologię badań i w ogóle całą psychologię),
trzeba się *cierpliwie przyzwyczajać* do *nowego sposobu myślenia*, polegającego między innymi na
patrzeniu na funkcje, programy i implikacje jako na jedno i to samo.

## Funkcje w Lean

**Polecenie**: Ppopatrz na ten fragment kodu, spróbuj go odczytać i przepisz go z pamięci. Jeżeli na
tym etapie to za trudne, to go skopiuj:

```lean
def suma (n : Nat) (m : Nat) : Nat := n + m
```

**Czytamy to**: Definiuję (`def`) wartość / znaczenie / treść stałej suma (`suma`) jako term o typie
*funkcja dwóch parametrów typu `Nat`, czyli typu liczba naturalna (`(n : Nat) (m : Nat)`), której
rezultat też jest typu `Nat` (`: Nat`), czyli też jest liczbą naturalną*.

A więc wszystko między symbolem `suma` a symbolem definiowania `:=` to określenie *typu*, a nie
treści (lepiej: *ciała*) definicji stałej `suma`.

**Czytamy dalej**: Ten term konstruuję albo definiuję jako (`:=`) zastosowanie funkcji dodawania -
bo to też jest pewna funkcja - do pierwszego i drugiego parametru, które to parametry nazwałem/am
`n` i `m`, bo tak mi się podobało, a poza tym zauważyła/em, że inni matematycy często stosują tą
konwencję, gdy mówią o liczbach naturalnych.

*Nazwy parametrów funkcji nie mają znaczenia* w tym sensie, że na przykład taka oto alternatywna
definicja (z apostrofem w nazwie):

```lean
def suma' (a : Nat) (b : Nat) : Nat := a + b
```

jest w łatwym do uchwycenia sensie *tą samą* tylko *inaczej zapisaną funkcją*. Jest też inaczej
nazwana, bo w Lean nie możemy dowolnie re-definiować symboli.

**Ostateczność definicji w Lean**: Gdy raz zdefiniujemy jakiś symbol, tutaj symbole
`suma` i `suma'`, nie możemy już więcej (w tym samym kontekście, ale o tym później) zmienić jego
definicji, chyba, że najpierw usuniemy poprzednią definicję. Dlatego takie symbole nazywamy
*stałymi*.

**Zmienne są zmienne**: Nazwy parametrów funkcji nie są stałymi, tylko *zmiennymi*, bo możemy
przypisywać im, czy raczej podstawiać pod nie, dowolne argumenty wymaganego przez definicję funkcji
typu. Na przykład, możemy zastosować funkcję `suma` do termów `2` i `2` i wtedy te termy "wskoczą"
na miejsce pierwszego i drugiego parametru. Możemy potem zastosować tą funkcję jeszcze raz, ale do
innych liczb i wtedy (i w tym miejscu) te liczby wskoczą w miejsce tych samych parametrów. Parametry
funkcji są więc zmiennymi, bo te same parametry tej samej funkcji mogą przyjmować różne wartości w
różnych fragmentach kodu.

**Polecenie**: Sprawdź typ aplikacji funkcji `suma` do dwóch liczb naturalnych, wszystko jedno
jakich, a następnie ewaluuj tą aplikację. Upewnij się, czy rozumiesz komunikaty pojawiające się w
panelu po prawej.

Żeby utrwalić sobie to, co do tej pory wyjaśniłem, rozważ proszę jeszcze taką oto funkcję:

```lean
def dodaj2 (a : Nat) : Nat := a + 2
```

**Polecenie**: Spróbuj odczytać samodzielnie sens tej defincji opierając się na fragmencie, w którym
objaśniłem, jak się czyta takie definicje. Może nawet zrób to na głos? Dzięki temu upewnisz się, czy
właściwy sposób czytania jest dla Ciebie jasny.

Myślę, że teraz już od razu widzisz, jak ta funkcja działa, nawet jeśli przed chwilą nie
wiedziałe/aś nawet, że język Lean istnieje. Myślę też, że jest już dla Ciebie oczywiste, że nazwa
parametru (tutaj `a`) nie ma znaczenia dla "sensu" tej funkcji: ta nazwa służy *tylko* do tego, żeby
można było wewnątrz ciała funkcji (całe ciało funkcji `dodaj2` to `a + 2`) "mówić" o ewentualnym
argumencie.

**Polecenie**: Spróbuj przepisać definicję stałej `dodaj2` z pamięci, żeby struktura takich
definicji zaczęła Ci się lepiej utrwalać i żebyś mogła ją szybciej mentalnie "parsować". Jeżeli Ci
się to nie uda, to po prostu zerknij znowu na tą definicję, przełącz się na okno, w którym działa
serwer Leana tak, żeby nie było jej widać i spróbuj ponownie. I tak do skutku. To Ci naprawdę pomoże
w przyswajaniu dalszych treści. Gdy już Ci się uda, sprawdź typ stałej `dodaj2`, raz poprzedzając ją
symbolem `@`, a raz nie. Sprawdź też typ aplikacji tej stałej do wybranej liczby naturalnej. Na
koniec ewaluuj tą aplikację. Za każdym razem popatrz na rezultat w panelu po prawej.

**Ewaluacja aplikacji krok po kroku**: Gdy umieścisz kursor nad komendą `#eval` w instrukcji `#eval
sdodaj2 2` wtedy Lean:

1. Ewaluuje, czyli redukuje do najprostszej postaci argument tej aplikacji. Tutaj jest tylko jeden
argument - `2` - i ten argument też *może* być zredukowany, ale o tym za chwilę.

2. Podstawia rezultat tej redukcji pod zmienną `a` w ciele funkcji, bo ta jest (tutaj jedynym)
parametrem funkcji `dodaj2`. W ten sposób powstaje `2 + 2` (posługując się dalej znaną Ci notacją
cyfrową).

3. Wreszcie ewaluuje uzyskaną w ten sposób wersję ciała funkcji, co może wymagać i zwykle wymaga
dalszych ewaluacji, i tak dalej, aż nie będzie się dało niczego więcej zredukować do prostszej
postaci.

Wydaje mi się, że mniej więcej czegoś takiego się spodziewałe/aś, może pomijając to, jak są
zdefiniowane liczby naturalne (a także dodawanie liczb naturalnych, o którym jeszcze nie mówiłem, a
które ma w Leanie piękną definicję rekurencyjną). Jeżeli chcesz się dowiedzieć czegoś więcej o
definicji liczb naturalnych, jaką stosuje Lean, poszukaj samodzielnie informacji na temat aksjomatów
Peano. Ja wyjaśnię tylko tyle:

Liczba naturalna *0* w Lean jest tak naprawdę zakodowana jako stała `Nat.zero`. Nie panikuj, *to
jest tylko pewien napis i nic więcej*. Zwykle zapisujemy ją jako `0`, ale ten zapis istnieje tylko
dla naszej wygody. Liczba naturalna *1* jest zapisana jako *sama aplikacja funkcji następnika do
stałej `zero`*, to jest jako `Nat.succ Nat.zero`. Czytamy to: Następna (stąd "następnik") liczba
naturalna po liczbie zero. Ta aplikacja jest już *nieredukowalna* - gdy pojawia się w trakcie
ewaluacji jako rezultat, to ewaluacja na niej się zakończy. Innymy słowy, ta aplikacja istnieje
tylko po to, żeby można było ją *zapisać* i na przykład podać jako argument, albo zwrócić jako
rezultat.

Zastanawiasz się może, o co w tym chodzi? Tak czy inaczej, spróbuję wyjaśnić: Gdyby przedstawiciele
jakiejś innej cywilizacji wymyślili "obiekty abstrakcyjne", których używaliby dokładnie tak, jak my
używamy liczb naturalnych, ale zapisywaliby i nazywali je inaczej, powiedzielibyśmy, że to są te
same "obiekty abstrakcyjne", albo, że mają "ten sam sens", tylko są inaczej nazywane, prawda?
Jesteśmy co prawda bardzo przyzwyczajeni do zapisu za pomocą cyfr arabskich, ale sam sposób zapisu
nie decyduje o znaczeniu, o tym decyduje sposób użycia tego zapisu. 

Stała `zero` i aplikacje takie jak `Nat.succ Nat.zero` całkiem dosłownie *są* liczbami
naturalnymi. Możemy tak powiedzieć, ponieważ wszystkie operacje, jakie możemy wykonywać na liczbach
naturalnych, możemy wykonywać na tych wyrażeniach, uzyskując przy tym wyniki, które są zgodne z
interpretacją: *0* to `zero`, *1* to `Nat.succ Nat.zero`, i tak dalej. Zapis nie ma tu znaczenia,
poza tym, że może być mniej lub bardziej wygodny dla osoby, która się nim posługuje.

Mówiąc dokładniej, sam *fragment kodu* albo *zapis* `Nat.succ Nat.zero` *jest* liczbą *1*. Nie wiem,
czy to Cię zaskakuje, ale sądzę, że może zaskakiwać. Kiedy się o tym uczyłem, to spodziewałem się na
początku, że coś, co wygląda jak aplikacja będzie "kryło pod sobą" jakąś funkcję i jakaś liczbę jako
argument, których będzie można użyć, żeby coś obliczyć. Wydaje się przecież, że skoro `Nat.succ
Nat.zero` coś *znaczy*, to powinno być jakby "coś pod spodem" `Nat.succ Nat.zero` i tym czymś
powinna być albo para złożona z funkcji i liczby, albo jakaś liczba *1* jako taka. 

To, że nic tam nie ma, to jednak w pewnym sensie dobra wiadomość, bo oznacza, że *nie ma tu żadnych
tajemnic*, są tylko rozmaite *ciągi symboli i dopuszczalne sposoby ich przekształcania*. Można
powiedzieć, że tym właśnie jest *matematyka formalna*, niczym więcej, gdy tylko pominiemy jej
*interpretację*, którą zresztą możemy zmieniać na dowolną inną, jeśli tylko będzie spójna.

**Zasięg nazw**: Gdybyś teraz w kolejnej linijce wkleił/a do Lean'a kod `#eval n`, to zobaczył/abyś
błąd, ponieważ `n` i `m` to w tym momencie *tylko* parametry funkcji `suma`, które są *widoczne
tylko z wnętrza ciała* funkcji `suma` (które to ciało składa się tylko z wyrażenia `n + m`).

**Polecenie**: Napisz w nowej linijce `#eval n`. Zobaczysz wtedy, że symbol `n` będzie podkreślony
czerwoną falką. Usuń ten błędny kod. W ten sposób Lean sygnalizuje, że nie wie, o czym mówisz, a nie
wie, bo symbol `n` jest widoczny tylko wewnątrz ciała funkcji `suma`. Tak właśnie działa zasięg
nazw.

**Funkcja jako pudełko z mechanizmem**: Możemy myśleć o funkcji takiej jak `suma` jako o pudełku,
które ma dwa wejścia, jedno oznaczone literą *n*, a drugie literą *m*, i które ma jedno wyjście, a w
środku zawiera "mechanizm dodający" obiekty pojawiające się na wejściach. Jeżeli wyobrazimy sobie,
że ten wewnętrzny mechanizm jest "przyklejony" do wejść, to stanie się jasne, że nazwy wejść nie
mają znaczenia i istnieją tylko dla wygody użytkownika.

Za to *typy* wejść i *typ* wyjścia (funkcja ma zawsze tylko jedno wyjście) *mają* znaczenie. Nie
możemy podawać na wejściu funkcji dodającej liczby czegokolwiek - to muszą być wyrażenia typu liczba
(tutaj akurat wymagamy liczb naturalnych) i tak też mówi nasza definicja. Jeżeli podamy na wejściu
dwa wyrażenia typu liczba naturalna, to na wyjściu pojawi się (gdy wymusimy ewaluację) liczba
naturalna. To będzie wynik dodawania wejść, bo tak jest skonstruowana zawartość pudełka o nazwie
*suma*.

Metafora funkcji jako mechanizmu w pudełku ma pewne ograniczenia. Jak już wiesz, wyliczenie
rezultatu aplikacji funkcji polega tak naprawdę na ewaluacji argumentów, następnie na podstawieniu
ich zredukowanych postaci pod odpowiednie zmienne w ciele funkcji i na ewaluacji (czyli redukcji)
ciała funkcji. "Mechanizm obliczający" jest więc "na zewnątrz" definicji funkcji. To taki
"uniwersalny ewaluator", albo "uniwersalny reduktor", który na etapie ewaluacji używa definicji
stałych, które napotyka i w odpowiedniej kolejności je rozpakowuje.

A oto bardziej skomplikowany przykład ewaluacji aplikacji. Myślę, że domyślasz się już, dlaczego ten
(wiem, że dziwny) fragment kodu jest poprawny i jak "działa". Przypominam, że `Nat.succ` to funkcja
następnika, której aplikacja do dowolnej liczby naturalnej *sama jest* następną liczbą naturalną (a
*nie* zwraca następną liczbę naturalną).

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))
```

Prześledźmy po kolei, co się tu dzieje, dla uproszczenia stosując wygodny zapis cyfrowy (nie
kopiuj tego kodu, to tylko objaśnienie):

```lean
#eval suma (Nat.succ (Nat.succ 3)) (6 - (2 + Nat.zero))

    -- Pierwszy krok ewaluacji (redukcji)
    suma (Nat.succ 4) (6 - 2)

    -- Drugi krok ewaluacji (redukcji)
    suma 5 4

    -- Ponieważ argumenty są postaci normalnej, w tym momencie następuje rozpakowanie 
    -- definicji stałej suma, 
    n + m

    -- A ponieważ 5 ma być podstawione za zmienną n (pierwszy parametr) a 4 za zmienną
    -- m (drugi parametr) to uzyskujemy taką wersję ciała
    5 + 4
    -- W tym momencie w taki sam sposób ewaluowana jest aplikacja funkcji + do liczb 5 i 4
```

Ewaluacja całego tego wyrażenia zaczyna się od ewaluacji najbardziej wewnętrznych albo
zagnieżdżonych części argumentów: `(Nat.succ 3)` i `(2 + Nat.zero)`. Rezultatami tych ewaluacji są -
stosując zapis cyfrowy - liczby *4* (*1 + 3*)) i *2* (*2 + 0*).  które same są aplikacjami, w
dodatku czasem aplikacjami pewnych funkcji (`Nat.succ` i `-`) *do rezultatów aplikacji* pewnych
funkcji (`Nat.succ` aplikowane do rezultatu aplikacji `Nat.succ` do termu `3` i funkcja `-`
aplikowana do termu `6` i rezultatu aplikacji funkcji `+`). Zwracam uwagę, że w tym kontekście `+` i
`-` też oznaczają pewne (dwuarguentowe) funkcje, tylko zapisane w *notacji infiksowej*:

`argument1 funkcja argument2`, na przykład `1 + 2`

zamiast w *notacji prefiksowej*:

`funkcja argument1 argument2`, na przykład `suma 1 2`

bo tak się zwykle zapisuje dodawanie i odejmowanie. Można łatwo "nauczyć" Leana, żeby "rozumiał"
taki zapis dla samodzielnie zdefiniowanych funkcji, takich jak na przykład `suma`, ale nie będziemy
tego teraz robić.

**Uwaga na nawiasy w aplikacjach funkcji do aplikacji**: Jesteś w stanie domyślić się, na czym
polega błąd w kodzie poniżej?

```lean
#eval suma Nat.succ 2 3
```

Funkcja `suma` wymaga argumentów typu `Nat`. Pierwszy argument aplikacji jest tutaj jednak *funkcją*
(`Nat.succ`), a nie liczbą naturalną. Żeby ten kod był poprawny, trzeba otoczyć fragment `Nat.succ
2` nawiasami:

```lean
#eval suma (Nat.succ 2) 3
```

## Curry(ing)

TODO Jest ok, ale wolę napisać to inaczej, bardziej od podstaw, używając najprostszych przykładów i
rozpisując wszystko na kroki.

**W Lean nie ma funkcji "prawdziwie" dwuargumentowych**: Funkcja `suma` *wygląda* jak funkcja
dwuargumentowa, ale tak naprawdę *nie* jest dwuargumentowa. Jest funkcją jednoargumentową, *która
zwraca funkcję jednoargumentową*, która dopiero dodaje parametr tej pierwszej funkcji do swojego
jedynego parametru. Może przeczytaj to jeszcze raz. 

Taki sposób definiowania funkcji więcej niż jednoargumentowych nazywa się *Curryingiem*, od nazwiska
pewnego wybitnego matematyka, który pojawi się tu jeszcze w znacznie poważniejszej roli.

**Polecenie**: Napisz kod pozwalający zobaczyć typ aplikacji funkcji `suma` do *tylko jednego*
argumentu `10`. Jak Ci się uda, zobaczysz w prawym oknie komunikat:

```lean
suma 10 : Nat → Nat
```

Ten przykład może Ci się wydawać znajomy. Faktycznie, przyglądaliśmy się już tego rodzaju częściowej
aplikacji, tylko, że wtedy używaliśmy dwuargumentowej funkcji `identycznosc`, aplikując ją tylko do
jednego termu - do typu `Nat`.

**Czytamy to**: Aplikacja funkcji `suma` do termu `10` ma typ `Nat → Nat`. Typ `Nat → Nat` mówi nam,
że cała ta częściowa aplikacja (`suma 10`) jest funkcją przekształcającą liczby naturalne w liczby
naturalne. Jaka to jest funkcja? Znamy definicję stałej `suma`, więc domyślamy się, że `suma 10` to
wyrażenie, które jakby "czeka na brakujący argument". Jest to więc jednoargumentowa funkcja, która
do dowolnej liczby naturalnej dodaje `10` (dodaje `10` "od przodu", bo "robi" `10 + m`).

**Polecenie**: Sprawdź typ stałej `suma`, ale poprzedzonej znakiem `@`, żeby się przekonać, że
`suma` ma typ, w którym występują *dwie strzałki*, bo to tak naprawdę funkcja, która przekształca
dowolną liczbę naturalną w funkcję, która to funkcja z kolei przekształca dowolną liczbę naturalną w
liczbę naturalną.
