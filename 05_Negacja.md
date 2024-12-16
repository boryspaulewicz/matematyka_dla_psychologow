# Negacja, absurd, fałsz, sprzeczność i eksplozja

Podaję za
[Wikipedią](https://en-m-wikipedia-org.translate.goog/wiki/Principle_of_explosion?_x_tr_sl=en&_x_tr_tl=pl&_x_tr_hl=pl&_x_tr_pto=rq)
(2024-12-08):

> W logice klasycznej, logice intuicjonistycznej i podobnych systemach logicznych zasada eksplozji
> jest prawem, zgodnie z którym każde stwierdzenie można udowodnić na podstawie
> sprzeczności. Oznacza to, że na podstawie sprzeczności można wywnioskować dowolne twierdzenie (w
> tym jego negację); zjawisko to nazywa się eksplozją dedukcyjną.

Przyjmujemy taką oto definicję *absurdu*:

```lean
def Absurd : Prop := (a : Prop) → a
```
Za pomocą instrukcji `section` wejdziemy teraz do strefy bezpiecznych eksperymentów logicznych i w
tej strefie za pomocą instrukcji `variable` *zadeklarujemy*, że mamy dowód absurdu, czyli term typu
`Absurd`. Ponieważ termy typu `Absurd` *są* funkcjami, możemy je aplikować. Użyjemy więc tego termu
/ dowodu / funkcji do zdania `Ponury Krystian`. W ten sposób *lokalnie*, bo tylko wewnątrz
utworzonej sekcji, udowodnimy to zdanie:


```lean
section strefa_komfortu

    variable (jadro_ciemnosci : Absurd)

    -- jadro_ciemnosci (Ponury Krystian) jest dowodem prawdziwości zdania Ponury Krystian
    #check jadro_ciemnosci (Ponury Krystian) -- jadro_ciemnosci (Ponury Krystian) : Ponury Krystian

end strefa_komfortu

#check jadro_ciemnosci -- Lean sygnalizuje tutaj błąd, a więc poza strefą komfortu jeteśmy bezpieczni
```

Jeżeli skopiujesz wszystkie dotychczasowe fragmenty kodu Leana, to po umieszczeniu kursora na
komendzie `#check` zobaczysz, że uzyskujemy w ten sposób lokalny dowód zdania, że hipotetyczny
żniwiarz Krystian jest ponury. Powinno być dla Ciebie jasne, że tak samo możemy uzyskać dowód
dowolnego innego zdania.

Uzyskaliśmy tutaj *jakiś* dowód, który możemy skonstruować *w tym kontekście* (w tej sekcji) i w tym
*lokalnym* kontekście ten dowód jak najbardziej obowiązuje. Nie jest to jednak *prawda uniwersalna*,
bo skorzystaliśmy z hipotetycznego dowodu absurdu, którego nie zadeklarowaliśmy poza lokalnym
kontekstem. Mieliśmy właśnie do czynienia z *eksplozją dedukcyjną*.

*Ex falso quodlibet.*

*Z Fałszu wynika wszystko.*

Inna nazwa na absurd to *fałsz*.

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
wszystkie typy funkcyjne (nie funkcje) postaci `A → B → ... → Q`, gdzie `Q` *ma* typ `Prop`, *same
mają typ `Prop`*:

```lean
variable (p : Prop) -- deklarujemy, że mamy zdanie p, żeby Lean "wiedział", o czym będziemy "mówić"

#check Type → p -- Type → p : Prop
#check Type → Type → p -- Type → Type → p : Prop
#check (Type → Type) → p -- (Type → Type) → p : Prop
#check Prop → p -- Prop → p : Prop
#check p → p -- p → p : Prop
-- i tak dalej
```

Powód przyjęcia w Lean tej konwencji nie będzie nas teraz interesował, ale musimy oswoić się z tym,
że `Absurd` jest *zdaniem*, a więc typem, który jednak *w pewnym sensie* przyjmuje dowolne zdania
jako argumenty, czyli jest *typem / zdaniem parametrycznym*. `Absurd` jest więc przykładem *typu
zależnego*. Ponieważ to właśnie między innymi dzięki typom zależnym możemy naturalnie formalizować
dowolne treści matematyczne, zależy mi, żebyś zrozumiał/a, jak takie typy działają.

Napisałem, że `Absurd` przyjmuje zdania jako argumenty, ale chyba rozumiesz już trochę, że to nie
całkiem prawda. `Absurd` *nie* jest *funkcją*, tylko *typem*, nie możemy go więc do niczego
aplikować. Mimo to jednak `Absurd` *ma coś z funkcji*, bo *zawiera fragment kodu*. Nie mamy jeszcze
żadnego termu typu `Absurd`, ale gdybyśmy mieli, to *aplikując ten term* (a nie *aplikując typ
`Absurd`*) do zdania, uzyskalibyśmy dowód tego zdania. Wiem, że to może być dezorientujące. Jeżeli
jest, to sygnał, że uczysz się czegoś *nowego*.

Wyobraźmy sobie, że mamy `d : Absurd` (term typu `Absurd`) i `p : Prop` (jakieś zdanie `p`). Wtedy
możemy zapisać aplikację `d p`. Wystarczy rozpakować definicję stałej `Absurd`, żeby zobaczyć, że:

```lean
-- Wersja z nierozpakowaną definicją typu Absurd
d : Absurd
-- oznacza to samo, co
d : (a : Prop) → a
-- bo tak mówi definicja typu Absurd.
```

Czyli `d` jest jakąś funkcją (bo ma w swoim typie strzałkę), która *z dowolnego zdania `a` robi
dowód zdania `a`*. To znaczy dokładnie to samo, co: z dowolnego zdania robi dowód *tego*
zdania. Widzisz, że `a` jest tutaj tylko nazwą parametru, a nazwy parametrów służą wyłącznie do
tego, żeby można było mówić o ich wartościach w taki sam sposób, w jaki właśnie użyliśmy zaimka
*tego*, tylko za pomocą symboli?

To:

`(a : Prop) → a`

znaczy to samo, co to:

Typ funkcji, które z dowolnego zdania (termu `a` typu `Prop` - `(a : Prop)`) robią dowód *tego*
zdania (term typu `a`).

W przypadku zwykłych funkcji, takich jak `dodaj2`, ustalenie typu ich aplikacji jest trywialne. Na
przykład, typ aplikacji `dodaj2` do termu `10` to `Nat`, bo jeżeli funkcja typu `Nat → Nat`
"dostanie" argument typu `Nat`, to typem tej aplikacji będzie to, co zwróciłaby, gdybyśmy tą
aplikację ewaluowali, a zwróciłaby term typu `Nat`, `10 + 2` to przecież liczba naturalna.

W tym przypadku typ aplikacji możemy ustalić przez samo "oderwanie" typu parametru `Nat`,
występującego jako pierwszy w typie tej funkcji, czyli w `Nat → Nat`: Jeżeli coś, co przerabia
liczby w liczby, dostanie liczbę, to rezultatem będzie liczba, co wiemy z góry, nie obliczając
jeszcze tego rezultatu, to jest już na etapie samej aplikacji. Oczywiste, prawda? 

Teraz jednak chcę zwrócić Twoją uwagę na coś trochę mniej oczywistego. Sam zapis tej aplikacji
współwystępuje z dokonaniem się pewnego *"obliczenia"* (polegającego na oderwaniu typu argumentu)
*na poziomie typów*. To jest może bardzo proste "obliczenie", ale jednak jakieś "obliczenie". Mamy
więc *dwa*, jakościowo różne rodzaje "obliczeń" - te, które zachodzą w ramach samych *aplikacji* i
te, które zachodzą w momencie *ewaluacji*.

Żeby ustalić, jaki byłby typ aplikacji termu (i jednocześnie funkcji) `d` typu `(a : Prop) → a` do
zdania `p`, czyli jaki byłby typ `d p`, musimy wykonać bardziej złożone "obliczenie". Musimy *nie
tylko* "oderwać" fragment `(a : Prop)`, który określa typ argumentu termu / funkcji `d`, ale również
*podstawić* zdanie `p` pod parametr typu `a` w tej części, która zostaje po oderwaniu. W ten sposób
fragment kodu (`(a : Prop) → a`), zapisany w definicji typu `Absurd`, "działa" już w momencie
wystąpienia samej aplikacji.

Czy dostrzegasz już, że takie "obliczenie", z podstawianiem lub bez, *musi* się zawsze automatycznie
dokonać "w momencie" wystąpienia jakiejkolwiek aplikacji? Gdy typ jest parametryczny, podstawianie
jest "tym bardziej konieczne", bo gdyby na przykład nie zaszło automatyczne podstawianie na poziomie
typu, to aplikacja `d p` miałaby typ `a`, co dla Leana *nie miałoby sensu*, ponieważ *nie byłoby
nigdzie informacji, czym jest `a`*.

Mówiąc to samo, ale trochę (nareszcie?) krócej, termy / funkcje typu `Absurd` z termów typu `Prop`,
które są jednocześnie typami i zdaniami, robią termy tych typów, czyli dowody tych zdań. W ten
sposób sam akt aplikacji "wywołuje automatyczne obliczanie" na poziomie typu. Korzystała/eś z tego
wcześniej wykonując polecenia, na przykład, dowodząc i używając twierdzenia `t1`, ale mogło Ci się
to nie rzucać w oczy, bo w praktyce to jest bardzo naturalny proces. Zastanawiam się nawet, czy
rozwlekłym tłumaczeniem nie powoduję, że trudniej Ci się z tym oswoić.

**Motywator**: Jeżeli czujesz w tym momencie, że nie jesteś w stanie tego wszystkiego zrozumieć,
proszę, nie zrażaj się. Ucząc się tych treści możesz naprawdę daleko zajść koncentrując się na
*praktyce* kodowania i dowodzenia. Świadomość tego, co właściwie robisz, będzie i tak powoli rosła,
trzeba tylko czasu.

Na wszelki wypadek podkreślam, że przyjęta przez nas właśnie definicja to nie żadna prawda objawiona
na temat "istoty absurdu"; to jest tylko *wybór terminologiczny i pojęciowy*, który możemy wyrazić
poprawnie w języku teorii typów zależnych. To jest więc coś, na co musimy się wspólnie umówić, żeby
nasza dalsza komunikacja miała sens.

Zwracam też uwagę, że `Absurd` *nie* ma struktury predykatu. Moglibyśmy na przykład aksjomatycznie
zdefiniować jako oznaczającą "generyczny" typ stałą `Zniwiarz`, a stałą `Ponury` jako predykat
dotyczący żniwiarzy:

```lean
axiom Zniwiarz : Type
axiom Krystian : Zniwiarz
axiom Ponury : Zniwiarz → Prop
```

`Ponury` byłby wtedy *funkcją* (z typu `Zniwiarz` do *typu zdaniowego `Prop`*), a *nie*, jak
`Absurd`, *typem funkcji*. Predykat `Ponury` możemy więc aplikować (do termów typu `Zniwiarz`), a
`Absurd`u nie możemy aplikować, możemy aplikować tylko termy typu `Absurd`.

Aplikacja *samego predykatu* do *termu, którego ten predykat dotyczy*, jest *zdaniem*. Aplikacja
*dowodu absurdu* - a nie *samego absurdu* - do *zdania* jest *dowodem tego zdania*.

```lean
#check Ponury Krystian -- Ponury Krystian : Prop
```

Zdanie `Ponury Krystian`, będące pewną aplikacją, mówi, że Krystian jest ponury(m żniwiażem). To
jest tylko zdanie, a nie jego *asercja* (nie zapis jego dowodu). Na tym etapie nie wiemy jeszcze,
czy Krystian jest faktycznie ponury. Można powiedzieć, że tylko "rozważamy" albo "wyrażamy taką
"ewentualność". Nie da się aplikować absurdu do tego zdania, bo nasz absurd jest typem funkcyjnym, a
nie funkcją. Możemy "aplikować absurd" dopiero gdy go "uzbroimy w dowód", co też wcześniej
zrobiliśmy, w naszej strefie logicznego (dys)komfortu.

## Negacja w logice konstruktywnej

Negacja jest operatorem jednoargumentowym, który z dowolnego zdania `p` tworzy negację tego zdania,
`¬p`, która też jest, oczywiście, zdaniem. Możemy to zdanie / typ konsekwentnie interpretować jako
*nieprawda, że `p`*.

Każde zdanie postaci `¬p` jest *potencjalnym* [*granatem
odłamkowym*](https://pl.wikipedia.org/wiki/Granat_od%C5%82amkowy), a `¬` jest jego *dźwignią*. Każdy
*term typu `¬p`* (dowód typu / zdania `¬p`) jest *realnym* granatem odłamkowym. W przypadku
wystąpienia *aplikacji termu typu `¬p` do termu typu `p`* granat `¬p` zostaje *uruchomiony* przez
*mechanizm sprzeczności*: każda taka aplikacja jest *dowodem fałszu* albo *dowodem
absurdu*. Aplikując tą aplikację (sic!) do dowolnego *zdania* `q` wywołujemy *wybuch* granatu i jako
*odłamek* tego wybuchu uzyskujemy *term typu `q`* czyli *dowód zdania `q`*[^1].

**Definicja negacji w logice konstruktywnej**: Negacja zdania `p` to funkcja / implikacja, która
jest zdaniem / typem, dającym się konsekwentnie interpretować jako zdanie *Z `p` wynika absurd /
fałsz*, albo *Gdyby `p` było prawdą, nastąpiłaby apokalipsa*:

```lean
def nie (p : Prop) : Prop := p → Absurd
```

Symbol `¬` działa w Lean podobnie (ale nie całkiem tak samo) jak zdefiniowana właśnie stała `nie`.

**Polecenie**: Aby uzyskać w Lean symbol negacji `¬`, wpisz `\neg`, po czym usuń ten symbol.

Z powodów technicznych, które nie będą nas interesować, definicja stałej `absurd` (z małej litery) w
Lean ma inny sens i jest bardziej skomplikowana (tylko ją tutaj pokazuję, nie próbuj jej zrozumieć,
jeśli dopiero się uczysz):

```lean
#print absurd
-- def absurd.{v} : {a : Prop} → {b : Sort v} → a → ¬a → b :=
-- fun {a} {b} h₁ h₂ => False.rec (fun x => b) ⋯
```

Różnica wynika stąd, że ta definicja nie wyraża przyjętej przez nas treści pojęcia absurd, tylko
korzysta z tego pojęcia, żeby można go było wygodnie używać w dowodach. Uspokajam - szczegóły tej
definicji nie będą nas interesować.

**Ostrzeżenie**: Ponieważ zależy mi, żebyś nauczył/a się posługiwać tymi pojęciami bez pomocy, odtąd
będę rzadziej przypominał o różnicach między zdaniem jako takim, istnieniem dowodu zdania,
arbitralnym dowodem zdania i konstrukcją czy definicją dowodu zdania. Być może już teraz Ci to
pomoże, bo ludzie na ogół nie są w stanie jednocześnie świadomie rozwiązywać problemów w więcej niż
jednym wymiarze pojęciowym czy teoretycznym. Ja na pewno tego nie potrafię.

Będę też rzadziej przypominał o różnicy między kodem i jego interpretacją, a więc na przykład między
zdaniami i typami, albo termami typów zdaniowych i ich dowodami, ale z innego powodu - zależy mi,
żebyś poczuł/a, że te różnice można zwykle spokojnie zignorować i żebyś dzięki temu nauczył/a się
myśleć w całkiem nowy sposób.

W następnej części zapoznamy się z rachunkiem predykatów wyższego rzędu. Pokazałem Ci już, jak można
używać bladego cienia tej teorii, żeby prześwietlać zawiłości dowodów na istnienie Boga. Gdy go
trochę bardziej poznamy, wtedy dokładnie to samo, tylko znacznie lepiej, będziemy mogli zrobić z
rozumowaniami formułowanymi przez autorów psychologicznych badań i teorii. Jeżeli moje wyznanie nie
zmotywowało Cię, żeby mi nadal towarzyszyć, to trudno, rozumiem, ale i tak będę sobie wyobrażał, że
piszę to wszystko dla Ciebie, bo tak jest mi po prostu łatwiej.

### Przypisy

[^1]: Terminologia "granatowa" to oczywiście żart.
