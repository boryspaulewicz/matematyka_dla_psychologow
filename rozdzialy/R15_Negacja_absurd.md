## O czym teraz będzie

Ten rozdział zawiera teoretyczne rozważania na temat negacji i sprzeczności. Jeżeli poradziłaś sobie
z zadaniami w poprzednim rozdziale, możesz potraktować ten jako ciekawostkę. Pokażę Ci, jak możemy
*zdefiniować* fałsz (inaczej absurd), uprzedzam jednak, że ta definicja jest jednocześnie *łatwa w
użyciu* i *trudna do zaakceptowania*. Dlatego przypominam, że to tylko *jedna z możliwych konwencji,
która działa*.

<hr>

# Negacja, absurd, fałsz, sprzeczność i eksplozja

Podaję za
[Wikipedią](https://en-m-wikipedia-org.translate.goog/wiki/Principle_of_explosion?_x_tr_sl=en&_x_tr_tl=pl&_x_tr_hl=pl&_x_tr_pto=rq)
(2024-12-08):

> W logice klasycznej, logice intuicjonistycznej i podobnych systemach logicznych zasada eksplozji
> jest prawem, zgodnie z którym każde stwierdzenie można udowodnić na podstawie
> sprzeczności. Oznacza to, że na podstawie sprzeczności można wywnioskować dowolne twierdzenie (w
> tym jego negację); zjawisko to nazywa się eksplozją dedukcyjną.

Zwróć proszę uwagę, że chodzi tu o pewną *konwencję*, a *nie* o *istotę* sprzeczności, czymkolwiek
ta istota miała by nie być. Żeby zrozumieć, jak to działa w Leanie, wprowadzimy następującą
definicję *absurdu* (z dużej litery, żeby uniknąć konfliktu z zastaną definicją stałej `absurd`):

```lean
def Absurd : Prop := (zdanie : Prop) → zdanie
```

Za pomocą instrukcji `section` wejdziemy do strefy bezpiecznych eksperymentów logicznych i za pomocą
instrukcji `variable` zadeklarujemy w tej strefie, bez konstruowania go, że mamy jakiś term typu
`Absurd`, czyli *dowód* absurdu, bo `Absurd` jest, jak widać (`Absurd : Prop`), zdaniem. Ponieważ
termy typu `Absurd` są funkcjami (bo typ `Absurd` ma strzałkę), możemy je aplikować. Użyjemy więc
tego hipotetycznego termu/dowodu/funkcji do zdania jako takiego `Ponury Krystian` i w ten sposób
*lokalnie*, bo tylko wewnątrz strefy komfortu, udowodnimy to zdanie:


```lean
-- Odtąd istnieją żniwiarze ...
axiom Zniwiarz : Type

-- ... i `Krystian` jest jednym z nich.
axiom Krystian : Zniwiarz

-- Żniwiarze bywają ponurzy.
axiom Ponury : Zniwiarz → Prop

section strefa_komfortu

    -- Przyjmijmy, że mamy (wiadomo skąd) jakiś term typu `Absurd`.
    variable (jadro_ciemnosci : Absurd)

    -- Zgodnie z definicją stałej `Absurd`, `jadro_ciemnosci` jest funkcją, którą możemy stosować
    -- do zdań *jako takich*, ...
    #check (jadro_ciemnosci : (zdanie : Prop) → zdanie)

    -- ... na przykład do zdania `Ponury Krystian` jako takiego. Stosując znane Ci już podstawianie
    -- na poziomie typu odkrywamy, że *sama ta aplikacja jest dowodem tego zdania*:
    #check jadro_ciemnosci (Ponury Krystian) -- `jadro_ciemnosci (Ponury Krystian) : Ponury Krystian`
    
end strefa_komfortu

-- Lean sygnalizuje błąd, a więc poza strefą komfortu jeteśmy bezpieczni.
#check jadro_ciemnosci
```

Jeżeli skopiujesz te dwa fragmenty kodu do Leana, to po umieszczeniu kursora nad ostatnim
wystąpieniem komendy `#check` zobaczysz, że uzyskujemy tam lokalny dowód, że żniwiarz Krystian jest
ponury. Czy widzisz, że w ten sposób możemy uzyskać dowód *każdego* zdania?

Uzyskaliśmy *jakiś* dowód, który możemy skonstruować *w tym kontekście* (a dokładniej w tej sekcji)
i w tym *lokalnym* kontekście ten dowód jak najbardziej obowiązuje. Nie jest to jednak *prawda
uniwersalna*, bo skorzystaliśmy z hipotetycznego dowodu absurdu. Mieliśmy właśnie do czynienia z
(kontrolowaną) *eksplozją dedukcyjną*, polegającą na tym, że *z fałszu* (inaczej *absurdu*) *wynika
wszystko*, a po łacinie [*ex falso quodlibet*](https://xkcd.com/704/).

Być może najprostszy punkt widzenia na to, czym jest typ `Absurd`, jest taki, że to po prostu pewien
typ, na definicję którego pozwala ekspresyjność języka teorii typów i który jest tak skonstruowany,
że - ze względu to, jak działa typ `Prop` - pozwala zaimplementować zasadę eksplozji dedukcyjnej. A
więc typ `Absurd` pełni dokładnie rolę fałszu, a więc *jest* fałszem, tak jak go technicznie (czyli
jako coś spełniającego określone sztywne reguły użycia) rozumiemy w logice:

*Fałsz to zdanie, z którego wynika każde zdanie*.

Być może zastanawiasz się *dlaczego* ze zdania fałszywego miałoby wynikać każde zdanie. Właściwie
nie jest to konieczne, bo moglibyśmy sobie darować zdanie fałszywe. Negacja byłaby wtedy operacją
zdefiniowaną aksjomatycznie, a nie implikacją, której następnikiem jest fałsz, a zasada eksplozji
dedukcyjnej sprowadzałaby się do schematu aksjomatu `∀ p q : Prop, p → ¬p → q`. Implementacja
logiki, której tu używamy, oparta na absurdzie/fałszu, okaże się jednak w pewnym sensie lepsza, gdy
w jednym z późniejszych rozdziałów popatrzymy na logikę zdań z perspektywy kategoryjnej.

Jeżeli zastanawiasz się, jak mogłaby *wyglądać* funkcja typu `Absurd`, to odpowiadam, że *nie
mogłaby*, bo taka funkcja może istnieć tylko *wirtualnie*, jako aksjomat albo *czysto hipotetyczne*
założenie. Gdyby dało się skonstruować kod takiej funkcji, musiałaby tworzyć dowody zdań *z
niczego*, "wiedząc" jedynie, że dostała *jakieś* zdanie, a wtedy *każde* zdanie byłoby natychmiast
prawdziwe i każde zdanie byłoby natychmiast fałszywe - bo negacja zdania też jest zdaniem - przez co
pojęcia prawdy i fałszu straciłyby sens. 

Jedynym sposobem, żeby skonstruować dowód zdania "z niczego", jest *wprowadzanie aksjomatów*, a to
jest *nasza* rola, bo aksjomaty są (językowymi i pojęciowymi) *wyborami*. Ponieważ wprowadzanie
aksjomatu to *wybór co lub o czym można w danym języku mówić*, gdyby dowód fałszu dało się
*skonstruować*, uzyskalibyśmy *język, w którym można powiedzieć* - w granicach wyznaczonych przez
reguły składniowe teorii typów - *cokolwiek o wszystkim*, czyli *nic o niczym*.

Powyższe uwagi dotyczą jednak tylko logik, w których obowiązuje zasada eksplozji dedukcyjnej, a w
matematyce żadna aksjomatyczna zasada nie jest "święta", bo aksjomaty są *wyborami*. Istnieją logiki
tak zwane [*parakonsystentne*](https://en.wikipedia.org/wiki/Paraconsistent_logic) albo
*paraniesprzeczne*, w których nie każda sprzeczność prowadzi do eksplozji.

## [Bebechy Absurdu](https://youtu.be/82XqhHYwB-Q?si=KSCD6y5x-fdnjjmC)

Może najpierw wyjaśnię, dlaczego typ `Absurd` jest zdaniem.

Typ `Prop` zachowuje się w Leanie inaczej niż wszystkie pozostałe typy, ponieważ typy funkcyjne (nie
funkcje) o postaci `A → B → ... → Q`, gdzie `Q` *ma* typ `Prop`, *same mają typ `Prop`*:

```lean
-- Niech `P` będzie jakimś zdaniem. ...
variable (P : Prop)

-- Wtedy:
#check Type → P            -- `Type → P : Prop`
#check Type → Type 1 → P   -- `Type → Type 1 → P : Prop`
#check (Type 4 → Type) → P -- `(Type 4 → Type) → P : Prop`
#check Prop → P            -- `Prop → P : Prop`
#check Nat → P             -- `Nat → P : Prop`
#check P → P               -- `P → P : Prop`

-- Dla porównania, jeżeli `B` jest typem innym niż `Prop`, to jeżeli `A` ma typ `Type i`, a `B` ma
-- typ `Type j`, to `A → B` ma najwyższy z tych typów, to jest `Type (max i j)`:
variable (T1 : Type 1) (T2 : Type 2)

#check T1 → T1 -- `Type 1`
#check T1 → T2 -- `Type 2`, bo `T2` ma najwyższy typ i jest nim właśnie `Type 2`
#check P  → T1 -- `Type 1`, bo `Prop` jest typem niższym niż typ `Type 1`
#check T2 → P  -- `Prop`, chociaż `T2 : Type 2`, a `Prop : Type 1`
```

Ten niejednorodny sposób używania typów bierze się skąd, że na przykład typ `T1 → P` to przecież `∀
t1 : T1, P`, czyli parametryczne bo parametryczne, ale jednak *zdanie*. 

W odróżnieniu od na przykład typu/zdania parametrycznego `T1 → P`, `Absurd` jest przykładem *typu
zależnego* (mówiąc dokładniej, jest przykładem typu, który zależy od termu \{podanego jako argument
aplikacji termu tego typu\}). Typ `Absurd` jest więc zdaniem, a nie funkcją, ale *w pewnym sensie*
przyjmuje argumenty, ponieważ jest zdaniem nie tylko *parametrycznym*, ale też *zależnym*.

Być może typ `Absurd` kojarzy Ci się z typem zależnym funkcji `identycznosc`, ale, poza tym, że
`identycznosc` może przyjmować *dowolny* typ jako pierwszy argument, a będący z definicji funkcją
term typu `Absurd` może przyjmować tylko typy będące *zdaniami*, to zachodzi między nimi jeszcze
jedna, ważna różnica (ilustracja), ...

```lean
-- ... polegająca na tym, że identyczność tworzy term typu `typ` w ten sposób, że zwraca to co *dostała*
-- jako drugi argument, ...
identycznosc : (typ : Type) : typ → typ

-- ... natomiast `jadro_ciemnosci` tworzy term typu `a`, czyli dowód zdania `a`, *z niczego*:
jadro_ciemnosci : (a : Prop) → a
```

Różnice między uogólnioną identycznością, identycznością działającą tylko na zdaniach i
hipotetycznym termem typu `Absurd` możemy również zobaczyć poniżej, gdzie próbowałem pokazać
wyraźnie, w którym miejscu konstrukcja termu typu `Absurd` staje się niemożliwa.

```lean
-- `(typ : Type) → typ → typ`
#check (fun (typ : Type) => 
            fun (term : typ) => term)

-- `(zdanie : Prop) → zdanie → zdanie
#check (fun (zdanie : Prop) => 
            fun (dowod : zdanie) => dowod)

-- `(zdanie : Prop) → zdanie`
#check (fun zdanie : Prop => (sorry : zdanie))

-- Próbując skonstruować term typu `Absurd` widzimy, że taka funkcja nie może istnieć, bo musiała by
-- konstruować dowody zdań, o których nie wie nic ponad to, że są jakimiś zdaniami. ...
```

... Dlatego może warto sobie choć raz wyobrazić, że termy "opakowane", czyli oznaczone symbolami,
czyli jakieś, to jest takie jak te, które uzyskujemy za pomocą instrukcji `variable`, albo które są
zmiennymi w ciele funkcji, są opakowane w taki trochę przezroczysty albo nie całkiem sztywny
materiał. Przez ten materiał nie widać szczegółów konstrukcji, ale widać, albo może czuć, gdy
trzymamy je w mentalnych dłoniach, że coś tam jest, albo, że nic tam nie ma. No więc termy typu
`Absurd` są po pierwsze zawsze opakowane, a po drugie to opakowanie jest zawsze puste.

To może już ostatni raz o tym samym. Załóżmy, że `d : Absurd` i `p : Prop`. Wtedy aplikacja `d p`
będzie poprawna. Żeby zobaczyć, jaki typ ma ta aplikacja, musimy prześledzić kolejne kroki
ewaluacji, która w tym wypadku zachodzi tylko po stronie typu (ilustracja):

```lean
-- Wersja z nierozpakowaną definicją typu `Absurd` ...
d : Absurd

-- ... oznacza to samo, co wersja z definicją rozpakowaną, bo definicje to tylko alternatywne formy
-- zapisu, ...
d : (a : Prop) → a

-- ... a ponieważ aplikacja takiej funkcji o typie zależnym wymaga jednocześnie oderwania części
-- `(a : Prop)` i podstawienia argumentu za parametr `a` w specyfikacji typu, to aplikacja `d p`
-- ma typ `p`, czyli jest dowodem zdania `p`:
d p : p
```

A więc `d` jest jednocześnie dowodem zdania `Absurd` i funkcją, która z dowolnego zdania robi dowód
tego zdania. To jedyny sposób, w jaki taka aplikacja może działać, bo `d p` nie może zostać do
niczego zredukowane. Gdyby to wyrażenie było redukowalne, znaczyłoby to, że wartością stałej `d`
jest jakaś konkretna funkcja, a wiemy już, że taka funkcja nie może istnieć. Mamy tu do czynienia z
kolejnym przykładem ilustrującym konieczność oddzielenia pojęcia (i operacji) aplikacji od
ewaluacji, bo chociaż tego rodzaju aplikacje są nieredukowalne, to są też poprawne i pozwalają
zaimplementować w Leanie logikę zdań.

Przypominam, że przyjęta przez nas definicja absurdu to nie prawda objawiona na temat "istoty
absurdu" albo sprzeczności, tylko pewien *wybór terminologiczny* albo *pojęciowy*, który możemy
wyrazić poprawnie w języku teorii typów. Jest to więc coś, o czym wiemy, że (w jakiś sposób) działa
i na co musimy się wspólnie *umówić*, żeby nasza dalsza komunikacja przebiegała sprawnie, ale z czym
żadne z nas nie musi się wcale *zgadzać*.

Wiem, że na poziomie teorii to wszystko może się początkowo wydawać pogmatwane i mętne, ale na
szczęście w praktyce okazuje się proste.

## Negacja w logice konstruktywnej

Negacja jest operatorem jednoargumentowym, który z dowolnego zdania `p` tworzy negację tego zdania -
`¬p` - która też jest, oczywiście, zdaniem, które możemy konsekwentnie interpretować jako
*nieprawda, że `p`*.

Każde zdanie postaci `¬p` jest *potencjalnym* [*granatem
odłamkowym*](https://pl.wikipedia.org/wiki/Granat_od%C5%82amkowy), a `¬` jest jego *dźwignią*.

Każdy *term typu `¬p`* (dowód zdania `¬p`) jest *realnym* granatem odłamkowym. 

W przypadku wystąpienia *aplikacji termu typu `¬p` do termu typu `p`*, granat `¬p` zostaje
*uruchomiony* przez *mechanizm sprzeczności*, ponieważ każda taka aplikacja jest *dowodem fałszu*,
inaczej *absurdu*.

Aplikując tą aplikację do *dowolnego* zdania `q` wywołujemy *wybuch* granatu i jako *odłamek* tego
wybuchu uzyskujemy *term typu `q`*, czyli *dowód zdania `q`*[^1].

**Definicja negacji w logice konstruktywnej**: Negacja zdania `p` to funkcja/implikacja, która jest
zdaniem/typem, dającym się konsekwentnie interpretować jako *Z `p` wynika absurd/fałsz*, albo *Gdyby
`p` było zdaniem prawdziwym, nastąpiłaby apokalipsa*:

```lean
-- A to jest nasza tymczasowa wersja definicji negacji:
def nie (p : Prop) : Prop := p → Absurd

-- Deklarujemy, że `p` jest jakimś zdaniem.
variable (p : Prop)

-- Wtedy `nie p` też jest zdaniem, a więc ...
#check nie p -- `nie p : Prop`

-- ... mając dowody zdań `p` i `nie p` ...
variable (hp : p) (np : nie p)

-- ... ponieważ ze sprzeczności wynika absurd/fałsz ...
#check np hp -- `np hp : Absurd`
-- ... a (zgodnie z jego definicją) z absurdu/fałszu wynika wszystko ...

-- ... to dla dowolnego zdania `q` ...
variable (q : Prop)

-- ... możemy udowodnić `q`:
#check np hp q -- `np hp q : q`
```

Symbol `¬` działa w Leanie *podobnie*, ale nie całkiem tak samo, jak zdefiniowana wyżej stała `nie`.
Ponadto z powodów technicznych, które nie będą nas interesować, definicja stałej `absurd` (z małej
litery) w Leanie jest bardziej skomplikowana (tylko ją tu pokazuję, może lepiej nie próbuj jej za
wszelką cenę zrozumieć, jeżeli dopiero zaczynasz się uczyć):

```lean
#print absurd
def absurd.{v} : {a : Prop} → {b : Sort v} → a → ¬a → b :=
    fun {a} {b} h₁ h₂ => False.rec (fun x => b) -- ...
```

Różnica wynika stąd, że ta definicja nie wyraża przyjętej przez nas treści pojęcia absurd, tylko
korzysta z tego pojęcia, żeby można go było wygodnie używać w dowodach. Poza tym jednak chodzi o to
samo.

**Ostrzeżenie**: Ponieważ zależy mi, żebyś nauczyła się posługiwać tymi pojęciami bez mojej pomocy,
odtąd będę rzadziej przypominał o różnicach między zdaniem jako takim, istnieniem dowodu zdania albo
arbitralnym dowodem zdania i konstrukcją czy definicją dowodu zdania. Zresztą być może już teraz Ci
to pomoże, bo ludzie chyba nie są w stanie jednocześnie świadomie rozwiązywać problemów w więcej niż
jednym wymiarze pojęciowym czy teoretycznym. Ja w każdym razie tego nie potrafię.

Będę Ci też rzadziej przypominał o różnicy między kodem i interpretacją, a więc na przykład między
(pewnymi) typami i zdaniami, albo termami typów zdaniowych i ich dowodami, ale z innego powodu -
zależy mi, żebyś poczuła, że te różnice można zwykle zignorować i żebyś dzięki temu nauczyła się
myśleć w całkiem nowy sposób.

### Przypisy

[^1]: Terminologia granatowa to oczywiście żart.
