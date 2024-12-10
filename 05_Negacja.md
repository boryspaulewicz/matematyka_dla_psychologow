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

`Absurd` jest pewnym *zdaniem*, jak bowiem widać z definicji ma typ zdaniowy `Prop`. Wynika to stąd,
że wszystkie typy funkcyjne postaci `A → B → ... → Q`, gdzie `Q` ma typ `Prop`, *same mają typ
`Prop`*. Powód przyjęcia w Lean tej konwencji nie będzie nas teraz interesował, ale musimy oswoić
się z tym, że `Absurd` jest *zdaniem, które na poziomie typów przyjmuje dowolne zdania jako
argumenty*, czyli *typem / zdaniem parametrycznym*.

Napisałem, że `Absurd` przyjmuje zdania jako argumenty, ale chyba rozumiesz już trochę, że to nie
całkiem prawda. `Absurd` *nie* jest *funkcją*, tylko *typem*, nie możemy go więc do niczego
aplikować. Mimo to jednak `Absurd` ma coś z funkcji, bo zawiera fragment kodu. Nie mamy jeszcze
żadnego termu typu `Absurd`, ale gdybyśmy mieli, to *aplikując ten term*, a nie *aplikując typ
`Absurd`*, do zdania, uzyskalibyśmy dowód tego zdania.

Na przykład, mając `d : Absurd` i `p : Prop` moglibyśmy zapisać aplikację `d p`. Żeby ustalić, jaki
byłby typ tej aplikacji, musimy podstawić zdanie `p` pod *parametr typu* (a *nie* żadnej funkcji)
`a`. Funkcje typu `Absurd` z termów typu `Prop`, które są jednocześnie typami i zdaniami, robią
termy tych typów, czyli dowody tych zdań. W ten sposób sam akt aplikacji "wywołuje automatyczne
obliczanie" na poziomie typu. Korzystała/eś z tego już wcześniej wykonując polecenia, na przykład
dowodząc i używając twierdzenia `t1`, ale nie rzucało Ci się to w oczy, bo w praktyce to jest bardzo
naturalny proces.

**Motywator**: Jeżeli czujesz w tym momencie, że nie jesteś w stanie tego wszystkiego zrozumieć,
proszę, nie zrażaj się. Ucząc się tych treści możesz naprawdę daleko zajść koncentrując się na
*praktyce* kodowania i dowodzenia. Meta-teoretyczna świadomość tego, co robisz, będzie i tak powoli
rosła, trzeba tylko czasu.

Na wszelki wypadek podkreślam, że przyjęta przez nas właśnie definicja to nie żadna prawda objawiona
na temat "istoty absurdu"; to jest tylko *wybór terminologiczny i pojęciowy*, który możemy wyrazić
poprawnie w języku teorii typów zależnych. To jest coś, na co musimy się wspólnie umówić, żeby nasza
dalsza komunikacja miała sens.

Zwracam uwagę, że `Absurd` *nie* ma struktury predykatu. Moglibyśmy na przykład aksjomatycznie
zdefiniować jako oznaczającą "generyczny" typ stałą `Zniwiarz`, a stałą `Ponury` jako predykat
dotyczący żniwiarzy. `Ponury` byłby wtedy typem funkcyjnym z typu `Zniwiarz` do *typu zdaniowego
`Prop`*, a *nie*, jak `Absurd`, funkcją z typu `Zniwiarz` do *termów typu `Prop`*.

Aplikacja *predykatu* do *termu, którego ten predykat dotyczy*, jest *zdaniem*. Aplikacja *absurdu*
do *zdania* jest *dowodem tego zdania*.

```lean
axiom Zniwiarz : Type
axiom Krystian : Zniwiarz
axiom Ponury : Zniwiarz → Prop
#check Ponury Krystian -- Ponury Krystian : Prop
```

Zdanie `Ponury Krystian` mówi, że Krystian jest ponury(m żniwiażem), ale to tylko zdanie, a nie jego
*asercja*; na tym etapie nie wiemy jeszcze, czy Krystian jest faktycznie ponury. Można powiedzieć,
że tylko "rozważamy" albo wyrażamy formalnie taką "ewentualność". Nie da się *aplikować absurdu* do
tego zdania, bo nasz absurd jest *typem funkcyjnym*, a nie *funkcją*.

Wejdziemy teraz do strefy bezpiecznych eksperymentów logicznych (za pomocą instrukcji `section`) i w
tej strefie *zadeklarujemy* (za pomocą instrukcji `variable`), że mamy *dowód absurdu*, czyli *term
typu `Absurd`*. Ponieważ termy typu `Absurd` *są* funkcjami, możemy je *aplikować*. Użyjemy więc
tego termu / dowodu, na mocy definicji stałej `Absurd` będącego termem typu funkcyjnego, czyli
funkcją, do *samego zdania* `Ponury Krystian` *jako takiego*. W ten sposób *lokalnie udowodnimy* to
zdanie:


```lean
section strefa_komfortu

    variable (jadro_ciemnosci : Absurd)

    #check jadro_ciemnosci (Ponury Krystian) -- jadro_ciemnosci (Ponury Krystian) : Ponury Krystian

end strefa_komfortu

#check jadro_ciemnosci -- Lean sygnalizuje tutaj błąd, a więc poza strefą komfortu jeteśmy bezpieczni
```

Jeżeli skopiujesz wszystkie dotychczasowe fragmenty kodu Lean'a, to po umieszczeniu kursora na
komendzie `#check` zobaczysz, że uzyskujemy w ten sposób lokalny dowód, że hipotetyczny żniwiarz
Krystian jest ponury. Powinno być dla Ciebie jasne, że tak samo możemy uzyskać dowód dowolnego
innego zdania. 

Uzyskaliśmy tutaj *jakiś* dowód, który możemy skonstruować *w tym kontekście* i w tym *lokalnym*
kontekście ten dowód jak najbardziej obowiązuje. Nie jest to jednak *prawda uniwersalna*, bo
skorzystaliśmy z hipotetycznego dowodu absurdu, a *z absurdu wynika wszystko*. Stanęliśmy oto w
obliczu *eksplozji dedukcyjnej*.

Niechaj wszystkie istoty, żywe i martwe, pokłonią się przed potęgą typów zależnych.

*Ex falso quodlibet.*

*Z Fałszu wynika wszystko.*

Inna nazwa na absurd to *fałsz*.

## Negacja w logice konstruktywnej

Negacja jest operatorem jednoargumentowym, który z każdego zdania `p` tworzy negację tego zdania,
`¬p`, która też jest zdaniem. Możemy to zdanie / typ konsekwentnie interpretować jako *nieprawda, że
`p`*.

Każde zdanie postaci `¬p` jest [*potencjalnym granatem
odłamkowym*](https://pl.wikipedia.org/wiki/Granat_od%C5%82amkowy), a `¬` jest jego *dźwignią*. Każdy
*term typu `¬p`* (dowód typu / zdania `¬p`) jest *realnym* granatem odłamkowym. W przypadku
wystąpienia *aplikacji termu typu `¬p` do termu typu `p`* granat `¬p` zostaje *uruchomiony* przez
*mechanizm sprzeczności*: każda taka aplikacja jest *dowodem fałszu* albo *dowodem
absurdu*. Aplikując tą aplikację (sic!) do dowolnego *zdania `q`* wywołujemy *wybuch* granatu i jako
*odłamek* tego wybuchu uzyskujemy *term typu `q`* czyli *dowód zdania `q`*[^1].

**Definicja negacji w logice konstruktywnej**: Negacja zdania `p` to funkcja / implikacja, która
jest zdaniem / typem, które możemy konsekwentnie interpretować jako zdanie *z `p` wynika absurd /
fałsz*, albo *gdyby `p` było prawdą, nastąpiłaby apokalipsa*:

```lean
def nie (p : Prop) : Prop := p → Absurd
```

Symbol `¬` działa w Lean tak jak zdefiniowana właśnie stała `nie`.

**Polecenie**: Aby uzyskać w Lean symbol negacji `¬` wpisz `\neg`, po czym usuń ten symbol.

Z powodów technicznych, które nie będą nas interesować, definicja absurdu w Lean ma inny sens i jest
też bardziej skomplikowana:

```lean
#print absurd
-- def absurd.{v} : {a : Prop} → {b : Sort v} → a → ¬a → b :=
-- fun {a} {b} h₁ h₂ => False.rec (fun x => b) ⋯
```

Różnica wynika stąd, że ta definicja nie wyraża przyjętej przez nas treści pojęcia, tylko korzysta z
tego pojęcia, żeby można go było wygodnie używać w dowodach. Jeszcze raz podkreślam, że szczegóły
tej definicji nie będą nas interesować.

**Ostrzeżenie**: Ponieważ zależy mi, żebyś nauczył/a się sprawnie posługiwać tymi pojęciami bez
mojej pomocy, od tego momentu będę rzadziej przypominał o różnicach między zdaniem jako takim,
istnieniem dowodu zdania, arbitralnym dowodem zdania i konstrukcją czy definicją dowodu
zdania. Tobie to też jak sądzę wyjdzie na dobre, bo ludzie na ogół nie są w stanie jednocześnie
świadomie rozwiązywać problemów w więcej niż jednym wymiarze pojęciowym czy teoretycznym.

Będę też rzadziej przypominał o różnicy między kodem i jego interpretacją, a więc na przykład między
zdaniami i typami, albo termami typów zdaniowych i ich dowodami, ale z innego powodu - zależy mi,
żebyś poczuł/a, że te różnice można zwykle spokojnie zignorować i żebyś dzięki temu nauczył/a się
myśleć w całkiem nowy sposób.

## Negacja w praktyce dowodzenia

cdn

### Przypisy

[^1]: Terminologia "granatowa" to tutaj oczywiście żart.