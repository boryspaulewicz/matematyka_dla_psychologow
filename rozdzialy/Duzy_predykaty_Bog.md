## O czym teraz będzie

Niebawem będziemy się przyglądać dowodowi na istnienie Boga Anzelma z Canterbury. Żeby zrobić z nim
coś ciekawego, potrzebujemy co najmniej predykatów i później relacji binarnych, a także negacji i
dużego i małego kwantyfikatora. Okaże się teraz, że duży kwantyfikator już mamy, tylko się dotąd
ukrywał.

Na wszelki wypadek przypominam o notatkach, planowanych powtórkach i aktywnym podejściu do nauki, bo
inaczej sporo pary idzie w gwizdek. I jednocześnie podkreślam, że to tylko sugestia.

<hr>

# Duży kwantyfikator, predykaty, mały fragment *całkowicie* zmyślonego artykułu i dowód na istnienie Boga Anzelma z Canterbury

Zaczniemy od dużego kwantyfikatora, bo z tym będzie najłatwiej.

## Duży kwantyfikator jest wbudowany w język teorii typów

Przypominam głupszą siostrę uogólnionej identyczności:

```lean
def nic_nie_robie (n : Nat) := n
```

Co robi ta funkcja? Dla każdego `n : Nat` zwraca `n : Nat`. Jeszcze raz, ale tym razem z akcentem:
*Dla każdego* `n : Nat` zwraca `n : Nat`. Symbol *∀*, który uzyskasz w Leanie wpisując `\forall`,
czytamy właśnie jako *dla każdego*. Po tym symbolu zawsze występuje jeszcze część oznaczająca *coś
spełniające taki a taki warunek*, na przykład `n` będące liczbą naturalną, a potem część będąca
*zdaniem*, zwykle dotyczącym tego arbitralnego czegoś, na przykład zdanie *`n` jest liczbą
parzystą*. Matematycy najczęściej używają tego symbolu pisząc zdania w takim stylu: ...

*∀ n ∈ ℕ, ∀ m ∈ ℕ, n + m = m + n*

... gdzie [fikuśne](https://sjp.pwn.pl/sjp/fikusny;2458994.html) *ℕ* oznacza zbiór liczb
naturalnych. Jak wiesz, dla nas to jest to samo, co `Nat.add_comm`:

```lean
#check Nat.add_comm -- Nat.add_comm (n m : Nat) : n + m = m + n
```

Gdy mamy akurat na to ochotę, możemy ujawnić to podobieństwo w Leanie stosując symbol `∀`:

```lean
-- To ...
theorem przemiennosc_nat : (n : Nat) → (m : Nat) → n + m = m + n :=
    -- Ponieważ Nat.add_comm jest już dowodem tego twierdzenia, zamiast tworzyć tu kolejną wersję, korzystam
    -- z tej stałej.
    fun (n : Nat) => fun (m : Nat) => Nat.add_comm n m

-- ... jest tym samym, co to ...
theorem przemiennosc_nat' : ∀ n : Nat, ∀ m : Nat, n + m = m + n :=
    fun (n : Nat) => fun (m : Nat) => Nat.add_comm n m
```

Zwracam uwagę, że po (tutaj typowanych) zmiennych
[*związanych*](https://pl.wikipedia.org/wiki/Operator_(logika)) dużym kwantyfikatorem (tak się o tym
mówi) piszemy *przecinek*, a nie strzałkę. Dzięki temu zapis przypomina coś, co można by znaleźć w
typowych książkach napisanych przez matematyków.

Pokażę Ci teraz, jak wygląda dowód tego samego twierdzenia skonstruowany za pomocą taktyk, a więc w
trybie interaktywnym. Tym razem zapisałem wszystkie taktyki w jednej linii i trochę je przesunąłem,
żeby było widać, jakim częściom zdania (specyfikacji) te taktyki odpowiadają (albo które z tych
części "obsługują"). Jeżeli będziesz chciała użyć więcej niż jednej taktyki w tej samej linii,
będziesz musiała, tak jak zrobiłem to tutaj, oddzielić je średnikiem.

```lean
-- ∀ to tylko alternatywny sposób zapisania λ-abstrakcji, czyli "rozpoczęcia" kodu opisującego funkcję.
theorem przemiennosc_nat'' : ∀ n : N, ∀ m : N, n + m = m + n :=
 by                          intro n; intro m; exact Nat.add_comm n m
```

Ponieważ parametrami naszych funkcji / twierdzeń mogą być zmienne dowolnego typu, w tym również
typów zdaniowych, nasz odpowiednik dużego kwantyfikatora działa dla każdego typu. To znaczy, że
możemy na przykład kwantyfikować po zdaniach. Robiliśmy to już wcześniej, tylko nie sygnalizowaliśmy
tego wyraźnie za pomocą tego symbolu:

```lean
-- To ...
theorem tautologia (p : Prop) : p → p := fun (h : p) => h

-- ... jest tym samym, co to:
theorem tautologia' : ∀ p : Prop,  p → p := fun (p : Prop) => fun (h : p) => h
```

## Predykat to funkcja z dowolnego typu do typu Prop

Zdanie *Kawusia była pyszna* możemy zapisać formalnie na różne sposoby i to, który sposób
wybierzemy, będzie zależało od przyjętych celów. Możemy je na przykład zakodować jako stałą `k` o
typie `Prop`. Wtedy jedyną własnością tego zdania, którą będziemy mogli poddać analizie, będzie jego
prawdziwość lub fałszywość, powiązana być może z prawdziwością innych zdań, co dla nas w tym momencie
znaczy dowiedlność czy udowadnialność (tego zdania lub jego negacji).

Moglibyśmy jednak spróbować zakodować również *strukturę* tego zdania. Wtedy nadal stosowałyby się
do niego wszystkie dostępne operacje na zdaniach, bo pozostałoby zdaniem, ale poza tym, że to wciąż
byłoby zdanie, pojawiłyby się również nowe operacje, wymagające większej "rozdzielczości
formalizacji" języka naturalnego, dzięki której można "formalnie rozpoznać" strukturę
podmiot-orzeczenie.

Zanim podejmiemy próbę tego rodzaju formalizacji, musimy zadać sobie pytanie, czy (w przyszłości)
ważny będzie dla nas czas przeszły, bo ta kawusia przecież *była* pyszna. Jeżeli przyjmiemy, że nie,
to naturalne będzie rozbicie zdania na *dwie* części, podmiot *Kawusia* i orzeczenie *była pyszna*,
bo co innego możemy z nim zrobić, poza ewentualną próbą uchwycenia jakiejś własności czasu
przeszłego?  Formalizować operację zdrabniania?  Brzmi kusząco, ale nie tym razem.

*Kawusia* to pewna *rzecz*, a *była pyszna* to własność przypisywana tej rzeczy przez zdanie
*Kawusia była pyszna*. To zdanie ma sens, bo kawa to napój, a własność bycia pysznym może
przysługiwać albo nie między innymi napojom. W tle tego zdania istnieje więc typ *napój*, który
ujawnimy w formalizacji. Ponieważ w teorii typów każdy term musi mieć typ, to jeśli chcemy mówić o
ewentualnej pyszności kawy jako napoju posługując się językiem tej teorii, musimy najpierw
wprowadzić aksjomat:

```lean
axiom Napoj : Type
```

Odtąd w naszym języku są (jakieś) napoje, *dokładnie* w tym znaczeniu, że *możemy o nich mówić*. Jak
teraz zapisać formalnie predykat *była pyszna*?  Jeżeli, ze względu na cel tej zabawy ignorując czas
przeszły, zrobimy tak ...

```lean
-- O napojach (typ parametru) można twierdzić (a więc rezultat musi mieć typ Prop), że są pyszne.
axiom Pyszna : Napoj → Prop
```

... to będziemy mogli napisać tak:

```lean
-- Kawa jest napojem.
axiom kawa : Napoj

-- Pyszna kawa jest odtąd poprawnym zdaniem konstruowanego języka.
#check Pyszna kawa -- Pyszna kawa : Prop
```

W konstruowanym właśnie języku `Pyszna kawa` to odtąd poprawne zdanie. W dodatku zapisane po polsku
i - ze względu na przyjęte cele - wystarczająco blisko oryginału. Oczywiście nie tylko napoje mogą
być pyszne, ale obecny poziom ekspresyjności nam wystarczy. Wprowadzę teraz jeszcze jedną
kosmetyczną zmianę, bo przyda mi się później, gdy będę mówił o bardziej skomplikowanych składniowo
*relacjach binarnych*.

Do tej pory definiowaliśmy funkcje, które zwracały wyłącznie termy nie będące typami, ale język,
którego używamy, nie narzuca wcale takiego ograniczenia. W szczególności, możemy w tym języku
zdefiniować funkcję, która *tworzy typ* będący predykatem i dzięki temu jeszcze bardziej zbliżyć
zapis formalny do zapisu w języku naturalnym (ilustracja):

```lean
-- Funkcja Predykat zwraca *typ* predykatu dotyczącego termów typu podanego jako
-- argument tej funkcji:
def Predykat (typ : Type) : Type := typ → Prop

-- Możemy teraz zapisać w sposób bardziej przypominający zapis w języku naturalnym, że Pyszna jest
-- predykatem dotyczącym napojów:
axiom Pyszna : Predykat Napoj

-- Ewaluacja wyrażenia po stronie typu tej aksjomatycznej stałej pozwala zobaczyć, jak działa funkcja 
-- Predykat (ilustracja):
#check (Pyszna : Predykat Napoj)

--> Najpierw zachodzi rozpakowanie stałej Predykat ...
#check (Pyszna : (fun (typ : Type) => typ → Prop) Napoj)       -- Lean nie sygnalizuje błędu

--> ... a następnie odczepienie ciała i podstawienie pod zmienną, które w tym wypadku kończy proces
-- redukcji.
#check (Pyszna : Napoj → Prop)                                 -- Lean nie sygnalizuje błędu

-- Pyszna kawa jest poprawnym zdaniem, ponieważ jest aplikacją predykatu (czyli pewnej funkcji) do termu
-- o typie, którego wymaga ten predykat (ta funkcja):
#check Pyszna kawa                                             -- Pyszna kawa : Prop
```

Rozwiązania takie jak to, które zastosowałem, żeby w bardziej widoczny sposób oznaczyć własność
bycia predykatem, nazywamy w programowaniu [*lukrem
składniowym*](https://pl.wikipedia.org/wiki/Lukier_sk%C5%82adniowy) (albo *lukrem syntaktycznym*
albo *cukrem składniowym*). Dobrym przykładem tego rodzaju funkcjonalności jest znana Ci już
możliwość zapisywania dodawania w notacji infiksowej (`1 + 2` to tylko alternatywna forma zapisu
`Nat.add 1 2`). Lukier składniowy nie jest konieczny, ale gdy stosujemy go z wyczuciem, może
znacząco poprawić czytelność kodu.

**Definicja predykatu**: *Predykatem* jest każda *funkcja z jakiegoś typu do typu zdań*.

## Przykładowa próba formalizacji dowodu na istnienie Boga Anzelma z Cantenbury

Próbując sformalizować rozumowanie ukryte w tekście zapisanym w języku naturalnym również warto
zacząć od czegoś przypominającego typowanie. Mam tu na myśli podział fragmentów tekstu na kategorie
określające *role*, jakie te fragmenty odgrywają w *uzasadnieniu wniosku*. Dzięki takiej
kategoryzacji zwykle szybko odkrywamy, że większość fragmentów, na przykład niemal wszystko, co
autorzy artykułu empirycznego napisali we wprowadzeniu i dyskusji wyników, możemy spokojnie
*zignorować*.

Spośród wielu form, jakie mogą przybierać [argumenty](https://pl.wikipedia.org/wiki/Argumentacja)
albo środki [retoryczne](https://pl.wikipedia.org/wiki/Retoryka), najbardziej, poza samym
*wnioskiem*, będą nas teraz interesować *przesłanki*, *kroki*[^1] (pośrednie) i *definicje*. Na
przykład, w tym wyrwanym z kontekstu (a tak naprawdę przeze mnie wymyślonym) zdaniu, które możemy
potraktować zarówno jako przesłankę, krok lub wniosek, zależnie od tego, co nas akurat interesuje
...

> Efekt Stroopa był istotnie mniejszy u osób z niższym poziomem ekstrawersji.

... widzimy trzy [*terminy techniczne*](https://en.wikipedia.org/wiki/Technical_definition): [*efekt
Stroopa*](https://pl.wikipedia.org/wiki/Efekt_Stroopa), [*istotność
statyczną*](https://pl.wikipedia.org/wiki/Poziom_istotno%C5%9Bci) i **wynik** *w [teście
ekstrawersji](https://pl.wikipedia.org/wiki/Wielka_pi%C4%85tka)*. Możemy się spodziewać, że
(operacyjne) definicje efektu Stroopa i (obserwowanego) poziomu ekstrawersji są podane w tym samym
artykule. Natomiast pojęcie istotności statystycznej, jako docelowi odbiorcy tego typu tekstu,
powinniśmy już znać. Jeżeli teraz następne zdanie w tej hipotetycznej dyskusji wyników to ...

> To może oznaczać, że introwersja zwiększa skuteczność selekcji uwagowej.

... to możemy je zaklasyfikować jako *wniosek*, który ma rzekomo *wynikać* z poprzedniego zdania
jako jednej z *przesłanek* (liczba mnoga).

Mamy tu do czynienia z częstym w artykułach
["naukowych"](https://pl.wikipedia.org/wiki/Kulty_cargo) pisanych przez
psychologów:

1. *Pominięciem kroków* uznanych być może za względnie oczywiste lub niekontrowersyjne.

2. *Niejawnym* zastąpieniem terminów
[*operacyjnych*](https://pl.wikipedia.org/wiki/Operacjonalizacja), to jest takich, które dotyczącą
sposobów dokonywania pomiarów lub faktycznie zastosowanych interwencji, przez ich *teoretyczne
interpretacje*.

3. Wprowadzoniem nieuzasadnionej [*interpretacji
przyczynowej*](https://pl.wikipedia.org/wiki/Wnioskowanie_przyczynowe) (*zwiększa*) i z ...

4. ... *asekuracyjnym* sformułowaniem *może oznaczać*, które - gdyby odczytać je dosłownie -
sugerowałoby, że całe to zdanie *nic* nie znaczy, bo przecież wszystko *może* oznaczać cokolwiek
tylko chcemy zależnie od kontekstu.

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
byłoby szans na publikację w wysokopunktowanym czasopiśmie.

To, że na przykład interpretacja przyczynowa *nie może* być w tym wypadku uzasadniona, możemy
ustalić natychmiast, nie czytając reszty tego hipotetycznego artykułu, ponieważ niemal niezależnie
od przyjętych definicji stałych *efekt Stroopa* i *ekstrawersja*, z góry wiadomo, że z powodów
technicznych i etycznych ekstrawersja nie była w tym badaniu pod bezpośrednim wpływem zewnętrznej
interwencji. A wobec tego istnieje wiele, być może bliżej nieokreślonych, za to z pewnością nie
występujących w danych, odgrywających potencjalnie niepomijalną rolę [*wspólnych
przyczyn*](https://en.wikipedia.org/wiki/Confounding) tych dwóch zmiennych (zakładając, że
ekstrawersja rozumiana tak, jak rozumieją ją autorzy, w ogóle istnieje).

Jeżeli nabrałaś ochoty, żeby lepiej opanować sztukę przeprowadzania tego rodzaju analiz, to
zapewniam, że elementy logiki, które poznasz w tym i w następnych rozdziałach, będą się do tego
świetnie nadawać. Tym razem zajmiemy się przykładem rozumowania, które możemy poddać analizie bez
wprowadzania pojęć z obszaru metodologii badań, bo na to jest jeszcze za wcześnie.

Z polskiej [strony Wikipedii](https://pl.wikipedia.org/wiki/Dow%C3%B3d_ontologiczny) poświęconej
"dowodowi" na istnienie Boga autorstwa Anzelma z Cantenbury dowiadujemy się (2024-12-08), że:

> sprowadza się on do pokazania, że w samym pojęciu Boga zawiera się konieczność jego istnienia.

Nie jest to co prawda ani przesłanka, ani definicja, ani krok czy wniosek, ale ta jedna uwaga, o ile
jest trafna, mówi nam już wiele. Jeżeli faktycznie rzekomy dowód Anzelma na tym właśnie polega, to
możemy w tym momencie zakończyć badanie, ponieważ uzasadnienie tezy o istnieniu desygnatu
odgrywającej tutaj rolę terminu technicznego stałej `Bóg` w oparciu o samą definicję tej stałej
pozwala "uzasadnić" wniosek o istnieniu każdego możliwego "bytu", na przykład jednorożców albo
wróżek, z tego prostego powodu, że definicje pojęć czy stałych są *wyborami*. Z czystej ciekawości
czytamy jednak dalej.

> Przed przeprowadzeniem dowodu we własnym zakresie Anzelm zaleca specyficzne przygotowanie
> duchowe. Należy odrzucić niepokoje i odłożyć na później swoje codzienne troski. Następnie „wejść
> do izdebki” własnego umysłu i wyrzucić z niego wszystko oprócz Boga i tego, co wspomaga w jego
> poszukiwaniu.

Kontynuujemy nasze nieformalne typowanie. Mamy tu do czynienia z *radą*, a to też ciekawy typ, jakby
blisko [*normy*](https://en.wikipedia.org/wiki/Normativity), ale jednak coś innego. Zwróć uwagę, jak
czasem sam akt wstępnego typowania fragmentów tekstu napisanego w języku naturalnym (tutaj samo
rozpoznanie, że mamy do czynienia z ogólnym typem rada) może działać jak odsłonięcie rano
zasłon. Sformułowanie rady *zakłada* pewien *cel*, a ponieważ naszym (deklarowanym!)  celem nie jest
w tym momencie przekonanie za wszelką cenę samych siebie o prawdziwości wniosku, ten fragment
również możemy pominąć, tym bardziej, że "wyrzucanie" czegokolwiek z "izdebki umysłu" nie pomoże nam
w ocenie sytuacji. Co dalej?

> Wyjaśnia też swoje intencje. Zastrzega, że nie cahce przeniknąć głębi Boga, ponieważ wtedy
> popełniałby grzech pychy. Chce tylko do pewnego stopnia zrozumieć prawdę, w którą wierzy. Nie
> stara się bowiem zrozumieć, aby wierzyć, ale wierzy, by zrozumieć. A i w to wierzy, że jeśli nie
> uwierzy, to nie zrozumie.

Tutaj z kolei mamy informacje na temat nieobserwowalnego stanu, a dokładnie intencji, przekonań i
postaw Anzelma, których nie możemy w żaden sposób sprawdzić, bo ani nie możemy się cofnąć w czasie
ani w Niego wcielić. Zresztą, nawet, gdyby to było możliwe, nadal byłyby to tylko *hipotezy
empiryczne*, bo ludzie nie mają niezawodnego dostępu do własnych postaw i przekonań. Dlatego z
*naszej* perspektywy, czy raczej z perspektywy *autora analizy, w którego się tutaj wcielamy*, te
stwierdzenia muszą pełnić rolę *aksjomatów*. Widzimy też od razu, że nie mogą pełnić żadnej ważnej
roli w badanym rozumowaniu, a więc ten fragment również możemy pominąć.

Pierwsze zdanie w zakładce *Przesłanka* to:

> Głupi mówi, nie ma Boga. 

W tym momencie, jeżeli tylko mamy ochotę (a ja akurat mam) możemy zacząć formalizację, ponieważ nie
jest jeszcze całkiem jasne, czy ten zabieg retoryczny, a konkretnie pewnego rodzaju
[*perswazja*](https://pl.wikipedia.org/wiki/Perswazja), to jest argument polegający na użyciu
*siły* - określenie *głupi* jest przecież *obraźliwe*, a więc czytając to zdanie *czujemy* pewne,
potencjalnie dość silne emocje, które mogą wpływać na nasz tok rozumowania - nie odegra później
jakiejś ważnej roli.

```lean
axiom Bog : Type

axiom Czlowiek : Type

-- Mam nadzieję, że widzisz już korzyści wynikające z syntaktycznego lukrowania.
axiom Glupi : Predykat Człowiek

axiom Niewierzacy : Predykat Człowiek
```

Pozwoliłem sobie tutaj na ryzykowne *uproszczenie*, polegające na *wyborze* pewnej
*interpretacji*. Założyłem (wcześniej *niejawnie*, ale teraz to zmieniam), że *mówić*, że nie ma
Boga znaczyło w tym kontekście dla Anzelma to samo, co *nie wierzyć* w Boga. 

Widzimy dzięki temu, że formalizacja rozumowań zapisanych w języku naturalnym często wymaga
formułowania *hipotez empirycznych* na temat przyjętych (niekoniecznie świadomie!) przez autora
znaczeń. Ponieważ te możemy tylko lepiej lub gorzej *zgadywać*, wypada nam przyjąć zasadę *życzliwej
interpretacji*. Zgodnie z tą zasadą, powinniśmy próbować zidentyfikować *wszystkie* takie
interpretacje wypowiedzi autora, które są *spójne* z dostępną *wiedzą zastaną* (głównie na temat
autora) i z *całością tekstu*, skupiając się przy tym na tych interpretacjach, które zdają się dawać
autorowi *największe szanse powodzenia* w uzasadnianiu wniosku.

Wracając do zdania o głupich, czyli między innymi o mnie, wydaje się, że to zdanie kryje w sobie
*implikację*, a jeżeli tak, to pozostaje tylko ustalić, w którym kierunku. W pierwszej chwili
mogłoby się wydawać, że chodzi o coś takiego:

```lean
axiom mocna_teza : Glupi → Niewierzacy
```

Ale nie jest wcale jasne, czy Anzelm zgodziłby się na zastosowanie tutaj dużego kwantyfikatora, a
taki tu przecież niejawnie występuje, bo zgodnie z mechaniką działania teorii typów aksjomat
`mocna_teza` odczytujemy jako *Dla każdego człowieka C, jeżeli C jest głupi, to C jest
niewierzący*. Na użytek dalszych rozważań przyjmiemy jednak, że taka interpretacja jest w tym
wypadku akceptowalna. Gdyby miało się później okazać, że to zmniejsza w jakiś sposób szanse Anzelma,
zawsze możemy się z tego wycofać i spróbować zrobić to inaczej.

Przyjęcie aksjomatu `mocna_teza` w jego obecnej postaci wyklucza istnienie ludzi zarazem *głupich* i
*wierzących*, z czym Anzelm by się zapewne nie zgodził, a więc jeśli to ma być implikacja, to chodzi
raczej o to:

```lean
axiom mocna_teza' : Niewierzacy → Glupi
```

Stosujemy tutaj kryterium ogólnie rozumianej spójności z wiedzą zastaną, przy okazji odkrywając, że
gdybym miał okazję spotkać się z Anzelmem, nie zrobiłbym na nim dobrego wrażenia. Mimo, że wydaje
się błędna, nie ma powodu, żeby usuwać poprzednią interpretację, choćby dlatego, że nie mamy jeszcze
pewności, czy jest faktycznie błędna, a poza tym ta pierwsza interpretacja jest pełnowartościowym
fragmentem *dokumentacji* pozwalającej zobaczyć, jakie dokładnie możliwości wzięliśmy pod uwagę. Co
dalej?

> Ale nawet ten, co tak mówi, musi rozumieć o co chodzi, gdy ktoś mówi: „coś, ponad co nic większego
> nie może być pomyślane”. Nawet ten głupi rozumie to, co słyszy, a to co rozumie, znajduje się w
> jego intelekcie.

W mojej *subiektywnej ocenie*, a właściwie po prostu w mojej ocenie, bo nie ma innych ocen (ani tak
naprawdę "moich", ale o tym kiedy indziej), mamy tutaj do czynienia z
[*bełkotem*](https://sjp.pwn.pl/sjp/;2443481), co może świadczyć o tym, że Anzelm nieco zbyt
gorliwie wysprzątał tą swoją izdebkę. Wypowiedzi zbliżone do bełkotu mogą co prawda skrywać jakieś
sensowne albo ważne ze względu na wniosek treści, ale musimy zdecydować, jak szczegółowo i
wyczerpująco będziemy badać wypowiedzi autora i każda taka decyzja musi być ostatecznie oparta na
naszej ocenie. Na przykład, klasyfikację zacytowanego tutaj fragmentu jako bełkotu przedstawiłem bez
uzasadnienia, a więc to nie tylko *ocena*, ale to również *tylko* ocena, a więc z *Twojej*
perspektywy to *aksjomat*. Zrobiłem tak, ponieważ jestem (również subiektywnie) przekonany, że
prawdopodobnie podzielasz moje zdanie. I właśnie do tego, jak mi się zdaje, to jest do jawnego lub
niejawnego *zawężenia kręgu odbiorców* sprowadza się rola tego rodzaju decyzji.

Jeżeli poczułaś się urażona tym mocnym, negatywnym określeniem, to zapewniam Cię, że byłoby mi z
tego powodu przykro (gdybym się o tym dowiedział), ale mimo to napisałem to, co napisałem, ponieważ
uważam, że *powinnaś znać moją postawę*. Chcę być jednocześnie wobec Ciebie i siebie *uczciwy*, a to
wymaga czasem wypowiedzenia wprost czegoś, co dla drugiej strony może być trudne nawet tylko do
przeczytania albo wysłuchania. Przekonasz się zresztą w jednym z następnych rozdziałów, jeżeli tylko
zechcesz czytać dalej, że moja postawa wobec Anzelma, jego dowodu na istnienie Boga i w ogóle ludzi
wierzących i praktyk, które wierzący stosują, nie jest ani radykalna, ani prosta.

Następna zakładka nosi szumną nazwę *Wyprowadzenie dowodu*.

1. Niech „coś, ponad co nic większego nie można pomyśleć” będzie określeniem Boga, które mniej lub
   bardziej rozumieją wszyscy ludzie.

2. Załóżmy teraz, że przedmiot tego określenia istnieje jedynie w umyśle jako idea (przedstawienie).

3. Jednak istnienie w rzeczywistości jest czymś większym, aniżeli istnienie w samym tylko umyśle.

4. Zatem na podstawie dokonanego rozróżnienia (3) oraz założenia (2) możemy pomyśleć o czymś jeszcze
   większym, aniżeli „coś, ponad co nic innego nie możemy pomyśleć”.

5. Wniosek (4) wypowiada sprzeczność: wszak nie można pomyśleć niczego większego od „czegoś, ponad
   co nic większego nie możemy pomyśleć”.  Zatem „coś ponad co nic większego nie można pomyśleć” –
   wbrew założeniu (2) istnieje nie tylko w umyśle, lecz także w rzeczywistości.

Nietrudno rozpoznać, że:

1. Punkt 1 zawiera *definicję*.

2. Punkt 2 to *założenie* [*dowodu nie
wprost*](https://pl.wikipedia.org/wiki/Dow%C3%B3d_nie_wprost).

3. Punkt 3 to *aksjomat* dotyczący relacji między dwoma być może[^2] *predykatami* - *istnieje w
rzeczywistości* i *istnieje w samym umyśle* - i dosyć tajemniczą binarną relacją *bycia większym
niż*, wreszcie ...

4. ... punkty 4 i 5 zawierają skrótową charakterystykę jakiś *logicznych operacji*, które mają
rzekomo prowadzić do *sprzeczności*, a dzięki temu, za pomocą zasady podwójnej negacji, do wniosku o
istnieniu Boga.

Widzimy więc, że Anzelm próbował tutaj (być może o tym nie wiedząc) skorzystać z logiki
*klasycznej*.

Punkty 4 i 5 możemy potraktować jako niezobowiązujące *wskazówki*, bo gdy już będziemy w dalszej
części książki dysponować pozostałymi potrzebnymi do tego celu narzędziami - za wyjątkiem
[*spójników modalnych*](https://pl.wikipedia.org/wiki/Logika_modalna), które być może mogłyby się tu
do czegoś przydać - to jest *relacjami*, *negacją*, *kwantyfikatorem egzystencjalnym* i *zasadą
wyłączonego środka* (równoważną zasadzie podwójnej negacji), wtedy sami ocenimy, jak to wszystko
działa. Wszak właśnie na tym, to jest na ocenie poprawności opartej na *subiektywnej interpretacji
wytworu* w postaci tego tekstu *jako rezultatu pewnego zachowania*, a więc jako mniej lub bardziej
udanego *rozwiązania pewnego zadania*, polega nasze *deklarowane zadanie* (czyli "nasze
zachowanie").

### Przypisy

[^1]: Słowo krok (w rozumowaniu lub argumentacji) nie jest o ile mi wiadomo terminem technicznym w
    przyjętym tutaj przeze mnie rozumieniu. Wprowadziłem je tylko dlatego, że mi się podoba.

[^2]: Słowo istnieje wypadałoby zakodować za pomocą [*kwantyfikatora
    egzystencjalnego*](https://pl.wikipedia.org/wiki/Kwantyfikator_egzystencjalny), a *sposoby
    istnienia* (tutaj *realny* i *w umyśle*) aż się proszą, żeby poszperać w [*logikach
    modalnych*](https://pl.wikipedia.org/wiki/Logika_modalna). Dla uproszczenia jednak na tym etapie
    mówię o predykatach, bo to pojęcie już znasz.
