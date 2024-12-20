# Negacja w praktyce dowodzenia

Myślę, że jesteś już gotowa, żeby poćwiczyć dowodzenie zdań zawierających negację. Nie wiem tylko
jeszcze, jakie zadanie Ci zaproponować. Takie zadanie może polegać albo na *uzyskaniu* dowodu
negacji wewnątrz jakiejś formuły logicznej, albo na jej *użyciu*. Może zaczniemy od użycia, bo tak
będzie mi chyba łatwiej.

Żeby skonstruować takie zadanie, muszę stworzyć zdanie, w którym negacja będzie odgrywała rolę
*przesłanki*. Może `¬p → q`? No nie, z tym nic się nie da zrobić, bo tu są tylko dwa zdania, a żeby
użyć `¬p`, trzeba mieć również `p`. Przecież w żaden sposób nie uzyskam z dowodu `q` dowodu `p`, bo
to są różne zdania *atomowe*, czyli bez żadnej wewnętrznej struktury. Gdy nie ma dodatkowych
przesłanek, które wiązałyby ze sobą - bezpośrednio lub jakoś pośrednio - dwa różne zdania atomowe,
wtedy mówimy, że takie dwa zdania są *logicznie niezależne*.

To może `¬p → q → p`? Też bez sensu. Przecież z `¬p` i `q` nie może wynikać `p`. Zaraz, ze
sprzeczności wynika każde zdanie, a więc też zdanie `q`. Już wiem.

**Polecenie**: Udowodnij twierdzenie `¬p → p → q`. To zdanie zawiera dwa różne zdania atomowe, `p` i
`q`, więc Lean musi wiedzieć - lokalnie, to znaczy *wewnątrz dowodu* - że `p` i `q` to *zdania*,
inaczej nie będzie wiedział, czym jest `¬p → p → q`. Jednocześnie `p` i `q` mają być *zmiennymi*, za
które chcemy móc podstawiać dowolne zdania stosując to twierdzenie w przyszłości. W takim razie
"zmienno-zdaniowość" albo "zmiennościowość i zdaniowość" nazw `p` i `q` musi być zakodowana poprzez
to, że `p` i `q` odgrywają rolę parametrów dowodzonego twierdzenia (przed drukropkiem albo za, jak
kto woli):

```lean
-- Dokończ dowód w trybie interaktywnym lub nieinteraktywnym lub w obydwu tych trybach. Jeżeli bez dodatkowych wyjaśnień
-- to dla Ciebie w tym momencie jest zbyt trudne, to moje próby wyjaśninia znajdziesz poniżej.
theorem tn1 (p : Prop) (q : Prop) : ¬p → p → q := by
```

Mamy do udowodnienia implikację, której następnik jest również implikacją. Nie wiem, czy to od razu
zauważyłaś, więc na wszelki wypadek jeszcze raz tłumaczę: Pamiętasz konwencję dotyczącą nawiasów i
strzałek? Zdania `¬p → p → q` i `¬p → (p → q)` są tym samym zdaniem, bo strzałka wiąże z
prawej. Mamy więc, na najwyższym poziomie struktury tego zdania, implikację, której
poprzednikiem jest `¬p` a następnikiem `(p → q)`.

Wiesz już, że udowodnienie tej implikacji polega na udowodnieniu następnika `(p → q)` zakładając
poprzednik `¬p`. Wiesz też, że gdy będąc w trybie interaktywnym założysz ten poprzednik, używając
komendy `intro` z wybraną przez siebie nazwą dla hipotetycznego dowodu `¬p`, to zostanie jako cel do
udowodnienia prostsze zdanie `(p → q)`. A żeby z kolei udowodnić to zdanie trzeba znowu założyć
poprzednik, w ten sam sposób co wcześniej, tylko używając innej nazwy. Wtedy zostanie tylko zdanie
`q`.

Jedynym sposobem, żeby udowodnić to ostatnie zdanie, będzie skorzystanie z tego, co już w tym
momencie będziesz miała, czyli z hipotetycznych dowodów zdań `¬p` i `p`. Byłbym zapomniał, a to
teraz będzie ważne - masz przecież jeszcze coś w kontekście: zdania jako takie (a nie ich dowody),
`p` i `q`. Te zmienne są parametrami twierdzenia `tn1`, a więc muszą być wewnątrz tego twierdzenia
dostępne. Pozostanie Ci użyć komendy `exact` z odpowiednim termem. I w tym momencie muszę objaśnić
różnicę między moją definicją absurdu i tą, której używamy w Leanie.

**Absurd w Leanie**: Żeby skorzystać z eksplozji dedukcyjnej do udowodnienia dowolnego zdania w
Leanie można zastosować *funkcję* `absurd`. Stosujemy ją do dwóch (być może złożonych, a jeśli
złożonych, to otoczonych nawiasami) termów, jakiegoś dowodu tego samego zdania w wersjach
"pozytywnej" i "negatywnej" (dowodu negacji tego zdania), *w tej kolejności*. Kolejność jest myląca,
bo przecież jeśli `¬p` jest implikacją z `p` do fałszu, to powinniśmy aplikować dowód `¬p` do dowodu
`p`, ale kiedy stosujemy funkcję `absurd` kolejność termów jest odwrotna. No trudno, taka konwencja
(jest też głębszy powód, ale go teraz pominę).

Jeśli w trybie dowodzenia interaktywnego napiszesz `exact absurd` z dwoma (być może złożonymi)
argumentami, to jest jakimś dowodem jakiegoś zdania i jakimś dowodem negacji tego samego zdania
(jeszcze raz - w tej kolejności), to nie będzie trzeba już dodawać zdania-celu jako trzeciego
argumentu. Nie będzie trzeba tego robić, bo gdy jesteś w trybie dowodzenia interaktywnego, Lean
"zakłada" (Lean nie jest działającym celowo agentem, więc właście nigdy nic nie "robi", ale możemy
chyba tak nadal mówić, nawet bez cydzysłowów), że chcesz udowodnić aktualny cel i sam decyduje, że
eksplozja dedukcyjna ma być wykorzystana właśnie na rzecz tego celu.

Możesz spróbować skonstruować dowód w trybie nieinteraktywnym (a więc bez użycia taktyk `intro` czy
`exact`), konstruując funkcję dowodu `¬p` zwracającą funkcję dowodu (inaczej nazwanego) `p`, która z
kolei będzie zwracać dowód `q`:

```lean
theorem tn1' (p : Prop) (q : Prop) : ¬p → (p → q) := 
    fun (h1 : ¬p) => 
            -- Więcej tutaj nie podpowiem
```

Widzisz jednoznaczny związek z tym, w jaki sposób konstruowałaś przed chwilą ten sam dowód w trybie
interaktywnym?

Przypominam, że w trybie nieinteraktywnym nie zadziała komenda `exact`, `intro`, czy jakakolwiek
inna taktyka. Możesz jednak zawsze *w dowolnym miejscu* wejść w tryb interaktywny pisząc `by` i
zakończyć dowód lub tylko jego fragment używając taktyk. Albo możesz nauczyć się czegoś nowego,
kodując dowód nieinteraktywne: Możemy użyć eksplozji dedkukcyjnej w trybie nieinteraktywnym na co
najmniej dwa sposoby. Jeden polega na tym, że stosujemy funkcję `absurd`, ale to już
objaśniłem. Drugi, równoważny, tylko inaczej zapisany, polega na jawnym zastosowaniu reguły
*eliminacji* (tak nazywamy w logice reguły użycia przesłanek danego rodzaju) fałszu.

Jeżeli w rozpoczętym wyżej dowodzie otoczysz nawiasami aplikację `h1` (o typie `¬p`) do `h2` (o
typie `p`), czyli używając znanej Ci już, "naturalnej" metody wywoływania eksplozji dedukcyjnej
przez aplikację, to gdy dopiszesz zaraz za prawym nawiasem (bez spacji) `.elim`, z kropką na
początku, to uzyskasz fałsz, który od razu zakończy dowód. To zadziała dokładnie tak samo jak
zastosowanie taktyki `exact` do aplikacji funkcji `absurd` w trybie interaktywnym i w ten sposób
natychmiast zakończysz dowód. Jeszcze tylko przypomnę, że nazwa `elim` to skrót od angielskiego
*elimination*, czyli eliminacji, co w logice oznacza *użycie* albo *wykorzystanie* (czyli jakby
"zużycie") założenia (danego rodzaju).

Może potrzebujesz, żebym to też omówił krok po kroku? Jeżeli (ilustracja):

`h1 : ¬p
h2 : p`

to ponieważ (rozpakowując definicję negacji) `h1 : ¬p` znaczy to samo, co `h1 : p → False`, to

`#check h1 h2 -- h1 h2 : False`

Wiesz już, że reguła eliminacji / (z)użycia fałszu mówi, że dla dowolnego zdania, jeśli mamy dowód fałszu /
akceptujemy fałsz, to mamy dowód / akceptujemy to zdanie. Gdy matematycy nie krzystają z teorii
typów, zapisują tą regułę często w takim stylu:

<ins>*Fałsz*</ins>  
*A*


To nie jest fragment Leana ani poprawna "wypowiedź" w języku teorii typów, tylko fragment *prozy
matematycznej* dotyczącej dedukcji naturalnej. Nazywam to prozą matematyczną, bo ten fragment
*wymaga komentarza w języku naturalnym*, nie jest więc w pełni sformalizowany. Czy widzisz, że
chociaż z komentarzem ("A reguła eliminacji...") zapis z poziomą kreską jest zrozumały, to bez
komentarza, który pozwala domyślić się, czym jest *A*, albo nie jest zrozumiały, albo jest
zrozumiały tylko dla kogoś, kto domyśla się brakującej informacji? Widzimy więc, że formalizacja
służy między innymi całkowitemu usunięciu potrzeby domyślania się, o co chodzi.

Regułę dedukcji *z fałszu wynika wszystko* możemy zastosować w Leanie aplikując funkcję `elim` do
termu typu `False`. Jeżeli nadal zastanawiasz się, czym to się różni od stosowania dowodu naszego
`Absurd`u albo od aplikowania funkcji `absurd`, która jest od razu dostępna w Leanie, to wyjaśniam
jeszcze raz, że w zasadzie niczym. To są tylko różne *konwencje* wyrażenia tej samej
operacji. Gdybyś chciała skorzystać z aplikacji funkcji `elim` do dowodu fałszu, to możesz to
zrobić albo tak:

`jakis_dowod_falszu_byc_moze_w_nawiasach.elim`

albo tak:

`False.elim jakis_dowod_falszu_byc_moze_w_nawiasach`

Leanowi będzie wszystko jedno, mamy tu dwie konwencje zamiast jednej tylko dla Twojej wygody.

Podsumowując, gdy masz ochotę użyć jawnie reguły eliminacji dla fałszu, musisz mieć jakiś dowód
fałszu. Jeżeli nie masz "fałszywego założenia" (np. `h : False`), a raczej nie będziesz go mieć, bo
wtedy każdy dowód byłby trywialny, to musisz udowodnić fałsz przez *odrywanie*, czyli za pomocą
reguły *modus ponens*, czyli przez zastosowanie (dowodu) implikacji `P → False` do (dowodu) jej
poprzednika `P`, czyli przez zastosowanie funkcji typu `P → False` do odpowiedniego dla niej
argumentu. Użyłem tu dużej litery `P`, żeby zasygnalizować, że to może być jakieś zdanie złożone, a
nie atomowe, na przykład jakaś implikacja.  Gdy już masz dowód fałszu, po prostu mówisz Leanowi, że
chcesz go zastosować do skonstruowania dowodu zdania, które w danym miejscu "czeka na bycie
udowodnionym". Byłoby najlepiej, gdybyś spróbowała zakończyć dowód twierdzenia `tn1` używając więcej
niż jednego z wymienionych sposobów, ale nie będę się przy tym upierał.

TODO zadanie z negacją ciekawszego zdania

No dobrze, teraz muszę jeszcze wymyślić jakieś w miarę proste zadanie, które będzie polegało na
*uzyskaniu* negacji. Negacja to szczególny rodzaj implikacji, której następnikiem jest fałsz. Żeby
taka funkcja mogła zwrócić dowód fałszu, ten fałsz musi się skądś wziąć, nie mogą w tym zadaniu
występować same zdania "pozytywne". Nie możemy też po prostu w tym zdaniu-zadaniu założyć dowodu
*samego fałszu*, a raczej możemy, ale to byłoby trywialne, bo wtedy dało by się udowodnić każde
zdanie, a więc dałoby się wtedy uzyskać dowód negacji każdego zdania.

Może tak: `¬q → p → ¬p`? No nie, z `¬q` i `p` w żaden sposób nie uzyskamy `¬p`, bo bez dodatkowych
przesłanek `¬q` i `p` nie wejdą ze sobą w żadną "interakcję". A z `q` i `¬q`?  Zakładając dowody
tych dwóch zdań uzyskamy dowód każdego zdania za pomocą eksplozji dedukcyjnej, a więc także negacji
dowolnego zdania, ale to jest już moim zdaniem dla Ciebie zbyt łatwe. Wydawało mi się w tym
momencie, że muszę albo wprowadzić zasadę wyłączonego środka (a więc logikę klasyczną), albo coś
innego, czego jeszcze Ci nie tłumaczyłem, bo byłem już zmęczony tym pisaniem.

Gdy obudziłem się następnego dnia rano, od razu wiedziałem, jakie to ma być zadanie. Właściwie
zaproponuję Ci nie jedno, a trzy zadania na ten temat. Wszystkie trzy będą ważne.

W Lean zdanie `¬p` to tak naprawdę zdanie `p → False`, to już wiesz. Podobne do naszego `nie p`, bo
też `False` spełnia tą samą rolę co nasz `Absurd`, jednak żeby użyć `False`, trzeba napisać trochę
coś innego, niż my piszemy, żeby użyć naszego `Absurd`. Trochę namieszałem, wiem, ale miałem dobry
powód (w każdym razie tak mi się wydaje). Tak więc "z *fałszu* wynika wszystko"? Może nie masz już
co do tego wątpliwości, jeśli przez fałsz rozumiemy nasz `Absurd`, ale żeby z jakiegoś "fałszu
samego" wynikało wszystko? Co by to miało w ogóle znaczyć?

W innej części tego skryptu (który, teraz sobie myślę, może będzie kiedyś niby-książką) przekonamy
się, czym *w istocie* jest fałsz w logice, *z pewnego* bardzo abstrakcyjnego *punktu widzenia*.
Widzisz napięcie, a może nawet coś w rodzaju sprzeczności, między trzema fragmentami napisanymi w
tym zdaniu pismem pochyłym? Czy "w istocie" pasuje do "z pewnego punktu widzenia"? (to tylko
dygresja). No więc dlaczego właściwie z fałszu ma wynikać wszystko? Czy to jest *tylko* jakaś
arbitralna konwencja?  Następne zadanie to nie *odpowiedź* na to pytanie, to tylko *ilustracja*, ale
ilustracja to już coś:

**Zadanie**: Wiesz już, że każdy dowód fałszu jest "wyposażony" w sposób użycia o nazwie `elim`. Gdy
mamy jakiś dowód fałszu, możemy go użyć do udowodnienia dowolnego zdania aplikując dostępną do tego
dowodu w Leanie funkcję `False.elim`. To samo możemy zapisać również krócej, jako nazwę dowodu,
zaraz potem (bez spacji) kropkę i zaraz potem `elim`. Jeżeli dowód fałszu to jakiś term złożony, na
przykład aplikacja, to musimy cały ten term otoczyć wtedy nawiasami i zapisać prawy nawias jako
`).elim`. Wiem, że już o tym mówiłem, teraz tylko przypominam.

Udowodnij poniższe twierdzenie, najpierw korzystając z trybu interaktywnego, a potem konstruując kod
dowodu podobnie, jak to do tej pory robiliśmy (wtedy nie możesz napisać w kodzie definiującym ciało
twierdzenia komendy `by`). Wystarczy wprowadzić poprzednik implikacji jako założenie i użyć tego
hipotetycznego dowodu fałszu wybierając jeden ze sposobów, które właśnie objaśniłem.

```lean
theorem ex_falso_quodlibet (p : Prop) : False → p := by
```

Udowadniając to twierdzenia zobaczyła/eś tak wyraźnie, jak tylko się da, *że* z fałszu wynika
wszystko. Ale *dlaczego* z fałszu wynika wszystko? Wygląda na to, że fałsz jest *zdaniem
fałszywym*. Widzisz, że coś tu nie gra?  Przecież zdanie jako takie nie może być ani prawdziwe, ani
fałszywe. Może to *nie* jest *zdanie fałszywe*, tylko jakiś "fałsz jako taki"? Zawsze możemy o takie
rzeczy spytać Leana:

```lean
#check False -- False : Prop
```

Jednak zdanie. Ciekawe? Moim zdaniem bardzo. Wrócimy do tego kiedy indziej.

Mam nadzieję, że już niemal *widzisz*, że w początkowej części udowadnianego zdania, albo gdzieś
"wcześniej", a może "wyżej", przed dowodzonym zdaniem, na przykład jako (globalny) aksjomat, *musimy
założyć lub uzyskać dowód negacji albo fałszu, żeby uzyskać dowód jakiejś negacji albo fałszu*.

Zaproponuję Ci jeszcze zadanie w zasadzie takie samo jak poprzednie, jednak zamiast zdań atomowych
będą zdania złożone z predykatów. Te predykaty będą dotyczyć liczb naturalnych, bo ten typ już
znasz. Być może trzeba będzie otoczyć niektóre aplikacje predykatów (jakiejś / dowolnej /
arbitralnej, bo to parametr twierdzenia-funkcji `t2`) liczby naturalnej `n` nawiasami.

**Zadanie**: Udowodnij poniższe twierdzenie. To twierdzenie tylko *wygląda* na bardziej
skomplikowane; w dowodzie nie będziesz w ogóle korzystać z faktu, że zdania mają strukturę
predykat-orzeczenie.

```lean
theorem t2 (P : Nat → Prop) (Q : Nat → Prop) (n : Nat) : `¬ P n → (P n → Q n)` := by
```

Zwróć uwagę, że musieliśmy dodać parametr typu `Nat`, bo inaczej nie moglibyśmy pisać zdań złożonych
z predykatów dotyczących liczb(y) naturalnych w sposób, który byłby dla Leana "zrozumiały": Sam
predykat, na przykład samo `Ponury`, nie jest zdaniem (jest predykatem, a więc pewną funkcją {nie
*typem* funkcyjnym}). Dopiero, dajmy na to, `Ponury Krystian` jest zdaniem. Analogicznie, sam
predykat `P` dotyczący liczb naturalnych nie jest jeszcze zdaniem, dopiero aplikacja `P` do liczby
naturalnej jest. Skoro więc mamy dowodzić zdania na temat (jakiś) własności (tutaj `P` i `Q`) liczb
naturalnych, to musimy mieć do dyspozycji jakaś liczbę naturalną, której te własności mogą
przysługiwać albo nie.

Wewnątrz (w lokalnym kontekście) dowodu twierdzenia `t2` od samego początku są więc *trzy* termy
(parametry twierdzenia): (jakieś) dwa predykaty dotyczące liczb - `P` i `Q` - i (jakaś) liczba
naturalna `n`. Wewnątrz dowodu zawsze możemy korzystać z parametrów dowodzonego twierdzenia, bo
twierdzenie to tak naprawdę funkcja, a wewnątrz każdej funkcji możemy zawsze korzystać z jej
parametrów (o ile ich lokalnie nie "przysłonimy" tworząc "wewnętrzny kontekst" i nadając tam nazwom
parametrów nowe znaczenie).

Mamy implikację, której następnikiem jest implikacja i której poprzednikiem też jest (szczególna)
implikacja (bo negacja to tak naprawdę implikacja). Te elementy musimy kolejno "rozłączać",
wprowadzając (do kontekstu) jako lokalne hipotezy poprzedniki obu implikacji, a raczej ich
hipotetyczne dowody. Wszystko to już raz zrobiła/eś.

## Implikacja przeciwna

Następne zadanie jest trochę trudniejsze niż wszystkie poprzednie zadania. 
## Szkielet dowodu `¬q → ¬p` zakładając `p → q`

Jeżeli zdanie `p → q` jest prawdziwe, to jeżeli `¬q`, to nie może być prawdą, że `p`. Gdyby bowiem
*wtedy* `p` było prawdą, to moglibyśmy użyć `p → q` do uzyskania `q`, co razem z `¬q` dawałoby nam
sprzeczność.

Można to objaśnić również tak (dla uproszczenia pomijam poniżej znajdujące się cały czas w
kontekście deklaracje `p : Prop` i `q : Prop`):

Jeżeli `p → q`  
(kontekst: `h1 : p → q`)

to jeżeli `¬q`  
(kontekst: `h1 : p → q`, `h2 : ¬q`)

to jeżeli `p`  
(kontekst: `h1 : p → q`, `h2 : ¬q`, `h3 : p`)

to z `¬q`, `p → q` i`p` wynika fałsz  
(term: `h2 (h1 h3) : False`)

Czyli: Zakładając `p → q`, to zakładając `¬q`, z założenia `p` możemy wyprowadzić dowód fałszu: `p ->
False`.

Czyli: Zakładając `p → q` i `¬q` możemy wyprowadzić dowód `¬p`.

Czyli: Zakładając `p → q`, `¬q → ¬p`.

**Zadanie**: No to udowodnij teraz, albo kiedy indziej, albo wcale, jak uważasz, twierdzenie `cp`
(to skrót od [*contraposition*](https://en.wikipedia.org/wiki/Contraposition)). Użyłem tu krótszego
zapisu dla dwóch parametrów, to jest napisałem `(p q : Prop)` zamiast `(p : Prop) (q : Prop)`. Dla
Leana to znaczy to samo, ale Lean pozwala na taki skrót tylko wtedy, gdy sąsiadujące parametry mają
ten sam typ. Lubimy ten skrótowy zapis.

```lean
theorem cp (p q : Prop) (h : p → q) : ¬q → ¬p :=
    -- Nie będę się tym razem upierał przy sposobie konstruowania dowodu. Może być interaktywnie,
    -- albo nie, albo możesz spróbować na oba sposoby. Jak wolisz.
```

W tym dowodzie masz zawsze do dyspozycji jakieś dwa zdania (`p` i `q`), ale z tego akurat będziesz
korzystać tylko "w tle". Ważniejszy jest jakiś dowód `h `implikacji `p → q`, którego możesz używać
*bez* wprowadzania tego dowodu do kontekstu, bo jest parametrem twierdzenia `cp`. Jeżeli czujesz się
niepewnie, to podpowiadam raz jeszcze, że zdanie do udowodnienia jest tak naprawdę implikacją,
której poprzednikiem i następnikiem też są implikacje.

### Przypisy

[^1] Idąc za sugestią pewnej osoby, której nazwiska tutaj nie wymienię, rozważałem również takie
epitety jak: bezkompromisowa i przezabawna, niezłomna i wiekopomna, czy mądra i krnąbrna. Po tych
rozważaniach doszedłem do wniosku, że wszystkie pasują.
