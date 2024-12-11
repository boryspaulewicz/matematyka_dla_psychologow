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

# Negacja w praktyce dowodzenia

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
(funkcji która zwraca dowód absurdu / fałszu). Żeby taka funkcja mogła zwrócić dowód fałszu, ten
fałsz musi się skądś wziąć, nie mogą w tym zadaniu występować same zdania "pozytywne". Nie możemy
też po prostu w tym zdaniu-zadaniu założyć dowodu *samego fałszu*, a raczej możemy, ale to byłoby
trywialne, bo wtedy dało by się udowodni *każde* zdanie. 

Może tak: `¬q → p ̀→ ¬p`? No nie, z `¬q` i `p` w żaden sposób nie uzyskamy `¬p`, bo `¬q` i `p` nie
wejdą ze sobą (bez dodatkowych przesłanek) w żadną "interakcję". A z `q` i `¬q`?  Zakładając
(dowody) tych dwóch zdań uzyskamy dowód każdego zdania, a więc także negacji dowolnego zdania, ale
to jest już moim zdaniem dla Ciebie zbyt łatwe. Wydaje mi się, że muszę albo wprowadzić zasadę
wyłączonego środka (a więc logikę klasyczną), albo coś innego, czego jeszcze Ci nie
wytłumaczyłem. No to może z tym jeszcze poczekam?

Następnego dnia po napisaniu tego ostatniego fragmentu obudziłem się rano (true story) i od razu
wpadłem na pomysł, jak ugryźć problem tego zadania. Zaproponuję Ci nie jedno, a dwa zadania na ten
temat. Oba będą ważne.

W Lean zdanie `¬p` to tak naprawdę zdanie `p → False`. Podobne do naszego, bo też `False` spełnia tą
samą rolę co nasz `Absurd`, jednak trzeba napisać trochę coś innego, żeby użyć `False` niż my
piszemy, żeby użyć naszego `Absurd`. Trochę namieszałem, wiem, ale miałem dobry powód (w każdym
razie tak będę sobie wmawiał). Tak więc "z *fałszu* wynika wszystko"? Może nie masz już co do tego
wątpliwości, jeśli przez fałsz rozumiemy nasz `Absurd`, ale żeby z jakiegoś "fałszu samego" wynikało
wszystko? Co by to miało w ogóle znaczyć?

W innej części tego skryptu (który, teraz sobie myślę, może będzie kiedyś niby-książką) przekonamy
się, czym *w istocie* jest fałsz w logice, *z pewnego* bardzo dziwnego *punktu widzenia* (widzisz
napięcie, a może nawet coś w rodzaju sprzeczności, między trzema fragmentami napisanymi w tym zdaniu
pismem pochyłym?). No więc w jaki sposób niby z fałszu ma wynikać wszystko? Następne zadanie to nie
*odpowiedź* na to pytanie, to tylko *ilustracja*, ale ilustracja to już coś:

**Zadanie**: Każdy dowód fałszu jest "wyposażony" w sposób użycia o nazwie `elim`. Gdy mamy jakiś
dowód fałszu, możemy go użyć do udowodnienia dowolnego zdania aplikując `False.elim` do tego dowodu,
co możemy zapisać również krócej, jako nazwę dowodu, zaraz potem (bez spacji) kropkę i zaraz potem
`elim`. Dla Lean te dwa sposoby zapisu znaczą to samo. Udowodnij poniższe twierdzenie, najpierw
korzystając z trybu interaktywnego, a potem konstruując kod dowodu podobnie, jak to do tej pory
robiliśmy (wtedy nie może się pojawić w kodzie konstrukcji ciała twierdzenia komenda `by`).

```lean
theorem ex_falso_quodlibet (p : Prop) : False → p := by
```

Jeżeli skonstruowałe/aś kod dowodu powyższego twierdzenia nieinteraktywnie, to musiała/eś skorzystać
z faktu, że `False` jest *typem* (typem argumentu funkcji, którą skonstruowała/eś), poza tym fałsz
jest poprzednikiem implikacji. Wygląda więc na to, że fałsz jest *zdaniem fałszywym*. Widzisz, że
coś tu nie gra?  Przecież zdanie jako takie nie może być ani prawdziwe, ani fałszywe. Może to *nie*
jest *zdanie fałszywe*, tylko jakiś "fałsz jako taki"? Zawsze możemy o takie rzeczy zapytać Leana:

```lean
#check False -- False : Prop
```

Jednak zdanie. Ciekawe? Moim zdaniem bardzo. Wrócimy do tego.

Mam nadzieję, że już niemal *widzisz*, że w początkowej części udowadnianego zdania, albo gdzieś
"wcześniej", a może "wyżej", przed dowodzonym zdaniem, na przykład jako (globalny) aksjomat, *musimy
założyć lub uzyskać dowód negacji albo fałszu, żeby w dowodzonym zdaniu uzyskać negację*.

Zaproponuję Ci jeszcze zadanie w zasadzie takie samo poprzednie, jednak zamiast zdań atomowych będą
zdania złożone z predykatów. I jeszcze może niech te predykaty dotyczą liczb naturalnych, bo ten tym
już trochę znasz.  Być może trzeba będzie otoczyć niektóre aplikacje predykatów (jakiejś, bo to
parametr twierdzenia-funkcji `t2`) liczby naturalnej `n` nawiasami.

**Zadanie**: Udowodnij poniższe twierdzenie.

```lean
theorem t2 (P : Nat → Prop) (Q : Nat → Prop) (n : Nat) : `¬ P n → (P n → Q n)` := by
```

Zwróć uwagę, że musieliśmy dodać parametr `n` typu `Nat`, bo inaczej nie byłoby żadnych zdań. Sam
predykat, na przykład, samo `Ponury`, nie jest zdaniem (jest predykatem, a więc pewną funkcją {nie
*typem* funkcyjnym}). Dopiero, dajmy na to, `Ponury Krystian` jest zdaniem. Wewnątrz (w lokalnym
kontekście) dowodu twierdzenia `t2` od samego początku są więc trzy termy (parametry twierdzenia):
(jakieś) dwa predykaty dotyczące liczb - `P` i `Q` - i (jakaś) liczba naturalna `n`. Z tego możemy
zawsze korzystać wewnątrz dowodu. Poza tym mamy implikację, której następnikiem jest implikacja i
której poprzednikiem też jest (szczególna) implikacja (bo negacja to tak naprawdę implikacja). Te
elementy musimy "rozłączać" wprowadzając (do kontekstu) przesłanki jako hipotetyczne dowody.

## Implikacja przeciwna

Jeżeli zdanie `p → q` jest prawdziwe, to jeżeli `¬q` (powstrzymałem się przed napisaniem "zdanie
`¬q` jest prawdziwe", ale nadal obawiam się, czy jesteś już w stanie domyślić się od razu z
kontekstu, czy chodzi o zdanie, czy o dowód zdania), to nie może być prawdą, że `p`. Gdyby *wtedy*
`p` było prawdą, to moglibyśmy użyć implikacji `p → q` do uzyskania `q`, co razem z `¬q` dawałoby
sprzeczność. Można to też objaśnić tak: Jeżeli `p → q`, to zawsze, gdy `p`, to `q`, a więc jeśli
`¬q`, to `¬p`.

Następne zadanie jest chyba wyraźnie trudniejsze niż wszystkie poprzednie zadania. Jeżeli utkniesz,
nie zrażaj się. Jeżeli utkniesz, będziesz próbować znowu i nadal Ci się nie uda, nie przejmuj się
tym i czytaj dalej. Zrozumienie, że ucząc się matematyki *nie trzeba rozwiązywać wszystkich zadań* i
że upieranie się przy tym może bardzo przeszkadzać w nauce zajęło mi naprawdę dużo czasu, o wiele za
dużo. Żałuję, że nikt mi tego nie tłukł już dawno temu do głowy (albo jeszcze lepiej, cierpliwie
wytłumaczył). Proszę nie popełniaj tego błędu.

**Rada/Motywator/Life hack**: Żeby Cię przekonać do uczenia się matematyki na luzie, opowiem Ci, jak
zmiana nastawienia do matematyki zmieniła moje życie. W trakcie wakacji 2023 roku zacząłem się
systematycznie uczyć, rojąc sobie, że może jakiś cudem będę miał szansę to kiedyś wykorzystać, z
cudownej książki, napisanej przez Geuversa i Nederpelta, pod tytułem [Type Theory and Formal
Proof](https://www.cambridge.org/core/books/type-theory-and-formal-proof/0472640AAD34E045C7F140B46A57A67C). Ta
książka jest napisana w bardzo jasny sposób. Czytając ją czuje się, że autorzy starają się wszystko
objaśnić najlepiej jak tylko potrafią. W mojej ocenie to jest też wybitna *literatura* w tym
znaczeniu, że styl jest jednocześnie wyjątkowo elegancki i lekki.

Niektórzy wybitni matematycy piszą tak dobrze. A że temat jest czasem abstrakcyjny, złożony i pełen
klarownych i głębokich niespodzianek, rezultatem bywa porażające połączenie treści i formy. Coś
takiego jest chyba osiągalne tylko wtedy, gdy autor(zy) ma(ją) dużo do powiedzenia i dobrze
rozumie(ją) to, co chce/ą powiedzieć i to, jakie trudności mogą wystąpić u odbiorcy. No więc to
jest, w mojej ocenie, tego rodzaju książka. W dodatku treść jest całkowicie samowystarczalna - poza
dobrą znajomością języka angielskiego, autorzy nie zakładają żadnej wcześniejszej wiedzy
czytelnika. Mimo to, uczenie się o teorii typów zależnych nie było dla mnie ani trochę łatwe.

Przez dłuższy czas zaczynałem każdy dzień od 30 minutowej jednostki (tak to sobie nazywam),
polegającej albo na czytaniu po raz kolejny tego samego *krótkiego* fragmentu, albo na robieniu
notatek czy zaplanowanych powtórek. Później tego samego dnia zdarzało się, że jeszcze do tego
wracałem, ale nie zawsze. Na początku rozwiązywałem też wszystkie zadania. I to był bardzo powolny
proces. 

Któregoś dnia z czystej ciekawości zacząłem swobodnie czytać dalej, a potem wróciłem do miejsca, na
którym wcześniej skończyłem. W ten sposób miałem pewną przerwę między momentem, w którym pierwszy
raz przeczytałem późniejszy fragment, ale nie robiłem żadnych pojawiających się tam zadań, a
momentem, kiedy znowu zacząłem go czytać. Okazało się, że rozumiem ten fragment znacznie
lepiej. Postanowiłem więc, tylko na próbę, *w ogóle nie robić zadań gdy nie mam na to ochoty* (co
Tobie akurat odradzam, bo w tym skrypcie zadań jest bardzo mało i stanowią integralną część tekstu).

Robiłem notatki i zaplanowane, generatywne powtórki, ale nie robiłem żadnych zadań, które mnie nie
zainteresowały. Z czasem zacząłem też *zauważać błędy*. Czytając zawsze szukam błędów, po prostu tak
mam i moje doświadczenie wskazuje, że w większych tekstach napisanych w języku naturalnym zawsze są
błędy. Ponieważ byłem pewny, że mam rację, napisałem do Roba Nederpelta, który potraktował mnie
niezwykle życzliwie i poważnie. Jednym z efektów tej przygody jest to, że moje nazwisko pojawiło się
w oficjalnej erracie do tej książki, jako nazwisko jednej z osób, której autorzy dziękują. A mi
akurat dziękują za wskazanie (w tym momencie, to jest 2024-12-11) około *połowy* wszystkich
wymienionych tam błędów. Z niewielu rzeczy jestem tak dumny jak z tego, dlatego często się tym
chwalę. Nie pomyślałbym nawet o napisaniu czegoś choćby tylko odlegle zbliżonego do tego skryptu,
gdyby nie ta wspaniała książka i kontakt z tym wspaniałym człowiekiem. No więc nie przesadzaj z
ambicją, moim zdaniem najważniejszy jest czas.

Coś innego, co też na zawsze zmieniło moje życie, a co jest z tym związane, przytrafiło mi się w
szokle podstawowej na lekcji fizyki. Moja nauczycielka z tego przedmiotu, Pani Płucienniczak, którą
bardzo dobrze wspominam (jednak moją ulubioną nauczycielką na zawsze pozostanie Pani Wójcik, która
uczyła mnie matematyki), tłumaczyła coś na tablicy i kiedy zrozumiałem, o czym mówiła, zrozumiałem
też jednocześnie coś ważniejszego (ważniejszego, niż fizyka!): *wszystko, co da się zrozumieć, ja
też mogę zrozumieć, o ile tylko będę miał dość informacji i czasu*. Uważam, że Ty też możesz
zrozumieć *wszystko*, co da się zrozumieć. Jak to ujął Silvanus Thompson w swoim popularnym i
dostępnym za darmo [podręczniku do rachunku różniczkowo-całkowego](https://calculusmadeeasy.org/),
*What one fool can do, another can*. Thompson podaje, że to jest "Ancient Simian Proverb", ale to
żart (guglnij "Simian" jeśli chcesz się dowiedzieć więcej).

Zawsze byłem chudy, dobry z matematyki i z programowania, bo taki się urodziłem. Był nawet taki
moment, kiedy dawałem korepetycje kolegom ze starszych klas, ale z pewnością nie byłem ani nie
jestem geniuszem. Po prostu w szkole podstawowej nie potrafiłem nie myśleć często o matematyce. Mój
przyjaciel, wybitny teoretyk prawa i filozof Wojtek Załuski jest zdaje mi się prawdziwym
geniuszem. Inny mój przyjaciel, filozof matematyczny (jeśli wolno mi "to" tak nazwać) Szymon
Szymczak też jak sądzę jest. To też oczywiście głuptasy, jak my wszyscy, ale to są akurat głuptasy w
pewnych (zbyt licznych) obszarach genialne. Dzięki nim wiem, jaki ze mnie dureń. *W pierwszej klasie
szkoły podstawowej* nie zapisałem prawie nic w zeszycie i mój szkolny "poziom wykonania" był tak
niski, że, jak się później dowiedziałem, nauczyciele poważnie zastanawiali się, czy nie powinienem
zostać w niej na drugi rok. Z powodu licznych nieobecności (których co prawda sporą część spędziłem
w bibliotece) i bardzo słabych ocen o mało co nie powtarzałem też roku w liceum.

Na studia z psychologii jest tylu chętnych, że niektórzy z Was z pewnością przerastają mnie wrodzoną
"mocą obliczeniową", a poza tym nie jestem już taki młody. Tak się jednak składa, że przez wiele lat
w miarę systematycznie uczyłem się wielu trudnych rzeczy. Pracuję na uczelni dzięki temu, że na
pierwszym albo drugim roku psychologii z podręcznika Andersona, z którego korzystaliśmy czasem na
zajęciach z psychologii poznawczej, dowiedziałem się, jak się uczyć, a ze znakomitej książki
[Rachlina](https://www.hup.harvard.edu/books/9780674013575) (ale uprzedzam, polskie tłumaczenie jest
*tragicznie złe*) dowiedziałem się, jak sobie radzić z ekstremalną prokrastynacją. Skoro już mówię o
takich sprawach, to wypada mi tutaj podkreślić, że nie pracowałbym na uczelni, gdyby nie wsparcie,
życzliwość i wyrozumiałość - moich przyjaciół, niezrównanego Michała Wierzchonia i uczciwej,
skromnej i mądrej Marty Siedleckiej, która od dłuższego już czasu dostarcza mi sensownych zajęć - a
także Kasi Popiołek, która była dla mnie wprost wymarzoną szefową przez 10 lat, gdy pracowałem na
SWPSie w Katowicach. Wygląda więc na to, że trzeba czasu, być może jakiegoś sposobu na siebie i
dobrych przyjaciół; wtedy można zrozumieć, co tylko się chce. What one fool can do, another can.

**Zadanie**: No to udowodnij teraz albo kiedy indziej albo wcale twierdzenie `cp` (to skrót od
[*contraposition*](https://en.wikipedia.org/wiki/Contraposition)). Użyłem tu krótszego zapisu dla
dwóch parametrów, to jest napisałem `(p q : Prop)` zamiast `(p : Prop) (q : Prop)`. Dla Leana to
znaczy to samo, ale pozwala na taki skrót tylko wtedy, gdy sąsiadujące parametry mają ten sam typ.

```lean
theorem cp (p q : Prop) (h : p → q) : ¬q → ¬p :=
    -- Nie będę się tym razem upierał przy sposobie konstruowania dowodu. Może być interaktywnie,
    -- albo nie, albo możesz spróbować na oba sposoby, jak wolisz.
```

W tym dowodzie masz zawsze do dyspozycji jakieś dwa zdania (`p` i `q`), ale z tego akurat będziesz
korzystać tylko "w tle". Ważniejszy jest jakiś dowód `h `implikacji `p → q`, którego możesz używać
*bez* wprowadzania tego dowodu do kontekstu, bo jest parametrem twierdzenia `cp`. Jeżeli czujesz się
niepewnie, to podpowiadam, że zdanie do udowodnienia jest tak naprawdę implikacją, której
poprzednikiem i następnikiem też są implikacje.

### Przypisy

[^1]: Terminologia "granatowa" to tutaj oczywiście żart.

[^2]: To jest porzekadło 
