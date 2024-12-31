## O czym teraz będzie

No tutaj to chyba akurat ja bawię się najlepiej. Może i Tobie się udzieli. A rozdział zawiera
teoretyczne rozważania na temat negacji i sprzeczności w logice konstruktywnej, w ramach których
pokazuję Ci, jak *możemy sobie sami zdefiniować negację*. Jeżeli poradziłaś sobie z zadaniami w
rozdziale poprzednim, to ten rozdział możesz potraktować jako ciekawostkę.

<hr>

# Negacja, absurd, fałsz, sprzeczność i eksplozja

Podaję za
[Wikipedią](https://en-m-wikipedia-org.translate.goog/wiki/Principle_of_explosion?_x_tr_sl=en&_x_tr_tl=pl&_x_tr_hl=pl&_x_tr_pto=rq)
(2024-12-08):

> W logice klasycznej, logice intuicjonistycznej i podobnych systemach logicznych zasada eksplozji
> jest prawem, zgodnie z którym każde stwierdzenie można udowodnić na podstawie
> sprzeczności. Oznacza to, że na podstawie sprzeczności można wywnioskować dowolne twierdzenie (w
> tym jego negację); zjawisko to nazywa się eksplozją dedukcyjną.

Na początek przyjmiemy taką oto definicję *absurdu* (z dużej litery, żeby nie wchodzić w konflikt z
definicją Leana). Zwracam uwagę, że ponieważ `Prop` to typ wyższego rzędu, to jest definicja *typu*
(i zarazem zdania):

```lean
def Absurd : Prop := (a : Prop) → a
```

Za pomocą instrukcji `section` wejdziemy do strefy bezpiecznych eksperymentów logicznych i tam za
pomocą instrukcji `variable` zadeklarujemy, że mamy dowód absurdu, czyli term typu
`Absurd`. Ponieważ *termy typu* `Absurd` są funkcjami, możemy je aplikować. Użyjemy tego termu /
dowodu / funkcji do zdania `Ponury Krystian` i w ten sposób *lokalnie*, bo tylko wewnątrz utworzonej
sekcji, udowodnimy to zdanie:


```lean
-- Odtąd istnieją żniwiarze ...
axiom Zniwiarz : Type

-- ... i Krystian jest jednym z nich.
axiom Krystian : Zniwiarz

-- Żniwiarze bywają ponurzy.
axiom Ponury : Zniwiarz → Prop

section strefa_komfortu

    variable (jadro_ciemnosci : Absurd)

    -- Ponieważ ...
    #check jadro_ciemnosci -- jadro_ciemnosci : Absurd
    
    -- ... a zatem, zgodnie z definicją stałej Absurd, jadro_ciemnosci jest taką oto funkcją,
    -- którą możemy stosować do zdań (Lean nie sygnalizuje błędu, więc typowanie jest poprawne), ...
    #check (jadro_ciemnosci : (a : Prop) → a)

    -- ... że stosując znane Ci już podstawianie na poziomie typu ...
    #check jadro_ciemnosci (Ponury Krystian) -- jadro_ciemnosci (Ponury Krystian) : Ponury Krystian

    -- ... to jadro_ciemnosci (Ponury Krystian) jest dowodem zdania Ponury Krystian.

end strefa_komfortu

-- Lean sygnalizuje tutaj błąd, a więc poza strefą komfortu jeteśmy bezpieczni.
#check jadro_ciemnosci
```

Jeżeli skopiujesz te dwa fragmenty kodu do Leana, to po umieszczeniu kursora nad pierwszym
wystąpieniem komendy `#check` zobaczysz, że uzyskujemy tam lokalny dowód, że żniwiarz Krystian jest
ponury. Być może jest już dla Ciebie jasne, że w ten sam sposób możemy uzyskać dowód dowolnego
innego zdania.

Uzyskaliśmy tutaj *jakiś* dowód, który możemy skonstruować *w tym kontekście* (w tej sekcji) i w tym
*lokalnym* kontekście ten dowód jak najbardziej obowiązuje. Nie jest to jednak *prawda uniwersalna*,
bo skorzystaliśmy z hipotetycznego dowodu absurdu, którego nie zadeklarowaliśmy poza lokalnym
kontekstem. 

Mieliśmy właśnie do czynienia z *eksplozją dedukcyjną*.

[*Ex falso quodlibet*](https://xkcd.com/704/).

*Z Fałszu wynika wszystko.*

Inna nazwa na absurd to *fałsz*.

Niechaj wszystkie istoty, żywe i martwe, [pokłonią się](https://www.youtube.com/watch?v=Nrz250ryvr8)
przed potęgą typów zależnych!

Trochę mnie poniosło, ale chyba mnie rozumiesz. Być może najprostszy punkt widzenia na to, czym jest
tutaj typ `Absurd`, jest taki, że jest to po prostu pewien typ, na definicję którego pozwala
ekspresyjność języka teorii typów, a który jest tak skonstruowany, że - ze względu na interpretację
typu `Prop` - pozwala zaimplentować zasadę eksplozji dedukcyjnej (ale nie zaimplementować *funkcję*
typu `Absurd`, o czym za chwilę). Mówiąc krótko, typ `Absurd` jest skonstruowany w taki sposób, że
*pełni* dokładnie *rolę fałszu*, a więc *jest fałszem* (tak jak go technicznie rozumiemy w logice).

Jeżeli zastanawiasz się teraz, jak mogłaby *wyglądać funkcja typu `Absurd`*, to odpowiadam, że nie
mogłaby, bo taka funkcja może istnieć tylko "wirtualnie" jako (aksjomatyczne albo lokalne)
*założenie*, którego nie da się w żaden sposób *zaimplementować*. Gdyby istniała, musiałaby tworzyć
dowody zdań z niczego, "wiedząc" jedynie, że dostała *jakieś* zdanie, a wtedy *każde* zdanie byłoby
natychmiast prawdziwe. Funkcja typu `Absurd` jest więc czymś *o czym* możemy mówić, ale czego nie
możemy *wypowiedzieć*.

## O co chodzi z tym Absurdem?

Przypominam definicję:

```lean
def Absurd : Prop := (a : Prop) → a
```

Czy widzisz, jak w tej definicji słowa `Prop` i `a` występują od początku do końca na przemian, a
gdybyśmy zmrużyli oczy i nie widzieli dobrze różnicy między strzałką i symbolem definiowania, to na
przemian występowałyby też symbole `:` i `→`/`:=`? Może to wygląda jak przypadek, ale czy w
matematyce mogą występować "prawdziwe przypadki"? To była tylko dygresja, myślałem ją pisząc.

Zgodnie z definicją (`Absurd : Prop ...`), `Absurd` jest pewnym *zdaniem*. Wynika to stąd, że
wszystkie typy funkcyjne (nie funkcje) o postaci `A → B → ... → Q`, gdzie `Q` *ma* typ `Prop`, *same
mają typ `Prop`*:

```lean
-- Deklarujemy, że mamy zdanie p, żeby Lean "wiedział", o czym będziemy "mówić"
variable (p : Prop)

#check Type → p -- Type → p : Prop
#check Type → Type 1 → p -- Type → Type 1 → p : Prop
#check (Type 4 → Type) → p -- (Type 4 → Type) → p : Prop
#check Prop → p -- Prop → p : Prop
#check Nat → p -- Nat → p : Prop
#check p → p -- p → p : Prop
-- i tak dalej
```

Powód przyjęcia w Leanie tej konwencji nie będzie nas teraz interesował; wystarczy nam, że ta
konwencja działa, ale musimy oswoić się z tym, że chociaż `Absurd` jest *zdaniem*, a więc *typem* a
nie funkcją, to jednak *w pewnym sensie* przyjmuje dowolne zdania jako argumenty, ponieważ jest
typem / zdaniem *parametrycznym*. `Absurd` jest zatem kolejnym przykładem *typu zależnego*.

Być może `Absurd` kojarzy Ci się z typem znanej Ci już funkcji `identycznosc`, ale, poza tym, że
`identycznosc` może przyjmować dowolne typy jako pierwszy argument, a będący z definicji funkcją
term typu `Absurd` może przyjmować tylko typy będące zdaniami, to zachodzi między nimi jeszcze
jedna, bardzo ważna różnica (ilustracja) ...

```lean
-- ... polegająca na tym, że identyczność tworzy term typu typ w ten sposób, że zwraca to,
-- co dostała jako drugi argument, natomiast ...
identycznosc : (typ : Type) : typ → typ

-- ... jadro_ciemnosci tworzy term typu a *z niczego*:
jadro_ciemnosci : (a : Prop) → a
```

To może jeszcze raz o tym samym, tylko trochę inaczej. Wyobraźmy sobie, że `d : Absurd` i `p :
Prop`. Wtedy aplikacja `d p` będzie poprawna. Żeby zobaczyć, jak ta aplikacja działa, musimy tylko
prześledzić kolejne kroki jej ewaluacji (ilustracja):

```lean
-- Wersja z nierozpakowaną definicją typu Absurd ...
d : Absurd

-- ... oznacza to samo, co wersja z rozpakowaną definicją ...
d : (a : Prop) → a

-- ... a ponieważ aplikacja takiej funkcji o typie zależnym wymaga jednocześnie oderwania części (a : Prop)
-- i podstawienia argumentu za parametr a w specyfikacji typu, to aplikacja d p ma typ p, czyli jest dowodem
-- zdania p:
d p : p
```

A więc `d` jest tutaj jednocześnie dowodem zdania `Absurd` i pewną funkcją (bo ma w swoim typie
strzałkę), która z dowolnego zdania robi term tego typu, czyli dowód tego zdania.

Na wszelki wypadek podkreślam, że przyjęta przez nas definicja absurdu to nie żadna prawda objawiona
na temat "istoty absurdu"; to tylko pewien *wybór terminologiczny* albo *pojęciowy*, który możemy
wyrazić poprawnie w języku teorii typów. Jest to więc coś, o czym wiemy, że (w jakiś sposób) działa
i na co musimy się wspólnie *umówić*, żeby nasza dalsza komunikacja miała sens, ale z czym żadne z
nas nie musi się wcale *zgadzać*.

Zwracam też uwagę, że `Absurd` *nie* ma struktury predykatu, po prostu dlatego, że nie jest funkcją,
a każdy predykat jest funkcją (do typu `Prop`). `Ponury` jest predykatem, a konkretnie funkcją z
typu `Zniwiarz` do typu `Prop`, `Absurd` jest natomiast *typem funkcji* inaczej *typem
funkcyjnym*. Predykat `Ponury` możemy aplikować (do termów typu `Zniwiarz`), a `Absurd`-u nie możemy
aplikować; możemy aplikować tylko termy typu `Absurd`:

Aplikacja *samego predykatu* do *termu, którego ten predykat dotyczy*, jest *zdaniem*.<br>Aplikacja
*dowodu absurdu* - a nie *samego absurdu* - do *zdania* jest *dowodem tego zdania*.

## Negacja w logice konstruktywnej

Negacja jest operatorem jednoargumentowym, który z dowolnego zdania `p` tworzy negację tego zdania,
`¬p`, która też jest, oczywiście, zdaniem. Dzięki izomorfizmowi Curry'ego-Howarda możemy ten typ
konsekwentnie interpretować jako zdanie o treści *nieprawda, że `p`*.

Każde zdanie postaci `¬p` jest *potencjalnym* [*granatem
odłamkowym*](https://pl.wikipedia.org/wiki/Granat_od%C5%82amkowy), a `¬` jest jego *dźwignią*.

Każdy *term typu `¬p`* (dowód zdania `¬p`) jest *realnym* granatem odłamkowym. 

W przypadku wystąpienia *aplikacji termu typu `¬p` do termu typu `p`*, granat `¬p` zostaje
*uruchomiony* przez *mechanizm sprzeczności*, ponieważ każda taka aplikacja jest *dowodem fałszu*
albo *dowodem absurdu*.

Aplikując tą aplikację (sic!) do *dowolnego* zdania `q` jako takiego wywołujemy *wybuch* granatu i
jako *odłamek* tego wybuchu uzyskujemy *term typu `q`* czyli *dowód zdania `q`*[^1].

**Definicja negacji w logice konstruktywnej**: Negacja zdania `p` to funkcja / implikacja, która
jest zdaniem / typem, dającym się konsekwentnie interpretować jako zdanie *Z `p` wynika absurd /
fałsz*, albo *Gdyby `p` było zdaniem prawdziwym, nastąpiłaby apokalipsa*:

```lean
-- Oto więc nasza wersja definicji negacji:
def nie (p : Prop) : Prop := p → Absurd

-- Deklarujemy, że p jest jakimś zdaniem.
variable (p : Prop)

#check nie p -- nie p : Prop, a więc nie p jest zdaniem

-- Mając dowody zdań p i nie p ...
variable (hp : p) (np : nie p)

-- ... ponieważ ze sprzeczności wynika absurd / fałsz ...
#check np hp -- np hp : Absurd
-- ... a (zgodnie z definicją) z absurdu / fałszu wynika wszystko ...

-- ... to dla dowolnego innego zdania q ...
variable (q : Prop)

-- ... możemy udowodnić q ...
#check np hp q -- np hp q : q
```

Symbol `¬` działa w Leanie *podobnie*, ale nie całkiem tak samo, jak zdefiniowana właśnie stała
`nie`. Ponadto z powodów technicznych, które nie będą nas interesować, definicja stałej `absurd` (z
małej litery) w Leanie jest bardziej skomplikowana (tylko ją tu pokazuję, może lepiej nie próbuj jej
zrozumieć, jeżeli dopiero zaczynasz się uczyć):

```lean
#print absurd
-- def absurd.{v} : {a : Prop} → {b : Sort v} → a → ¬a → b :=
-- fun {a} {b} h₁ h₂ => False.rec (fun x => b) ⋯
```

Różnica wynika stąd, że ta definicja nie wyraża przyjętej przez nas treści pojęcia absurd, tylko
korzysta z tego pojęcia, żeby można go było wygodnie używać w dowodach. Poza tym jednak chodzi o to
samo.

**Ostrzeżenie**: Ponieważ zależy mi, żebyś nauczyła się posługiwać tymi pojęciami bez mojej pomocy,
odtąd będę rzadziej przypominał o różnicach między zdaniem jako takim, istnieniem dowodu zdania albo
arbitralnym dowodem zdania i konstrukcją czy definicją dowodu zdania. Zresztą być może już teraz Ci
to pomoże, bo ludzie na ogół nie są w stanie jednocześnie świadomie rozwiązywać problemów w więcej
niż jednym wymiarze pojęciowym czy teoretycznym. Ja w każdym razie na pewno tego nie potrafię.

Będę Ci też rzadziej przypominał o różnicy między kodem i jego interpretacją, a więc na przykład
między (pewnymi) typami i zdaniami, albo termami typów zdaniowych i ich dowodami, ale z innego
powodu - zależy mi, żebyś poczuła, że te różnice można zwykle zignorować i żebyś dzięki temu
nauczyła się myśleć w całkiem nowy sposób.

### Przypisy

[^1]: Terminologia granatowa to oczywiście żart.
