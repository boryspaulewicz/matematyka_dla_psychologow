<!-- -*- coding: utf-8 -*- -->
## O czym teraz będzie

Niebawem będziemy się przyglądać dowodowi na istnienie Boga Anzelma z Canterbury. Żeby zrobić z nim
coś ciekawego, potrzebujemy co najmniej predykatów i później relacji binarnych, a także negacji i
dużego i małego kwantyfikatora. Okaże się teraz, że duży kwantyfikator już mamy, tylko się ukrywał.

Na wszelki wypadek przypominam o notatkach, planowanych powtórkach i aktywnym podejściu do nauki, bo
inaczej sporo pary idzie w gwizdek, nie wspominając już o tym, jak *satysfakcjonujące* może być
powtórzenie z łatwością i po dłuższym czasie czegoś relatywnie skomplikowanego. I jednocześnie
podkreślam, że to tylko sugestia.

<hr>

# Duży kwantyfikator, predykaty, mały fragment *całkowicie* zmyślonego artykułu, i dowód na istnienie Boga Anzelma z Canterbury

Zaczniemy od dużego kwantyfikatora, bo z tym będzie najłatwiej.

## Duży kwantyfikator jest wbudowany w język teorii typów

Przypominam głupszą siostrę uogólnionej identyczności:

```lean
def nic_nie_robie (n : Nat) := n
```

Co robi ta funkcja? Dla każdego `n : Nat`, zwraca `n : Nat`. Jeszcze raz, ale tym razem z akcentem:
*Dla każdego* `n : Nat`, zwraca `n : Nat`. Symbol *∀*, który uzyskasz w Leanie wpisując `\forall`,
czytamy właśnie jako *dla każdego*. Po tym symbolu zawsze występuje jeszcze część oznaczająca *coś
spełniające taki a taki warunek*, na przykład `n` będące liczbą naturalną, a potem występuje zwykle
część będąca *zdaniem* (to nam się niebawem uogólni), zwykle dotyczącym tego arbitralnego czegoś, na
przykład zdanie *`n` jest liczbą parzystą*. Matematycy najczęściej używają tego symbolu pisząc
właśnie *zdania*, i robią to między innymi w takim stylu:

*∀ n ∈ ℕ, ∀ m ∈ ℕ, n + m = m + n*

gdzie [fikuśne](https://sjp.pwn.pl/sjp/fikusny;2458994.html) *ℕ* oznacza zbiór liczb
naturalnych. Jak wiesz, dla nas to to samo, co typ termu/funkcji/twierdzenia parametrycznego
`Nat.add_comm`:

```lean
-- `Nat.add_comm` to nazwa dostępnego w bibliotece Leana (parametrycznego) twierdzenia o
-- przemienności dodawania liczb naturalnych, to jest twierdzenia mówiącego, że dla każdych
-- (niekoniecznie różnych) liczb naturalnych `n` i `m`, zachodzi `n + m = m + n`. Pomijając dowód i
-- nazwę, to samo twierdzenie można równie dobrze zapisać jako `∀ n ∈ ℕ, ∀ m ∈ ℕ, n + m = m + n`.
#check Nat.add_comm -- `Nat.add_comm (n m : Nat) : n + m = m + n`
```

Gdy mamy ochotę, możemy ujawnić to podobieństwo stosując w Leanie symbol `∀`:

```lean
-- To ...
theorem przemiennosc_nat : (n : Nat) → (m : Nat) → n + m = m + n :=
    -- Ponieważ `Nat.add_comm` jest już dowodem tego twierdzenia, zamiast tworzyć kolejną wersję,
    -- korzystam z tej stałej.
    fun (n : Nat) => fun (m : Nat) => Nat.add_comm n m

-- ... jest tym samym, co to ...
theorem przemiennosc_nat' : ∀ n : Nat, ∀ m : Nat, n + m = m + n :=
    fun (n : Nat) => fun (m : Nat) => Nat.add_comm n m
```

Zwracam uwagę, że po (tutaj typowanych) zmiennych
[*związanych*](https://pl.wikipedia.org/wiki/Operator_(logika)) dużym kwantyfikatorem (tak się o tym
mówi) piszemy *przecinek*, a nie strzałkę. Dzięki temu zapis przypomina ten stosowany często w
książkach napisanych przez matematyków.

Pokażę Ci teraz, jak wygląda (nadal "leniwy", bo korzystający z dostępnego dowodu) dowód tego samego
twierdzenia skonstruowany za pomocą taktyk, a więc w trybie interaktywnym. Tym razem zapisałem
wszystkie taktyki w jednej linii i trochę je przesunąłem, żeby było widać, jakim częściom zdania te
taktyki odpowiadają (albo które z tych części "obsługują"). Jeżeli będziesz chciała użyć więcej niż
jednej taktyki w tej samej linii, będziesz musiała, tak jak zrobiłem to tutaj, oddzielić je
średnikiem.

```lean
-- `∀` to tylko alternatywny sposób zapisania λ-abstrakcji, czyli "rozpoczęcia" kodu opisującego
-- funkcję.
theorem przemiennosc_nat'' : ∀ n : N, ∀ m : N, n + m = m + n :=
 by                          intro n; intro m; exact Nat.add_comm n m
```

Ponieważ parametrami naszych funkcji/twierdzeń mogą być zmienne dowolnego typu, nie tylko typów
zdaniowych, nasz teoriotypowy odpowiednik dużego kwantyfikatora działa dla każdego typu. To znaczy,
że możemy na przykład kwantyfikować po zdaniach. Robiliśmy to już wcześniej, tylko nie
sygnalizowaliśmy tego wyraźnie za pomocą tego symbolu:

```lean
-- To ...
theorem tautologia (p : Prop) : p → p := fun (h : p) => h

-- ... jest tym samym, co to:
theorem tautologia' : ∀ p : Prop,  p → p := fun (p : Prop) => fun (h : p) => h
```

## Predykat to funkcja z dowolnego typu do typu Prop

Gdy w matematyce używamy kwantyfikatorów takich jak `∀` i `∃` ("istnieje"), robimy to, żeby
(formalnie/mechanicznie sprawdzalnie) mówić o tym, że jakieś obiekty mają jakieś własności, to jest
*spełniają* jakieś *predykaty*. Ponieważ predykat to formalny odpowiednik (arbitralnej) własności,
to pojęcie jest w matematyce bardzo ważne. Co nie znaczy, że omawiając je musimy zachować
powagę. Moim zdaniem *nic* nie musimy.

Zdanie *Kawusia była pyszna* możemy zapisać formalnie na różne sposoby, i to, który sposób
wybierzemy, będzie zależało od przyjętych celów. Możemy je na przykład zakodować jako stałą `k` o
typie `Prop`. Wtedy jedyną własnością tego zdania, którą będziemy mogli poddać analizie, będzie jego
prawdziwość lub fałszywość, powiązana być może z prawdziwością innych zdań, co dla nas w tym momencie
znaczy dowiedlność czy udowadnialność (tego zdania lub jego negacji):

Wszystko, co możemy powiedzieć o zdaniu ...

*Kawusia była pyszna*

... zakodowanym formalnie jako zdanie, ...

`k : Prop`

... poza tym, że jest *jakimś* zdaniem, to czy jest prawdziwe, czy fałszywe. Zapisane w ten sposób,
to pełne treści zdanie zostałoby więc zredukowane do formalnego *atomu* zdaniowego (a dokładniej
*zdania atomowego*).

Moglibyśmy również spróbować *zakodować strukturę* tego zdania. Wtedy nadal stosowałyby się do niego
wszystkie dostępne operacje na zdaniach, bo pozostałoby zdaniem, ale poza tym, że to wciąż byłoby
zdanie, pojawiłyby się nowe operacje, wymagające większej "rozdzielczości formalizacji", dzięki
której można "formalnie rozpoznać" strukturę podmiot-orzeczenie.

Zanim podejmiemy taką próbę, musimy zadać sobie pytanie, czy (w przyszłości) ważny będzie dla nas
czas przeszły, bo ta kawusia przecież *była* pyszna. Jeżeli przyjmiemy, że nie, to pozostanie nam
rozbicie zdania na *dwie* części, podmiot *Kawusia* i orzeczenie *była pyszna*, bo co innego możemy
zrobić, poza ewentualną próbą uchwycenia jakiejś własności czasu przeszłego? Formalizować operację
zdrabniania?

*Kawusia* to pewna *rzecz*, a *była pyszna* to własność przypisywana tej rzeczy przez (niekoniecznie
prawdziwe) zdanie *Kawusia była pyszna*. To zdanie ma *sens*, bo jest poprawne, a jest poprawne, bo
kawa to napój i posługujemy się konwencją językową, zgodnie z którą własność bycia pysznym może
przysługiwać albo nie między innymi napojom. W tle tego zdania istnieje więc typ *napój*, który
ujawnimy w formalizacji. Ponieważ w teorii typów każdy term musi mieć typ, to jeśli chcemy mówić o
ewentualnej pyszności kawy *jako napoju* posługując się językiem tej teorii, musimy najpierw
wprowadzić odpowiedni *aksjomat*, czyli arbitralną konwencję językową:

```lean
axiom Napoj : Type
```

Odtąd w naszym formalnym języku *istnieją* (jakieś) napoje, w tym i *tylko* w tym znaczeniu, że
*możemy o nich mówić*. 

Jak teraz zapisać formalnie własność *była pyszna*? Jeżeli, ze względu na cel tej zabawy ignorując
czas przeszły, zrobimy tak, ...

```lean
-- O napojach (typ parametru) można twierdzić (a więc rezultat musi mieć typ `Prop`), niekoniecznie
-- zgodnie z prawdą, że są pyszne.
axiom Pyszna : Napoj → Prop
```

... to będziemy mogli napisać tak:

```lean
-- Kawa jest napojem (bo tak).
axiom kawa : Napoj

-- `Pyszna kawa` jest odtąd poprawnym (niekoniecznie prawdziwym) zdaniem konstruowanego języka.
#check Pyszna kawa -- `Pyszna kawa : Prop`
```

`Pyszna kawa` to odtąd poprawne zdanie. W dodatku zapisane po polsku i, ze względu na zadeklarowane
cele, wystarczająco blisko oryginału. Oczywiście nie tylko napoje mogą być pyszne, ale obecny poziom
ekspresyjności nam wystarczy.

Zastanawiasz się może, dlaczego za wyjątkiem ostatniego termu to były same aksjomaty? Żeby term
`Pyszna kawa` był zarazem poprawny i był zdaniem, czyli termem typu `Prop`, `Pyszna` musi być termem
o typie `A → Prop` dla pewnego typu `A` i term `kawa` musi mieć typ `A`. No ale przecież w języku
teorii typów nie mamy z czego zrobić kawy, a więc nie pozostaje nam nic innego jak przyjać
*konwencję*, zgodnie którą słowo `kawa` jest poprawnym wyrażeniem naszego języka. A to znaczy, że
`kawa` musi mieć typ, co do którego też musimy się *umówić*, że "istnieje". Moglibyśmy przyjąć po
prostu, że `kawa : Type`, i wtedy `kawa` byłaby *typem*, co można zaakceptować, są przecież różne
kawy i są nawet różne rodzaje kaw. Jednak symbol `Pyszna` byłby wtedy predykatem dotyczącym
*dowolnych* typów (typu `Type 1`), co byłoby niezgodne z tym, jak używamy tego pojęcia posługując
się językiem naturalnym.

Wprowadzę teraz jeszcze jedną kosmetyczną zmianę, bo przyda mi się później, gdy będę mówił o
*relacjach binarnych*, które zresztą też można rozumieć jako predykaty, o ile tylko odpowiednio (i
naturalnie) uogólnimy pojęcie predykatu.

Do tej pory definiowaliśmy funkcje, które zwracały wyłącznie termy nie będące typami, ale język,
którego używamy, nie narzuca tego ograniczenia. W szczególności, możemy definiować funkcje, które
*tworzą typy*. W tym wypadku to będzie typ będący predykatem. Dzięki temu jeszcze bardziej zbliżymy
zapis formalny do zapisu w języku naturalnym (ilustracja):

```lean
-- Funkcja `Predykat` zwraca *typ* predykatu dotyczącego termów typu podanego jako
-- argument:
def Predykat (typ : Type) : Type := typ → Prop

-- Możemy teraz zapisać w sposób bardziej przypominający zapis w języku naturalnym, że `Pyszna` jest
-- predykatem dotyczącym napojów:
axiom Pyszna : Predykat Napoj

-- Ewaluacja wyrażenia po stronie typu tej aksjomatycznej stałej pozwala zobaczyć, jak działa funkcja 
-- `Predykat`. Zilustrujemy to korzystając z faktu, że komenda `#check` pozwala nam sprawdzać poprawność
-- typowania, jeśli tylko podamy to typowanie jawnie:
#check (Pyszna : Predykat Napoj)
-- Lean nie sygnalizuje błędu, a więc to jawne typowanie jest poprawne, co nas nie dziwi, bo sami tak
-- (aksjomatycznie) przed chwilą zdecydowaliśmy.

--> W ramach ewaluacji tego wyrażenia najpierw zachodzi rozpakowanie stałej `Predykat` ...
#check (Pyszna : (fun (typ : Type) => typ → Prop) Napoj)       -- Lean nie sygnalizuje błędu

--> ... a następnie odczepienie ciała i podstawienie pod zmienną, które w tym wypadku kończy proces
-- redukcji.
#check (Pyszna : Napoj → Prop)                                 -- Lean nie sygnalizuje błędu

-- `Pyszna kawa` jest poprawnym zdaniem, ponieważ jest aplikacją predykatu (czyli pewnej funkcji) do
-- termu o typie, którego wymaga ten predykat (ta funkcja):
#check Pyszna kawa                                             -- Pyszna kawa : Prop
```

Rozwiązania takie jak to, które zastosowałem, żeby w bardziej widoczny sposób oznaczyć w kodzie
własność bycia predykatem, a właściwie *ujawnić w sposobie pisania intencję autora* (czyli w tym
wypadku mnie), nazywamy w programowaniu [*lukrem
składniowym*](https://pl.wikipedia.org/wiki/Lukier_sk%C5%82adniowy) (albo *lukrem syntaktycznym*,
albo *cukrem składniowym*). Dobrym przykładem tego rodzaju funkcjonalności jest znana Ci możliwość
zapisywania dodawania w notacji wzrostkowej (dla Leana `1 + 2` to tylko alternatywna forma zapisu
`Nat.add 1 2`).

Lukier składniowy może i nie jest *niezbędny*, ale gdy stosujemy go z wyczuciem, może bardzo
poprawić czytelność kodu, a dzięki temu ułatwić nie tylko jego czytanie, ale również pisanie i
poprawianie, a więc też komunikację, myślenie i rozwiązywanie problemów za pomocą kodu. Gdy
modyfikacja kodu następuje po dostarczeniu go jako produktu do odbiorcy, nazywamy to *pielęgnacją*
albo [*konserwacją*](https://pl.wikipedia.org/wiki/Konserwacja_oprogramowania), tak jakby
oprogramowanie było żywe. I w jakimś sensie jest, dzięki nam.

**Definicja predykatu**: *Predykatem* jest każda *funkcja z jakiegoś typu do typu zdań*. Mówimy
wtedy, że predykat `P : A → Prop`, gdzie `A` to jakiś typ, *dotyczy* termów typu `A`, a gdy dla
jakiegoś termu `x : A` zdanie `P x` jest prawdziwe, czyli w naszej interpretacji gdy istnieje
term/dowód `h : P x`, mówimy, że (term) `x` *spełnia* predykat `P`.

## Pierwsza próba formalizacji dowodu na istnienie Boga Anzelma z Cantenbury

Próbując sformalizować rozumowanie ukryte w tekście zapisanym w języku naturalnym również warto
zacząć od czegoś przypominającego typowanie. Mam na myśli podział fragmentów tekstu na kategorie
określające *role*, jakie te fragmenty odgrywają w *uzasadnieniu wniosków*. Dzięki takiej
kategoryzacji (będącej nieformalnym typowaniem) zwykle szybko odkrywamy, że większość fragmentów, na
przykład niemal wszystko, co autorzy artykułu empirycznego napisali we wprowadzeniu i dyskusji
wyników, możemy spokojnie *zignorować*, bo zdecydowana większość zdań, które znajdziemy w typowych
artykułach empirycznych, albo nie odgrywa *żadnej* roli w uzasadnieniu głównych wniosków, albo
odgrywa rolę *trywialną*.

Nie ma w tym nic dziwnego, bo znaczące odkrycia w nauce są *rzadkie*, aktywnych "naukowców" jest
bardzo wielu, a żeby utrzymać pracę Ci wszyscy "naukowcy" muszą stale publikować. Dlatego publikacje
recenzowane muszą być w zdecydowanej większości pełne (zebranych za publiczne pieniądze) śmieci
przedstawianych jakby to były jakieś skarby. Wstępna selekcja i nieformalne typowanie fragmentów
tekstu ułatwia skupienie się na tym, co ważne, i jest formą *obrony przed perswazją*.

Zwracam uwagę, że użyłem słowa ["ukryte"](https://en.wikipedia.org/wiki/Cach%C3%A9_(film)), a nie na
przykład "wyrażone", albo "zawarte". To dlatego, że tekst zapisany w języku naturalnym zwykle w
znacznie większym stopniu niż teksty zapisane formalnie wymaga *interpretacji*, która z kolei wymaga
korzystania z wiedzy i hipotez na temat autorów i kontekstu, w którym powstał dany tekst. To
delikatny, wymagający wyczucia proces, który z zasady nie może dać gwarancji, że w skończonym czasie
wypracujemy formalizację w nietrywialnym znaczeniu dobrą.

Spośród wielu form, jakie mogą przybierać [argumenty](https://pl.wikipedia.org/wiki/Argumentacja)
albo środki [retoryczne](https://pl.wikipedia.org/wiki/Retoryka), najbardziej, poza samym
*wnioskiem*, będą nas teraz interesować *przesłanki*, *kroki*[^1] (pośrednie) i *definicje*. Zwracam
jednak jeszcze raz uwagę, że [argumentacja wyrażona w języku naturalnym może przybierać bardzo różne
formy](https://www.universitas.com.pl/pl/ksiazki/2359-sposoby-uzycia-argumentow.html) i często jej
sens nie daje się łatwo czy w oczywisty sposób uchwycić za pomocą formalnego języka logiki, którym
się tutaj posługujemy. W szczególności, zwykle kluczową rolę będą w takiej argumentacji odgrywały
*racje* (ang. [reasons](https://en.wikipedia.org/wiki/Reason_(argument)[^3])) *za* i *przeciw*
pewnym sądom lub postawom, które - z mniej lub bardziej tajemniczych powodów - akceptujemy z powodu
ich *treści*, a nie z powodu *formalnej*, to jest czysto logicznej struktury.

W tym wyrwanym z kontekstu (a tak naprawdę przeze mnie wymyślonym) zdaniu, które - posługując się
wprowadzonym właśnie, ubogim słownikiem dotyczącym struktury argumentów - możemy nazwać zarówno
przesłanką, krokiem, lub wnioskiem, zależnie od tego, co nas akurat interesuje ...

> Efekt Stroopa był istotnie mniejszy u osób z niższym poziomem ekstrawersji.

... widzimy trzy [*terminy techniczne*](https://en.wikipedia.org/wiki/Technical_definition): [*efekt
Stroopa*](https://pl.wikipedia.org/wiki/Efekt_Stroopa), [*istotność
statyczną*](https://pl.wikipedia.org/wiki/Poziom_istotno%C5%9Bci) i (określony w być może celowo
mylący sposób) **wynik** *w [teście
ekstrawersji](https://pl.wikipedia.org/wiki/Wielka_pi%C4%85tka)*. Możemy się spodziewać, że
[*operacyjne*](https://en.wikipedia.org/wiki/Operational_definition) definicje efektu Stroopa i
(obserwowanego \{rzekomego\}) poziomu ekstrawersji są podane w tym samym artykule. Natomiast pojęcie
istotności statystycznej, jako docelowi odbiorcy tego typu tekstu, powinniśmy znać. 

Jeżeli teraz następne zdanie w tej hipotetycznej dyskusji wyników to ...

> To może oznaczać, że introwersja zwiększa skuteczność selekcji uwagowej.

... to możemy je zaklasyfikować jako *wniosek*, który ma (rzekomo) *wynikać* (niekoniecznie
formalnie!) z poprzedniego zdania jako jednej z *przesłanek* (liczba mnoga).

Mamy tu do czynienia z częstym w artykułach
["naukowych"](https://pl.wikipedia.org/wiki/Kulty_cargo) pisanych przez
psychologów:

1. *Pominięciem kroków* uznanych być może za względnie oczywiste lub niekontrowersyjne.

2. *Niejawnym* zastąpieniem terminów
[*operacyjnych*](https://pl.wikipedia.org/wiki/Operacjonalizacja), to jest takich, które dotyczącą
na przykład sposobów dokonywania pomiarów (tutaj wynik w teście), lub faktycznie zastosowanych
interwencji, przez ich *teoretyczne interpretacje* (tutaj poziom rzekomo mierzonej zmiennej, to jest
nie dający się bezpośrednio obserwować poziom ekstrawersji/introwersji *jako takiej*).

3. Wprowadzeniem *nieuzasadnionej* [*interpretacji
przyczynowej*](https://pl.wikipedia.org/wiki/Wnioskowanie_przyczynowe) (*zwiększa*), i z ...

4. ... *asekuracyjnym* sformułowaniem *może oznaczać*, które - gdyby odczytać je dosłownie -
sugerowałoby, że całe to zdanie *nic* nie znaczy, bo przecież wszystko *może* oznaczać cokolwiek
tylko zechcemy, zależnie od kontekstu i naszych decyzji językowych.

Wiemy również z góry, bo takie wady mają niemal wszystkie artykuły
["naukowe"](https://pl.wikipedia.org/wiki/Kulty_cargo) pisane przez psychologów,
że:

5. Zabraknie jawnej analizy ograniczeń wynikających z [*obciążenia
próby*](https://pl.wikipedia.org/wiki/Obci%C4%85%C5%BCenie_pr%C3%B3by).

6. Wnioski będą sformułowane zdecydowanie zbyt ogólnienie i za mocno, ...

7. ... przypuszczalnie z powodu braku zrozumienia różnicy między (nieistniejącą)
"reprezentatywnością próby" i [*reprezentatywnością* **procesu** *pobierania
próby*](https://pl.wikipedia.org/wiki/Dob%C3%B3r_pr%C3%B3by), a także dlatego, że ...

8. ... gdyby autorzy poważnie podeszli do kwestii braku wiedzy na temat [*przyczynowych*
różnic](https://en.wikipedia.org/wiki/External_validity) między sytuacją odpowiadającą badaniu a
bliżej nieokreślonym, ale ewidentnie szerokim zakresem sytuacji, o których wyniki tego badania mają
rzekomo coś mówić, to - poprawnie uzasadnione - wnioski brzmiałyby tak trywialnie, że najpewniej nie
byłoby szans na publikację w tak zwanym czasopiśmie wysokopunktowanym.

To, że na przykład interpretacja przyczynowa *nie może* być w tym wypadku uzasadniona, możemy
ustalić natychmiast, nie czytając reszty tego hipotetycznego artykułu, ponieważ niemal niezależnie
od przyjętych definicji terminów *efekt Stroopa* i *ekstrawersja*, z góry wiadomo, że z powodów
technicznych i etycznych ekstrawersja nie była w tym badaniu pod bezpośrednim wpływem zewnętrznej
interwencji. A wobec tego istnieje wiele, być może bliżej nieokreślonych, za to z pewnością nie
występujących w danych, odgrywających potencjalnie niepomijalną rolę [*wspólnych
przyczyn*](https://en.wikipedia.org/wiki/Confounding) tych dwóch zmiennych (zakładając, że
ekstrawersja rozumiana tak, jak rozumieją ją autorzy, w ogóle istnieje).

Jeżeli nabrałaś ochoty, żeby lepiej opanować sztukę przeprowadzania tego rodzaju analiz, to
zapewniam, że elementy logiki, które poznasz w tym i w następnych rozdziałach, będą się do tego
świetnie nadawać. Tym razem jednak zajmiemy się przykładem rozumowania, które możemy poddać analizie
bez wprowadzania pojęć z obszaru metodologii badań, bo na to jest jeszcze za wcześnie.

Z polskiej [strony Wikipedii](https://pl.wikipedia.org/wiki/Dow%C3%B3d_ontologiczny) poświęconej
dowodowi na istnienie Boga autorstwa Anzelma z Cantenbury dowiadujemy się (2024-12-08), że:

> sprowadza się on do pokazania, że w samym pojęciu Boga zawiera się konieczność jego istnienia.

Nie jest to co prawda ani przesłanka, ani definicja, ani krok czy wniosek, ale ta jedna uwaga, o ile
jest trafna, mówi nam już wiele. Jeżeli faktycznie rzekomy dowód Anzelma na tym właśnie polega, to
wydaje się, że możemy w tym momencie zakończyć badanie, ponieważ uzasadnienie tezy o istnieniu
desygnatu odgrywającej tutaj rolę terminu technicznego stałej `Bóg` w oparciu o samą definicję tej
stałej pozwala "uzasadnić" wniosek o istnieniu każdego możliwego "bytu", na przykład jednorożców
albo wróżek, z tego prostego powodu, że definicje pojęć czy stałych są *wyborami*.

Z drugiej jednak strony, w zacytowanym zdaniu nie pojawia się słowo "definicja", tylko słowo
"pojęcie". W tym pojęciu coś ma się *zawierać*, w dodatku *z konieczności*, co nie to musi być tym
samym co bycie elementem rozwinięcia definicji. Odkładamy tą wątpliwość na później i czytamy dalej.

> Przed przeprowadzeniem dowodu we własnym zakresie Anzelm zaleca specyficzne przygotowanie
> duchowe. Należy odrzucić niepokoje i odłożyć na później swoje codzienne troski. Następnie „wejść
> do izdebki” własnego umysłu i wyrzucić z niego wszystko oprócz Boga i tego, co wspomaga w jego
> poszukiwaniu.

Kontynuując nieformalne typowanie zauważamy, że mamy tutaj do czynienia z *radą*, a to też ciekawy
typ, jakby blisko [*normy*](https://en.wikipedia.org/wiki/Normativity), ale jednak coś innego. Zwróć
uwagę, jak czasem sam akt wstępnego typowania fragmentów tekstu napisanego w języku naturalnym
(tutaj samo rozpoznanie, że mamy do czynienia z ogólnym typem rada) może działać jak odsłonięcie
rano zasłon. Sformułowanie rady *zakłada* pewien *cel*, a ponieważ naszym (deklarowanym) celem nie
jest w tym momencie przekonanie za wszelką cenę samych siebie o prawdziwości wniosku, ten fragment
również możemy pominąć, tym bardziej, że "wyrzucanie" czegokolwiek z "izdebki umysłu" niekoniecznie
nam pomoże w poprawnej ocenie sytuacji. Chociaż kto wie, może to zależy od charakteru problemu
teoretycznego. Co dalej?

> Wyjaśnia też swoje intencje. Zastrzega, że nie chce przeniknąć głębi Boga, ponieważ wtedy
> popełniałby grzech pychy. Chce tylko do pewnego stopnia zrozumieć prawdę, w którą wierzy. Nie
> stara się bowiem zrozumieć, aby wierzyć, ale wierzy, by zrozumieć. A i w to wierzy, że jeśli nie
> uwierzy, to nie zrozumie.

Tutaj z kolei mamy deklaracje na temat nieobserwowalnego stanu, a dokładnie intencji, przekonań i
postaw Anzelma. Dla nas to tylko deklaracje, bo też nie możemy ich w żaden sposób sprawdzić, skoro
ani nie możemy się cofnąć w czasie, ani wcielić w Anzelma. Zresztą, nawet, gdyby to było możliwe,
nadal byłyby to tylko *hipotezy empiryczne* lub *interpretacje*, bo ludzie nie mają niezawodnego
dostępu do własnych "prawdziwych" czy "rzeczywistych" postaw i przekonań. Dlatego z *naszej*
perspektywy, czy raczej z perspektywy *autora analizy, w którego się wcielamy*, te stwierdzenia
muszą pełnić rolę *aksjomatów*. Widzimy też od razu, że nie mogą raczej pełnić ważnej roli w badanym
rozumowaniu, a więc ten fragment również możemy, przynajmniej na razie, pominąć.

Pierwsze zdanie w zakładce *Przesłanka* to:

> Głupi mówi, nie ma Boga. 

W tym momencie, jeżeli tylko mamy ochotę (a ja akurat mam), możemy zacząć formalizację, ponieważ nie
jest jeszcze całkiem jasne, czy ten zabieg retoryczny, a konkretnie pewnego rodzaju
[*perswazja*](https://pl.wikipedia.org/wiki/Perswazja), nie odegra później jakiejś ważnej
roli. Najważniejsze, co musimy wiedzieć o perswazji, to że polega na użyciu *siły*, a nie
(jakiejkolwiek) *logiki*. Określenie *głupi* jest przecież *obraźliwe*, a więc czytając to zdanie
*czujemy* pewne emocje, które mogą znacząco wpływać na nasz tok rozumowania, i często właśnie o tego
rodzaju *manipulację* chodzi w takich zabiegach. I dlatego też warto nauczyć się szybko to zauważać.

```lean
axiom Bog : Type

axiom Czlowiek : Type

-- Mam nadzieję, że widzisz tu korzyści wynikające z syntaktycznego lukrowania.
axiom Glupi : Predykat Człowiek

axiom Niewierzacy : Predykat Człowiek
```

Pozwoliłem sobie na niewątpliwie ryzykowne *uproszczenie*, polegające na *wyborze* pewnej
*interpretacji*. Założyłem (wcześniej *niejawnie*, ale teraz to zmieniam), że *mówić*, że nie ma
Boga, znaczyło w tym kontekście dla Anzelma to samo, co *nie wierzyć* w Boga.

Widzimy dzięki temu znowu, że formalizacja rozumowań zapisanych w języku naturalnym wymaga
(tymczasowego) akceptowania *hipotez empirycznych* na temat (niekoniecznie świadomych albo
unikalnych!) intencji autora. Ponieważ takie rzeczy możemy tylko lepiej lub gorzej *zgadywać*,
wypada nam przyjąć zasadę *życzliwej interpretacji*. Zgodnie z tą zasadą, powinniśmy próbować
zidentyfikować *wszystkie* takie interpretacje wypowiedzi autora, które są *spójne* z dostępną
*wiedzą zastaną* (głównie na temat autora) i z *całością tekstu*, skupiając się przy tym na tych
interpretacjach, które zdają się dawać autorowi *największe szanse powodzenia* w uzasadnianiu
wniosku.

Możemy to robić albo, żeby próbować ostatecznie zmiażdżyć argumentację autora, wykazując, że
argumentacja nie działa mimo tego, że próbowaliśmy ją na wszystkie akceptowalne sposoby uratować,
albo można to robić, żeby jak najlepiej zrozumieć, *co przemawia*, albo *mogłoby* przemawiać przez
badany tekst. Jak kto woli. Mnie na przykład kiedyś pociągała raczej pierwsza perspektywa, ale na
starość zaczęło mnie to nudzić i teraz ciekawsza i bardziej, hm, satysfakcjonująca, wydaje mi się ta
druga.

Wracając do zdania o głupich, czyli między innymi o mnie, wydaje się, że to zdanie kryje w sobie
*implikację*, a jeżeli tak, to pozostaje tylko ustalić, w którym kierunku. W pierwszej chwili
mogłoby się wydawać, że chodzi o coś takiego:

```lean
axiom mocna_teza : Glupi → Niewierzacy
```

Ale nie jest wcale jasne, czy Anzelm zgodziłby się na zastosowanie tutaj dużego kwantyfikatora, a
taki tu niejawnie występuje, bo, zgodnie z mechaniką działania teorii typów, aksjomat `mocna_teza`
odczytujemy jako *Dla każdego człowieka C, jeżeli C jest głupi, to C jest niewierzący*. Na potrzeby
dalszych rozważań przyjmiemy jednak, że taka "uniwersalistyczna" interpretacja jest w tym wypadku
akceptowalna. Gdyby miało się później okazać, że to zmniejsza w jakiś sposób szanse Anzelma, zawsze
możemy się z tego wycofać i spróbować zakodować to zdanie inaczej.

Przyjęcie aksjomatu `mocna_teza` w jego obecnej postaci wyklucza jednak istnienie ludzi zarazem
*głupich* i *wierzących*, z czym Anzelm by się zapewne nie zgodził, a więc jeśli to ma być zwykła
implikacja, to chodzi raczej o to:

```lean
axiom mocna_teza' : Niewierzacy → Glupi
```

Stosujemy tutaj kryterium ogólnie rozumianej spójności z wiedzą zastaną, przy okazji odkrywając, że
gdybym miał okazję spotkać się z Anzelmem, być może nie zrobiłbym na nim dobrego wrażenia. Mimo, że
wydaje się błędna, nie ma powodu, żeby usuwać poprzednią interpretację, choćby dlatego, że nie mamy
jeszcze pewności, czy jest faktycznie błędna, a poza tym ta pierwsza interpretacja jest
pełnowartościowym fragmentem *dokumentacji* pozwalającej zobaczyć, jakie interpretacje wzięliśmy pod
uwagę. Swoją drogą, druga formalizacja jest mniej problematyczna niż pierwsza, ale też wygląda
podejrzanie, bo wynika z niej, że każdy niegłupi jest wierzący. Co dalej?

> Ale nawet ten, co tak mówi, musi rozumieć o co chodzi, gdy ktoś mówi: „coś, ponad co nic większego
> nie może być pomyślane”. Nawet ten głupi rozumie to, co słyszy, a to co rozumie, znajduje się w
> jego intelekcie.

W mojej *subiektywnej ocenie*, a właściwie po prostu w mojej ocenie, bo nie ma innych ocen (ani tak
naprawdę "moich", ale o tym kiedy indziej), mamy tutaj do czynienia z
[*bełkotem*](https://sjp.pwn.pl/sjp/;2443481), co może świadczyć albo o tym, że Anzelm nieco zbyt
gorliwie wysprzątał tą swoją izdebkę, albo o tym, że to ja nie rozumiem czegoś na jakimś bardzo
podstawowym poziomie.

Wypowiedzi zbliżone do bełkotu mogą co prawda skrywać jakieś sensowne albo ważne ze względu na
wniosek treści, ale musimy zdecydować, jak szczegółowo i wyczerpująco będziemy badać wypowiedzi
autora i każda taka decyzja musi być ostatecznie oparta na naszej *ocenie* (że pewne rozwiązanie
jest *wystarczająco dobre*). Na przykład, klasyfikację zacytowanego tutaj fragmentu jako bełkotu
przedstawiłem bez uzasadnienia, a więc to nie tylko *ocena*, ale to również *tylko* ocena, a więc z
*Twojej* perspektywy to *zaproponowany* przeze mnie *aksjomat*. Zrobiłem tak, ponieważ jestem
(również subiektywnie) przekonany, że prawdopodobnie podzielasz moje zdanie. I właśnie do tego, jak
mi się zdaje, to jest do jawnego lub niejawnego *zawężenia kręgu odbiorców*, sprowadza się często
rola tego rodzaju decyzji komunikacyjnych.

Jeżeli poczułaś się urażona tym mocnym, negatywnym określeniem, to zapewniam Cię, że gdybym się o
tym dowiedział, byłoby mi z tego powodu przykro, ale mimo to napisałem to, co napisałem, ponieważ
uważam, że *powinnaś znać moją postawę*. Chcę być jednocześnie wobec Ciebie i siebie *uczciwy*, a to
wymaga czasem wypowiedzenia wprost czegoś, co dla drugiej strony może być trudne nawet tylko do
przeczytania albo wysłuchania. Przekonasz się zresztą w jednym z późniejszych rozdziałów, że moja
postawa wobec Anzelma, jego dowodu na istnienie Boga, i w ogóle ludzi wierzących i praktyk, które
wierzący stosują, nie jest ani szczególnie radykalna, ani prosta.

Następna zakładka nosi szumną nazwę *Wyprowadzenie dowodu*.

1. Niech "coś, ponad co nic większego nie można pomyśleć" będzie określeniem Boga, które mniej lub
   bardziej rozumieją wszyscy ludzie.

2. Załóżmy teraz, że przedmiot tego określenia istnieje jedynie w umyśle jako idea (przedstawienie).

3. Jednak istnienie w rzeczywistości jest czymś większym, aniżeli istnienie w samym tylko umyśle.

4. Zatem na podstawie dokonanego rozróżnienia (3) oraz założenia (2) możemy pomyśleć o czymś jeszcze
   większym, aniżeli "coś, ponad co nic innego nie możemy pomyśleć".

5. Wniosek (4) wypowiada sprzeczność: wszak nie można pomyśleć niczego większego od "czegoś, ponad
   co nic większego nie możemy pomyśleć". Zatem "coś ponad co nic większego nie można pomyśleć" –
   wbrew założeniu (2) istnieje nie tylko w umyśle, lecz także w rzeczywistości.

Nietrudno rozpoznać, że:

1. Punkt 1 zawiera *definicję*.

2. Punkt 2 to *założenie* [*dowodu nie
wprost*](https://pl.wikipedia.org/wiki/Dow%C3%B3d_nie_wprost).

3. Punkt 3 to *aksjomat* dotyczący relacji między dwoma być może[^2] *predykatami* - *istnieje w
rzeczywistości* i *istnieje w samym umyśle* - i dosyć w tym kontekście tajemniczą relacją binarną
*większe niż*, wreszcie ...

4. ... punkty 4 i 5 zawierają skrótową charakterystykę jakiś *logicznych operacji*, które mają
rzekomo prowadzić do *sprzeczności*, a dzięki temu, za pomocą zasady podwójnej negacji, do wniosku o
istnieniu Boga.

Wydaje się więc, że Anzelm próbował tutaj (być może o tym nie wiedząc) skorzystać z logiki
*klasycznej*.

Punkty 4 i 5 możemy potraktować jako niezobowiązujące *wskazówki*, bo gdy już będziemy w dalszej
części książki dysponować pozostałymi potrzebnymi do tego celu narzędziami - za wyjątkiem
[*spójników modalnych*](https://pl.wikipedia.org/wiki/Logika_modalna), które być może mogłyby się tu
do czegoś przydać - to jest *relacjami*, *negacją*, *kwantyfikatorem egzystencjalnym* i *zasadą
wyłączonego środka* (równoważną zasadzie podwójnej negacji), wtedy sami ocenimy, jak to wszystko
działa. Wszak właśnie na tym, to jest na ocenie poprawności opartej na *subiektywnej interpretacji
wytworu* w postaci tego tekstu *jako rezultatu pewnego zachowania*, a więc jako mniej lub bardziej
udanego *rozwiązania pewnego zadania* (tutaj zadania udowodnienia czegoś), polega nasze *deklarowane
działanie* (czyli "nasze zachowanie").

Czy widzisz, jak ostrożne, wstępne i nieformalne typowanie fragmentów badanego tekstu może sprawić,
że dalsza analiza rozumowania zapisanego w języku naturalnym przebiega znacznie sprawniej? Ta
"koncentrująca energię myślenia" rola typowania pojawi się wyraźnie również później, gdy zaczniemy
wprowadzać język teorii kategorii.

### Przypisy

[^1]: Słowo *krok* (w rozumowaniu lub argumentacji) nie jest, o ile mi wiadomo, terminem technicznym
    w przyjętym tutaj przeze mnie rozumieniu. Wprowadziłem je jako termin quasi-techniczny, ponieważ
    potocznie mówi się między innymi o krokach rozumowania czy argumentacji, jak również dlatego, że
    od pewnego momentu będziemy dużo mówić o abstrakcyjnie rozumianym *chodzeniu*.

[^2]: Wydaje się, że słowo *istnieje* wypadałoby tutaj zakodować za pomocą [*kwantyfikatora
    egzystencjalnego*](https://pl.wikipedia.org/wiki/Kwantyfikator_egzystencjalny), a *sposoby
    istnienia* (tutaj *realny* i *w umyśle*) aż się proszą, żeby poszperać w [*logikach
    modalnych*](https://pl.wikipedia.org/wiki/Logika_modalna). Dla uproszczenia zdecydowałem się
    jednak mówić w tym rozdziale o predykatach, bo to pojęcie już znasz.

[^3]: Warto zauważyć, że w tym długim na kilka stron artykule Wikipedii dotyczącym hasła "reason"
    nie pojawia się słowo "logic".
