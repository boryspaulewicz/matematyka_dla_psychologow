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
jest zdaniem / typem, dającym się konsekwentnie interpretować jako zdanie *z `p` wynika absurd /
fałsz*, albo *gdyby `p` było prawdą, nastąpiłaby apokalipsa*:

```lean
def nie (p : Prop) : Prop := p → Absurd
```

Symbol `¬` działa w Lean podobnie (ale nie całkiem tak samo) jak zdefiniowana właśnie stała `nie`.

**Polecenie**: Aby uzyskać w Lean symbol negacji `¬`, wpisz `\neg`, po czym usuń ten symbol.

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

Myślę, że jesteś już gotowa/y, żeby poćwiczyć dowodzenie zdań zawierających negację. Ale muszę się
zastanowić, jakie zadanie Ci zaproponować. Wiemy, że negacja to szczególny rodzaj
implikacji. Zadanie może polegać na *uzyskaniu* dowodu negacji wewnątrz jakiejś formuły logicznej,
albo na jej *użyciu*. Zacznijmy od użycia. Żeby skonstruować takie zadanie, muszę stworzyć zdanie, w
którym negacja będzie odgrywała rolę przesłanki. Może takie `¬p → q`? No nie, z tym nic się nie da
zrobić, bo są tylko dwa zdania, a żeby użyć (dowodu) `¬p` trzeba mieć również (dowód) `p`. To może
tak: `¬p → q → p`? Też bez sensu. Przecież z `¬p` i `q` nie może wynikać `p`. Zaraz, ze sprzeczności
wynika każde zdanie, a więc też zdanie `q`. Już wiem.

**Zadanie**: Udowodnij twierdzenie `¬p → p → q`. To zdanie składa się z dwóch różnych zdań
atomowych, `p` i `q`, więc Lean musi wiedzieć, lokalnie, to znaczy *wewnątrz dowodu*, że to są
zdania. Jednocześnie to mają być *zmienne*, za które chcemy móc podstawiać dowolne zdania w
przyszłości, stosując konstruowane twierdzenie. W takim razie "zdaniowość" nazw `p` i `q` musi być
zapisana jako argumenty twierdzenia jako funkcji:

```lean
theorem t1 (p : Prop) (q : Prop) : ¬p → p → q := by
-- Gdy kursor będzie w następnej linijce po tym komentarzu, znajdziesz się w trybie
-- dowodzenia interaktywnego.
```

Mamy do udowodnienia implikację, której następnik jest implikacją. Pamiętasz konwencję dotyczącą
nawiasów w takich implikacjach? Zdania `¬p → p → q` i `¬p → (p → q)` są tym samym zdaniem, bo
strzałka wiąże z prawej. Poprzednikiem tej implikacji jest `¬p`, a jej następnikiem jest `(p → q)`.

Wiesz już, że udowodnienie tej implikacji polega na udowodnieniu następnika `(p → q)` zakładając
poprzednik `¬p`. Wiesz też, że gdy założysz ten poprzednik, używając komendy `intro` z wybraną przez
siebie nazwą na hipotetyczny dowód `¬p`, to zostanie jako cel do udowodnienia prostsze zdanie `(p →
q)`. A żeby udowodnić to prostsze zdanie trzeba znowu założyć poprzednik, w ten sam sposób, tylko
używając innej nazwy. Wtedy zostanie tylko zdanie `q`. Jedynym sposobem, żeby udowodnić to ostatnie
zdanie, będzie skorzystanie z tego, co już w tym momencie będziesz miał/a, czyli z hipotetycznych
dowodów zdań `¬p` i `p`. Byłbym zapomniał - masz przecież jeszcze coś w kontekście: zdania jako
takie (a nie ich dowody), `p` i `q`, które są parametrami twierdzenia-funkcji `t1`, a więc muszą być
wewnątrz tego twierdzenia dostępne. Pozostanie Ci użyć komendy `exact` z odpowiednim termem. I w tym
momencie muszę objaśnić różnicę, między moją definicją absurdu i definicją Leana.

**Absurd w Leanie**: Żeby skorzystać z eksplozji dedukcyjnej do udowodnienia dowolnego zdania w
Leanie, można zastosować taktykę `absurd`. Stosujemy ją do dwóch (być może złożonych) termów,
jakiegoś dowodu tego samego zdania w wersjach "pozytywnej" i "negatywnej" (dowodu negacji tego
zdania), *w tej kolejności*. Kolejność jest myląca, bo przecież jeśli negacja `p` jest implikacją z
`p` do fałszu, to powinniśmy stosować dowód negacji `p` do dowodu `p`, a wtedy kolejność jest
odwrotna. No trudno, taka konwencja (jest też głębszy powód, ale go pominiemy).

Gdy jesteś w trybie dowodzenia interaktywnego, to Lean "zakłada" (Lean nie jest działającym celowo
agentem, więc właście nigdy nic nie "robi", ale możemy chyba tak powiedzieć), że chcesz udowodnić
cel, więc jeśli tylko wpiszesz `exact absurd` z dwoma (być może złożonymi) argumentami, to jest
dowodem tego samego zdaniem w wersjach "pozytywnej" i "negatywnej" (jeszcze raz - w tej kolejności),
to nie będzie trzeba już dodawać zdania-celu jako trzeciego argumentu. Od razu nastąpi eksplozja
dedukcyjna i cokolwiek, co było w tym momencie do udowodnienia, zostanie udowodnione.

Jeśli masz odwagę, możesz spróbować skonstruować ten sam dowód w trybie nieinteraktywnym,
konstruując funkcję dowodu `¬p`, zwracającą funkcję dowodu `p`, zwracającą dowód `q`:

```lean
theorem t1' (p : Prop) (q : Prop) : ¬p → p → q := 
    fun (h1 : ¬p) => 
        fun (h2 : p) => 
            -- W linijce poniżej trzeba wpisać term, który jest w tym miejscu dowodem zdania q
```

Widzisz jednoznaczny związek z tym, w jaki spośób konstruowała/eś przed chwilą ten sam dowód w
trybie interaktywnym? W trybie nieinteraktywnym nie zadziała komenda `exact`, ani `intro`, ani żadna
inna taktyka. Możesz wejść w dowolnym miejscu w tryb interaktywny pisząc `by` i zakończyć dowód
używając `exact` tak jak wcześniej. Albo możesz nauczyć się czegoś nowego: jeżeli otoczysz aplikację
`h1` do `h2` (znana nam, "naturalna" metoda wywoływania eksplozji dedukcyjnej) nawiasami, to gdy
dopiszesz zaraz za prawym nawiasem kropkę i napiszesz `elim` (od angielskiego *elimination*, czyli
eliminacji, co w logice oznacza *użycie* albo *wykorzystanie* danego termu), to uzyskasz (przez
*odrywanie*, czyli *modus ponens*, czyli zastosowanie {dowodu} implikacji do {dowodu} jej
poprzednika, czyli zastosowanie funkcji do odpowiedniego dla niej argumentu) fałsz, który od razu
zakończy dowód, tak jak w trybie interaktywnym natychmiast zakończyło dowód zastosowanie taktyki
`absurd`. Najlepiej spróbuj obydwu sposobów.

Teraz muszę jeszcze wymyślić jakieś proste zadanie, które będzie polegało na *uzyskaniu* negacji. No
ale negacja to szczególny rodzaj implikacji (funkcji), której następnikiem jest absurd / fałsz
(która zwraca dowód absurdu / fałszu). Żeby taka funkcja mogła zwrócić dowód fałszu, ten fałsz musi
się skądś wziąć, nie mogą w tym zadaniu występować same zdania "pozytywne". Nie możemy też po prostu
w tym zdaniu-zadaniu założyć dowodu *samego fałszu*, a raczej możemy, ale to byłoby trywialne, bo
wtedy dało by się udowodni *każde* zdanie. A więc musimy w początkowej części zdania założyć jakaś
negację, żeby uzyskać z niej (inną, żeby nie było już całkiem trywialnie) negację.

Może tak: `¬q → p ̀→ ¬p`? No nie, z `¬q` i `p` w żaden sposób nie uzyskamy `¬p`, bo `¬q` i `p` nie
wejdą ze sobą (bez dodatkowych przesłanek) w żadną "interakcję". A z `q` i `¬q`?  Zakładając
(dowody) tych dwóch zdań uzyskamy dowód każdego zdania, a to jest już moim zdaniem dla Ciebie zbyt
łatwe. Okazuje się, że muszę albo wprowadzić zasadę wyłączonego środka (a więc logikę klasyczną),
albo coś innego, czego jeszcze Ci nie wytłumaczyłem. No to może z tym jeszcze poczekam. Zamiast tego
zaproponuję Ci zadanie w zasadzie takie samo jak ostatnie, jednak zamiast zdań atomowych będą zdania
złożone z predykatów. I jeszcze może niech te predykaty dotyczą liczb naturalnych, czemu nie? Być
może trzeba będzie otoczyć niektóre aplikacje predykatów do parametru twierdzenia `n` nawiasami.

**Zadanie**: Udowodnij poniższe twierdzenie.

```lean
theorem t2 (P : Nat → Prop) (Q : Nat → Prop) (n : Nat) : `¬ P n → (P n → Q n)` := by
```

Zwróć uwagę, że musieliśmy dodać parametr `n` typu `Nat`, bo inaczej nie byłoby żadnych zdań. Sam
predykat, na przykład, samo `Ponury`, nie jest zdaniem, dopiero, dajmy na to, `Ponury Krystian`
jest. Wewnątrz dowodu twierdzenia `t2` od samego początku są więc trzy elementy: (jakieś) dwa
predykaty dotyczące liczb - `P` i `Q` - i (jakaś) liczba naturalna `n`.

Na koniec powiem Ci jeszcze, że w Lean zdanie `¬p` to tak naprawdę zdanie `p → False`. Trochę
namieszałem, wiem, ale mam dobre powody (w każdym razie tak będę sobie dalej mówił).

### Przypisy

[^1]: Terminologia "granatowa" to tutaj oczywiście żart.
