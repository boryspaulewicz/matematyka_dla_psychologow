## O czym teraz będzie

Niebawem będziemy się przyglądać dowodowi na istnienie Boga Anzelma z Canterbury. Żeby zrobić z nim
coś ciekawego, potrzebujemy co najmniej predykatów i później relacji binarnych, a także dużego
kwantyfikatora. Okaże się teraz, że duży kwantyfikator już mamy, tylko się dotąd ukrywał.

Na wszelki wypadek przypominam o notatkach, planowanych powtórkach i aktywnym podejściu do nauki, bo
inaczej sporo pary idzie w gwizdek. I jednocześnie podkreślam, że to tylko sugestia.

<hr>

# Duży kwantyfikator i predykaty (jako funkcje)

Zaczniemy od dużego kwantyfikatora, bo z tym będzie najłatwiej.

## Duży kwantyfikator jest wbudowany w język teorii typów

Przypominam głupszą siostrę uogólnionej identyczności:

```lean
def nic_nie_robie (n : Nat) := n
```

Co robi ta funkcja? Dla każdego `n : Nat` zwraca `n` (`: Nat`). Jeszcze raz, ale tym razem z
akcentem: *Dla każdego* `n : Nat` zwraca `n` (`: Nat`). Symbol *∀*, który uzyskasz w Leanie wpisując
`\forall`, czytamy właśnie jako *dla każdego*. Po tym symbolu zawsze (jawnie lub niejawnie) obecna
jest jeszcze część oznaczająca *coś spełniające taki a taki warunek*, a potem część będąca zdaniem,
zwykle dotyczącym tego arbitralnego czegoś, co ten warunek spełnia. Matematycy używają zwykle tego
symbolu w taki oto sposób: ...

*∀ n ∈ ℕ, ∀ m ∈ ℕ, n + m = m + n*

... oznaczając za pomocą fikuśnie napisanej litery *ℕ* zbiór liczb naturalnych. Jak wiesz, dla nas
to to samo co `Nat.add_comm`:

```lean
#check Nat.add_comm -- Nat.add_comm (n m : Nat) : n + m = m + n
```

Gdy mamy na to ochotę, możemy ujawnić to podobieństwo w Leanie stosując symbol `∀`:

```lean
-- To ...
theorem przemiennosc_nat : (n : Nat) → (m : Nat) → n + m = m + n :=
    -- Ponieważ Nat.add_comm jest już dowodem tego twierdzenia, to zamiast tworzyć swoją wersję dowodu, korzystam
    -- tutaj z tej stałej.
    fun (n : Nat) => fun (m : Nat) => Nat.add_comm n m

-- ... jest tym samym, co to ...
theorem przemiennosc_nat' : ∀ n : Nat, ∀ m : Nat, n + m = m + n :=
    fun (n : Nat) => fun (m : Nat) => Nat.add_comm n m
```

Zwracam uwagę, że po (tutaj typowanych) zmiennych
[*związanych*](https://pl.wikipedia.org/wiki/Operator_(logika)) dużym kwantyfikatorem (tak się o tym
mówi) piszemy *przecinek*, a nie strzałkę. Ta konwencja wynika między innymi stąd, że taki zapis za
pomocą symbolu `∀` bardziej przypomina coś, co można by znaleźć w typowych książkach napisanych
przez matematyków.

Pokażę Ci teraz, jak wygląda dowód tego samego twierdzenia skonstruowany za pomocą taktyk, a więc w
trybie interaktywnym. Tym razem zapisałem wszystkie taktyki w jednej linii i trochę je przesunąłem,
żeby było wyraźnie widać, jakim częściom zdania / specyfikacji te taktyki odpowiadają (albo które z
tych części "obsługują"). Jeżeli będziesz chciała użyć więcej niż jednej taktyki w tej samej linii,
będziesz musiała, tak jak zrobiłem to tutaj, oddzielić je średnikiem.

```lean
-- ∀ to tylko alternatywny sposób zapisania λ-abstrakcji, czyli "rozpoczęcia" kodu opisującego funkcję.
theorem przemiennosc_nat'' : ∀ n : N, ∀ m : N, n + m = m + n :=
 by                          intro n; intro m; exact Nat.add_comm n m
```

Ponieważ parametrami naszych funkcji / twierdzeń mogą być zmienne dowolnego typu, w tym również
typów zdaniowych, nasz odpowiednik dużego kwantyfikatora działa dla każdego typu. To znaczy, że
możemy na przykład kwantyfikować po zdaniach. Właściwie robiliśmy to już wcześniej, tylko nie
sygnalizowaliśmy tego wyraźnie za pomocą odpowiedniego symbolu:

```lean
-- To ...
theorem tautologia (p : Prop) : p → p := fun (h : p) => h

-- ... jest tym samym, co to:
theorem tautologia' : ∀ p : Prop,  p → p := fun (p : Prop) => fun (h : p) => h
```

## Predykat to funkcja z dowolnego typu do typu Prop

Zdanie *Kawusia była pyszna* możemy zapisać formalnie na różne sposoby i to, który sposób
wybierzemy, będzie zależało od przyjętych celów. Możemy je na przykład zakodować jako stałą `k` typu
`Prop`. Wtedy jedyną własnością tego zdania, którą będziemy mogli poddać analizie, będzie jego
prawdziwość lub fałszywość, co dla nas w tym momencie znaczy dowiedlność czy udowadnialność (tego
zdania lub jego negacji).

Moglibyśmy jednak spróbować zakodować również *strukturę* tego zdania. Wtedy nadal stosowałyby się
do niego wszystkie dostępne operacje na zdaniach, bo pozostałoby zdaniem, ale poza tym, że to wciąż
byłoby zdanie, pojawiłyby się również pewne nowe operacje, wymagające większej "rozdzielczości
formalizacji" języka naturalnego, dzięki której można "formalnie rozpoznać" strukturę
podmiot-orzeczenie.

Zanim podejmiemy próbę formalizacji, musimy zadać sobie pytanie, czy (w przyszłości) ważny będzie
dla nas czas przeszły, bo ta kawusia przecież *była* pyszna. Jeżeli przyjmiemy, że nie, to naturalne
będzie rozbicie zdania na *dwie* części, podmiot *Kawusia* i orzeczenie *była pyszna*, bo co innego
możemy z nim zrobić, poza ewentualną próbą uchwycenia jakiejś własności czasu przeszłego?
Formalizować operację zdrabniania?  Brzmi kusząco, ale nie tym razem.

*Kawusia* to pewna *rzecz*, a *była pyszna* to własność przypisywana tej rzeczy przez zdanie
*Kawusia była pyszna*. To zdanie ma sens, bo kawa to napój, a własność bycia pysznym może
przysługiwać albo nie między innymi napojom. W tle tego zdania istnieje więc typ *napój*, który
ujawnimy wprost w formalizacji. Ponieważ w teorii typów każdy term musi mieć typ, to jeśli chcemy
mówić o ewentualnej pyszności kawy jako napoju posługując się językiem tej teorii, musimy najpierw
wprowadzić aksjomat:

```lean
axiom Napoj : Type
```

Odtąd w naszym języku *są* (jakieś) *napoje*. Jak teraz zapisać formalnie predykat *była pyszna*?
Jeżeli, ze względu na cel tej zabawy ignorując czas przeszły, zrobimy tak:

```lean
-- O napojach (typ argumentu) można twierdzić (a więc rezultat musi mieć typ Prop), że są pyszne.
axiom Pyszna : Napoj → Prop
```

to będziemy mogli napisać tak:

```lean
-- Kawa jest napojem.
axiom kawa : Napoj

-- Pyszna kawa jest odtąd poprawnym zdaniem konstruowanego języka.
#check Pyszna kawa -- Pyszna kawa : Prop
```

W konstruowanym właśnie języku `Pyszna kawa` to odtąd poprawne zdanie. W dodatku zapisane po polsku
i - ze względu na nasze ograniczone cele - wystarczająco blisko oryginału. Oczywiście nie tylko
napoje mogą być pyszne, ale obecny poziom ekspresyjności powinien nam wystarczyć. Wprowadzę teraz
jeszcze jedną kosmetyczną zmianę, bo przyda mi się później, gdy będę mówił o bardziej
skomplikowanych składniowo *relacjach binarnych*.

Do tej pory definiowaliśmy funkcje, które zwracały wyłącznie termy nie będące typami, ale język,
którego używamy nie narzuca wcale takiego ograniczenia. W szczególności, możemy w tym języku
zdefiniować funkcję, która *tworzy typ* będący predykatem i dzięki temu jeszcze bardziej zbliżyć
zapis formalny do zapisu w języku naturalnym (ilustracja):

```lean
-- Funkcja Predykat zwraca *typ* predykatu dotyczącego termów typu podanego jako jej
-- argument:
def Predykat (typ : Type) : Type := typ → Prop

-- Możemy teraz zapisać w sposób bardziej przypominający zapis w języku naturalnym, że Pyszna jest predykatem
-- dotyczącym napojów:
axiom Pyszna : Predykat Napoj

-- Ewaluacja wyrażenia po stronie typu tej aksjomatycznej stałej pozwala zobaczyć, jak działa funkcja 
-- Predykat (ilustracja):
axiom Pyszna : Predykat Napoj
--> (rozpakowanie stałej Predykat)
axiom Pyszna : (fun (typ : Type) => typ → Prop) Napoj
--> (odczepienie ciała i podstawienie pod zmienną kończy proces redukcji)
axiom Pyszna : Napoj → Prop

-- Pyszna kawa jest poprawnym zdaniem, ponieważ jest aplikacją predykatu a więc pewnej funkcji do termu o typie,
-- którego wymaga ten predykat (ta funkcja):
#check Pyszna kawa -- Pyszna kawa : Prop
```

Rozwiązania takie jak to, które zastosowałem, żeby w mam nadzieję nieco bardziej czytelny sposób
oznaczać własność bycia predykatem, nazywamy w programowaniu [*lukrem
składniowym*](https://pl.wikipedia.org/wiki/Lukier_sk%C5%82adniowy) (albo lukrem syntaktycznym albo
cukrem składniowym). Dobrym przykładem tego rodzaju funkcjonalności jest znana Ci już możliwość
zapisywania dodawania w notacji infiksowej (`1 + 2` to tylko alternatywna forma zapisu `Nat.add 1
2`). Lukier składniowy nie jest konieczny, ale gdy stosujemy go z wyczuciem, może znacząco poprawić
czytelność kodu.

**Definicja predykatu**: *Predykatem* jest każda *funkcja z jakiegoś typu do typu zdań*.

## Przykładowa próba formalizacji dowodu na istnienie Boga Anzelma z Cantenbury

Próbując sformalizować rozumowanie ukryte w tekście zapisanym w języku naturalnym również warto
zacząć od czegoś w rodzaju typowania. Mam tu na myśli podział fragmentów tekstu na kategorie
określające role, jakie te fragmenty odgrywają w uzasadnieniu wniosku. Dzięki takiej kategoryzacji
zwykle szybko odkrywamy, że większość fragmentów, na przykład niemal wszystko, co autorzy artykułu
empirycznego napisali we wprowadzeniu i dyskusji wyników, możemy spokojnie zignorować bez żadnej
szkody dla poprawności analizy.

Spośród wielu form, jakie mogą przybierać [argumenty](https://pl.wikipedia.org/wiki/Argumentacja)
czy środki [retoryczne](https://pl.wikipedia.org/wiki/Retoryka) najbardziej, poza samym *wnioskiem*,
będą nas teraz interesować *przesłanki*, *kroki*[^1] (pośrednie) i *definicje*. Na przykład, w tym
wyrwanym z kontekstu (a tak naprawdę przeze mnie wymyślone) zdaniu, które możemy potraktować zarówno
jako przesłankę, krok lub wniosek, zależnie od tego, co nas w danym momencie interesuje ...

> Efekt Stroopa był istotnie mniejszy u osób z niższym poziomem ekstrawersji.

... widzimy trzy *terminy techniczne*: [*efekt
Stroopa*](https://pl.wikipedia.org/wiki/Efekt_Stroopa), [*istotność
statyczną*](https://pl.wikipedia.org/wiki/Poziom_istotno%C5%9Bci) i **wynik** *w [teście
ekstrawersji](https://pl.wikipedia.org/wiki/Wielka_pi%C4%85tka)*. Możemy się spodziewać, że
(operacyjne) definicje efektu Stroopa i (obserwowanego) poziomu ekstrawersji są podane w tym samym
artykule, a jako docelowi czytelnicy pojęcie istotności statystycznej powinniśmy po prostu
znać. Jeżeli teraz następne zdanie w tej hipotetycznej dyskusji wyników to ...

> To może oznaczać, że introwersja zwiększa skuteczność selekcji uwagowej.

... to możemy je zaklasyfikować jako *wniosek*, który ma rzekomo wynikać z poprzedniego zdania jako
jednej z *przesłanek* (liczba mnoga). 

Mamy tu do czynienia z częstym w artykułach "naukowych" pisanych przez psychologów *pominięciem
kroków* uważanych być może za względnie oczywiste i niekontrowersyjne, z *niejawnym* zastąpieniem
terminów [*operacyjnych*](https://pl.wikipedia.org/wiki/Operacjonalizacja), to jest takich, które
dotyczącą sposobów dokonywania pomiarów lub faktycznie zastosowanych interwencji, przez ich
*teoretyczne interpretacje*, z wprowadzoniem nieuzasadnionej [*interpretacji
przyczynowej*](https://pl.wikipedia.org/wiki/Wnioskowanie_przyczynowe) (*zwiększa*) i z
*asekuracyjnym* sformułowaniem *może oznaczać*, które gdyby odczytać to sformułowanie dosłownie,
sugerowałoby, że całe to zdanie nic nie znaczy, bo przecież dosłownie wszystko *może* oznaczać
cokolwiek tylko chcemy zależnie od kontekstu. Wiemy również z góry, bo takie wady mają niemal
wszystkie "naukowe" artykuły pisane przez psychologów, że zabraknie jawnej analizy ograniczeń
wynikających z [*obciążenia próby*](https://pl.wikipedia.org/wiki/Obci%C4%85%C5%BCenie_pr%C3%B3by),
że wnioski będą sformułowane zdecydowanie zbyt ogólnienie, przypuszczalnie z powodu braku
zrozumienia różnicy między (nieistniejącą) "reprezentatywnością próby" i [*reprezentatywnością*
**procesu** *pobierania próby*](https://pl.wikipedia.org/wiki/Dob%C3%B3r_pr%C3%B3by), a także
dlatego, że gdyby autorzy poważnie podeszli do kwestii braku wiedzy na temat [*przyczynowych*
różnic](https://en.wikipedia.org/wiki/External_validity) między sytuacją odpowiadającą badaniu a
szerokim zakresem sytuacji, o których wyniki tego badania mają rzekomo coś mówić, to wnioski
brzmiałyby tak trywialnie, że najpewniej nie byłoby szans na publikację w wysokopunktowanym
czasopiśmie.

To, że na przykład interpretacja przyczynowa *nie może* być w tym wypadku uzasadniona, możemy
ustalić natychmiast nie czytając reszty tego hipotetycznego artykułu, ponieważ niemal niezależnie od
przyjętych definicji efektu Stroopa i ekstrawersji, z góry wiadomo, że z powodów technicznych i
etycznych ekstrawersja nie była w tym badaniu rezultatem zewnętrznej interwencji i istnieje wiele,
być może bliżej nieokreślonych a z pewnością nie występujących w danych, odgrywających potencjalnie
niepomijalną rolę [*wspólnych przyczyn*](https://en.wikipedia.org/wiki/Confounding) tych dwóch
zmiennych (zakładając, że ekstrawersja rozumiana tak, jak rozumieją ją autorzy w ogóle istnieje).

Tym razem zajmiemy się jednak przykładem rozumowania, które możemy poddać analizie bez wprowadzania
pojęć z zakresu metodologii badań, bo na to jest jeszcze za wcześnie. Z polskiej [strony
Wikipedii](https://pl.wikipedia.org/wiki/Dow%C3%B3d_ontologiczny) poświęconej "dowodowi" na
istnienie Boga autorstwa Anzelma z Cantenbury dowiadujemy się (2024-12-08), że:

> sprowadza się on do pokazania, że w samym pojęciu Boga zawiera się konieczność jego istnienia.

To nie jest co prawda ani przesłanka, ani definicja, ani krok czy wniosek, ale ta jedna uwaga, o ile
zawarta w niej charakterystyka dowodu Anzelma jest trafna, może być bardzo użyteczna. Jeżeli
faktycznie rzekomy dowód Anzelma na tym właśnie polega, to możemy w tym momencie zakończyć badanie,
ponieważ uzasadnienie tezy o istnieniu desygnatu odgrywającej tutaj rolę terminu technicznego stałej
`Bóg` w oparciu o jego definicję pozwala "uzasadnić" wniosek o istnieniu każdego możliwego "bytu",
na przykład jednorożców czy wróżek, z tego prostego powodu, że definicje pojęć czy stałych są
(językowymi) *wyborami*. Z czystej ciekawości czytamy jednak dalej.

> Przed przeprowadzeniem dowodu we własnym zakresie Anzelm zaleca specyficzne przygotowanie
> duchowe. Należy odrzucić niepokoje i odłożyć na później swoje codzienne troski. Następnie „wejść
> do izdebki” własnego umysłu i wyrzucić z niego wszystko oprócz Boga i tego, co wspomaga w jego
> poszukiwaniu.

I znowu z pomocą przyjdzie nam (nieformalne) typowanie. Mamy tu do czynienia z *radą*. To też
ciekawy typ, jakby blisko [*normy*](https://en.wikipedia.org/wiki/Normativity), ale jednak coś
innego. Zwracam uwagę, że czasem sam akt wstępnego typowania fragmentów tekstu napisanego w języku
naturalnym (tutaj samo rozpoznanie, że mamy do czynienia z ogólnym typem rada) może działać jak
odsłonięcie rano zasłon. Sformułowanie rady *zakłada* pewien *cel*, a ponieważ naszym
(deklarowanym!)  celem nie jest w tym momencie przekonanie za wszelką cenę samych siebie o
prawdziwości wniosku, ten fragment również możemy pominąć, tym bardziej, że "wyrzucanie"
czegokolwiek z "izdebki umysłu" raczej nam nie pomoże w poprawnej ocenie sytuacji. Co dalej?

> Wyjaśnia też swoje intencje. Zastrzega, że nie cahce przeniknąć głębi Boga, ponieważ wtedy
> popełniałby grzech pychy. Chce tylko do pewnego stopnia zrozumieć prawdę, w którą wierzy. Nie
> stara się bowiem zrozumieć, aby wierzyć, ale wierzy, by zrozumieć. A i w to wierzy, że jeśli nie
> uwierzy, to nie zrozumie.

Tutaj z kolei mamy informacje na temat nieobserwowalnego stanu, a ściślej intencji, przekonań i
postaw autora, których nie możemy w żaden sposób zweryfikować, bo nie możemy się cofnąć w czasie i
wcielić w Anzelma. Zresztą, nawet, gdyby to było możliwe, nadal byłyby to tylko nasze domysły, bo
ludzie nie mają doskonałego dostępu do własnych prawdziwych postaw i przekonań. Dlatego z naszej
perspektywy, czy raczej z perspektywy autora analizy, w którego się tutaj wcielamy, te stwierdzenia
muszą pełnić rolę *aksjomatów*. Widzimy też od razu, że nie mogą pełnić żadnej ważnej roli w
uzasadnieniu, a więc ten fragment również możemy spokojnie pominąć.

Pierwsze zdanie w zakładce *Przesłanka* to:

> Głupi mówi, nie ma Boga. 

W tym momencie, jeżeli tylko mamy ochotę (a ja akurat mam) możemy zacząć formalizację, ponieważ nie
jest jeszcze całkiem jasne, czy ten zabieg retoryczny, a konkretnie pewnego rodzaju
[*perswazja*](https://pl.wikipedia.org/wiki/Perswazja), to jest argument polegający na użyciu *siły*
(słowo głupi jest przecież *obraźliwe*), nie odegra później jakiejś ważnej roli.

```lean
axiom Bog : Type

axiom Czlowiek : Type

-- Mam nadzieję, że widać już teraz korzyści wynikające z syntaktycznego lukrowania.
axiom Glupi : Predykat Człowiek

axiom Niewierzacy : Predykat Człowiek
```

Pozwoliłem sobie tutaj na ryzykowne *uproszczenie*, polegające na *wyborze* pewnej
*interpretacji*. Założyłem (niejawnie, ale teraz to zmieniam), że *mówić*, że nie ma Boga znaczyło w
tym kontekście dla Anzelma to samo, co *nie wierzyć* w Boga. Widzimy dzięki temu, że formalizacja
rozumowań zapisanych w języku naturalnym może wymagać i często wymaga formułowania *hipotez
empirycznych* na temat przyjętych przez autora znaczeń. Ponieważ te możemy tylko lepiej lub gorzej
*odgadywać*, wypada nam przyjąć zasadę *życzliwej interpretacji*. Zgodnie z tą zasadą, powinniśmy
próbować zidentyfikować *wszystkie* takie interpretacje wypowiedzi autora, które są *spójne* z
dostępną *wiedzą zastaną* na temat autora i z *całością tekstu*, skupiając się przy tym na takich,
które zdają się dawać autorowi *największe szanse powodzenia* w uzasadnianiu wniosku.

Wracając do zdania o głupich, czyli między innymi o mnie, wydaje się, że to zdanie kryje w sobie
*implikację*, a jeżeli tak, to pozostaje tylko ustalić, w którym kierunku. W pierwszej chwili
mogłoby się wydawać, że chodzi o coś takiego:

```lean
axiom mocna_teza : Glupi → Niewierzacy
```

Ale nie jest wcale jasne, czy Anzelm zgodziłby się na zastosowanie tutaj dużego kwantyfikatora, a
taki tu przecież (niejawnie) występuje, bo zgodnie z mechaniką działania teorii typów aksjomat
`mocna_teza` odczytujemy jako **Dla każdego** *człowieka C, jeżeli C jest głupi, to C jest
niewierzący*. Na użytek dalszych rozważań przyjmiemy jednak, że taka "kwantyfikalizacja" jest w tym
wypadku akceptowalna. Gdyby miało się później okazać, że to zmniejsza szanse Anzelma, zawsze możemy
się z tego wycofać i spróbować inaczej.

Przyjęcie aksjomatu `mocna_teza` w jego obecnej postaci wyklucza istnienie ludzi zarazem głupich i
*wierzących*, z czym Anzelm by się pewnie nie zgodził, a więc jeżeli to ma być implikacja, to chodzi
prawdopodobnie raczej o to:

```lean
axiom mocna_teza' : Niewierzacy → Glupi
```

Stosujemy tutaj kryterium spójności z wiedzą zastaną, przy okazji odkrywając, że gdybym miał okazję
poznać Anzelma osobiście, nie zrobiłbym na nim dobrego wrażenia. Nie ma powodu, żeby usuwać
poprzednią interpretację, choćby dlatego, że nie mamy jeszcze pewności, czy jest faktycznie błędna,
a poza tym ta pierwsza interpretacja jest pełnowartościowym fragmentem *dokumentacji* pozwalającej
zobaczyć, jakie dokładnie możliwości wzięliśmy pod uwagę. Co dalej?

> Ale nawet ten, co tak mówi, musi rozumieć o co chodzi, gdy ktoś mówi: „coś, ponad co nic większego
> nie może być pomyślane”. Nawet ten głupi rozumie to, co słyszy, a to co rozumie, znajduje się w
> jego intelekcie.

W mojej *subiektywnej ocenie*, a właściwie po prostu w mojej ocenie, bo nie ma ocen innych niż
subiektywne (ani tak naprawdę "moje", ale o tym kiedy indziej), mamy tutaj do czynienia niemal z
[*bełkotem*](https://sjp.pwn.pl/sjp/;2443481), co może świadczyć o tym, że zanim napisał te słowa,
Anzelm mógł nieco przesadzić z wyrzucaniem tego i owego z izdebki własnego umysłu. Wypowiedzi
zbliżone do bełkotu mogą co prawda skrywać jakieś mniej lub bardziej sensowne albo ważne ze względu
na wniosek treści, ale musimy zdecydować, jak szczegółowo i wyczerpująco będziemy badać wypowiedzi
autora i każda taka decyzja musi być oparta do pewnego stopnia na (subiektywnej) ocenie. Na
przykład, klasyfikację zacytowanego tutaj fragmentu jako bełkotu przedstawiłem bez uzasadnienia, a
więc to nie tylko *moja ocena*, ale to również *tylko ocena*, a więc z *Twojej* perspektywy to jest
aksjomat. Zrobiłem tak, ponieważ jestem (również subiektywnie) przekonany, że prawdopodobnie
podzielasz moje zdanie. I właśnie do tego, jak mi się zdaje, to jest do jawnego lub niejawnego
*zawężenia kręgu odbiorców* sprowadza się główna rola tego rodzaju decyzji.

Następna zakładka nosi szumną nazwę "*Wyprowadzenie dowodu*".

1. Niech „coś, ponad co nic większego nie można pomyśleć” będzie określeniem Boga, które mniej lub
   bardziej rozumieją wszyscy ludzie.

2. Załóżmy teraz, że przedmiot tego określenia istnieje jedynie w umyśle jako idea (przedstawienie).

3. Jednak istnienie w rzeczywistości jest czymś większym, aniżeli istnienie w samym tylko umyśle.

4. Zatem na podstawie dokonanego rozróżnienia (3) oraz założenia (2) możemy pomyśleć o czymś jeszcze
   większym, aniżeli „coś, ponad co nic innego nie możemy pomyśleć”.

5. Wniosek (4) wypowiada sprzeczność: wszak nie można pomyśleć niczego większego od „czegoś, ponad
   co nic większego nie możemy pomyśleć”.  Zatem „coś ponad co nic większego nie można pomyśleć” –
   wbrew założeniu (2) istnieje nie tylko w umyśle, lecz także w rzeczywistości.

Nietrudno rozpoznać, że punkt 1 zawiera *definicję*, punkt 2 to *założenie* [*dowodu nie
wprost*](https://pl.wikipedia.org/wiki/Dow%C3%B3d_nie_wprost), punkt 3 to *aksjomat* dotyczący
relacji między dwoma *predykatami* - *istnieje w rzeczywistości* i *istnieje w samym umyśle* - i
dosyć tajemniczą binarną relacją *bycia większym niż*, wreszcie punkty 4 i 5 zawierają skrótową
charakterystykę jakiś *logicznych operacji*, które mają rzekomo prowadzić do *sprzeczności*, a
dzięki temu, za pomocą zasady podwójnej negacji, do wniosku o istnieniu Boga. A więc widzimy też, że
Anzelm próbował tutaj (być może o tym nie wiedząc) skorzystać z logiki *klasycznej*.

Punkty 4 i 5 możemy potraktować jako niezobowiązujące *wskazówki*, bo gdy już będziemy w dalszej
części książki dysponować pozostałymi potrzebnymi do tego celu narzędziami, może za wyjątkiem
ewentualnych [*spójników modalnych*](https://pl.wikipedia.org/wiki/Logika_modalna), to jest
*relacjami*, *negacją*, *kwantyfikatorem egzystencjalnym* i *zasadą wyłączonego środka* (równoważną
zasadzie podwójnej negacji), wtedy sami ocenimy, jak to wszystko działa. Wszak właśnie na tym, to
jest na ocenie poprawności opartej na *subiektywnej interpretacji wytworu* w postaci tego tekstu
*jako rezultatu pewnego zachowania*, a więc jako mniej lub bardziej udanego *rozwiązania pewnego
zadania*, polega *nasze deklarowane zadanie* (czyli "nasze zachowanie").

Zaczynasz już lepiej dostrzegać, dokąd to wszystko zmierza?

### Przypisy

[^1]: Słowo krok (w rozumowaniu lub argumentacji) nie jest o ile mi wiadomo terminem technicznym w
    przyjętym tutaj przeze mnie rozumieniu. Wprowadziłem je tylko dlatego, że mi się podoba.
