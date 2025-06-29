## O czym teraz będzie

W tym rozdziale, zamiast po prostu zaproponować Ci kilka zadań wymagających operowania negacją,
postanowiłem znowu spróbować nakłonić Cię do uczenia się poprzez wcielenie się w rolę. Poza tym w
niektórych miejscach wyjaśniam tu po raz kolejny kwestie, o których już wcześniej mówiłem. Wiem, że
ryzykuję w ten sposób, że zaczniesz się (jeszcze bardziej) nudzić, ale gdyby tak się stało, to
przynajmniej dzięki temu będziesz wiedzieć, że pewne rzeczy już opanowałaś. A pod koniec tego
rozdziału poznasz bardzo użyteczną *implikacją przeciwną*.

<hr>

# Negacja w praktyce dowodzenia, pierwsze kroki

Najpierw krótko i od razu przechodząc do rzeczy.

Symbol negacji `¬` uzyskasz wpisując `\neg`. Oto wszystko, co musisz wiedzieć o negacji w praktyce
dowodzenia za pomocą logiki konstruktywnej (pojęcie negacji pojawia się tu niejawnie):

*Ze sprzeczności wynika fałsz, a z fałszu wynika wszystko*.

A mówiąc dokładniej:

1. W logice konstruktywnej negacja zdania jest tak naprawdę pewną szczególną implikacją; jeżeli `p :
   Prop`, to `¬p` znaczy to samo, co `p → False`. Dowód negacji zdania jest więc funkcją, która
   dowolny dowód tego zdania przekształca w *dowód fałszu*. A więc:
   
   *Aplikacja dowodu negacji zdania do dowodu tego zdania* jest dowodem *fałszu*:
   
```lean
-- Deklarujemy, że mamy (nie wiadomo skąd) jakieś zdanie `p`, ...
variable (p : Prop)

-- ... dowód `hp` tego zdania ...
variable (hp : p)

-- ... i dowód `np` jego negacji.
variable (np :  ¬p)

-- Ponieważ `¬p` to - zgodnie z (konstruktywną) definicją negacji - `p → False`, to ...
#check np hp -- `np hp : False`
-- ... a więc aplikacja dowodu negacji dowolnego zdania do dowodu tego zdania jest dowodem fałszu.
```

Jeśli masz ochotę, możesz się oczywiście dowolnie głęboko zanurzyć w odmętach filozoficznych
rozważań na temat "istoty" albo "prawdziwej natury" sprzeczności czy dowodu fałszu, ale jedyne, co
musisz wiedzieć zajmując się *praktyką* (konstruktywnego) *dowodzenia*, to:

2. Zawsze gdy masz dowód jakiegoś zdania `p` i dowód jego negacji `¬p`, możesz udowodnić *każde*
   zdanie stosując tak zwaną *zasadę eksplozji dedukcyjnej*:
   
   *Ze sprzeczności* (albo *z fałszu*) *wynika wszystko*.
   
   Mówiąc dokładniej, korzystając z dowodu fałszu - a więc również z każdej sprzeczności, takiej jak
   obecność dowodów `hp` i `np` zdań `p` i `¬p` odpowiednio, bo każda taka sprzeczność pozwala
   uzyskać dowód fałszu - możemy udowodnić każde zdanie.
   
Żeby zastosować w Leanie zasadę eksplozji dedukcyjnej możesz użyć albo funkcji `absurd`, albo
`False.elim`, jak wolisz (ilustracja):

```lean
-- Zawsze gdy mamy (skądkolwiek) dowody pewnego zdania (tutaj `p`) i jego negacji ...
variable (p : Prop)
variable (hp : p)
variable (np : ¬p)

-- ... dla *dowolnego* zdania `q` ...
variable (q : Prop) 

-- ... możemy zrobić tak ...
#check absurd (b := q) hp np -- `absurd hp np : q`

-- ... albo tak:
#check False.elim (C := q) (np hp) -- `False.elim (hp np) : q`

-- To tylko dwa różne sposoby zapisania tej samej operacji, to jest udowodnienia dowolnego zdania ze 
-- sprzeczności, a właściwie z fałszu (inaczej absurdu), który tutaj akurat uzyskaliśmy ze sprzeczności.
```

W powyższym fragmencie kodu pojawiła się nieznana Ci jeszcze funkcjonalność Leana, to jest jawne
podanie wartości parametru opcjonalnego (`(b := q)` i `(C := q)`), ale ani rozwiązując zadania w tym
rozdziale, ani czytając rozdział następny, nie będziesz musiała korzystać z tej
funkcjonalności. Dlatego omówię ją później.

Myślę, że jesteś już gotowa, żeby poćwiczyć dowodzenie zdań zawierających negację. Nie wiem tylko
jeszcze, jakie zadania Ci zaproponować. Takie zadanie może polegać albo na *uzyskaniu* (dowodu)
negacji wewnątrz jakiejś formuły logicznej, albo na *użyciu* (dowodu) negacji. Może zaczniemy od
użycia.

Żeby skonstruować takie zadanie, muszę stworzyć zdanie, w którym negacja będzie odgrywała rolę
*przesłanki*. Może `¬p → q`? No nie, z tym nic się nie da zrobić, bo to są dwa niepowiązane w żaden
sposób zdania atomowe. Żeby skorzystać z dowodu `¬p`, trzeba mieć również dowód `p`; w żaden sposób
z dowodu `q` nie uzyskam dowodu `p`, bo `p` i `q` to *różne zdania atomowe*, czyli różne zdania bez
żadnej wewnętrznej struktury, a bez dodatkowych założeń między takimi zdaniami nie ma żadnych
związków logicznych. 

Nawiasem mówiąc, gdy nie ma dodatkowych przesłanek, które wiązałyby ze sobą - bezpośrednio lub jakoś
pośrednio - dwa zdania, mówimy, że takie zdania są *logicznie niezależne*. W ogólnym przypadku
logiczna (nie)zależność między zdaniami zależy więc od kontekstu.

To może `¬p → q → p`? Też bez sensu. Przecież z `¬p` i `q` nie może wynikać `p`. Zaraz, ze
sprzeczności wynika każde zdanie ... Już wiem. Zaczniemy od najprostszego możliwego zadania tego
typu.

**Absurd w Leanie**: Żeby skorzystać z eksplozji dedukcyjnej do udowodnienia dowolnego zdania w
Leanie można zastosować *funkcję* `absurd` (z małej litery). Stosujemy ją do dwóch (być może
złożonych, a jeśli złożonych, to być może otoczonych nawiasami) termów: jakiegoś *dowodu tego samego
zdania* w wersjach "pozytywnej", czyli dowodu *asercji* tego zdania, i "negatywnej", czyli dowodu
negacji tego zdania, *w tej kolejności*. Kolejność jest myląca, bo przecież jeśli `¬p` jest z
definicji implikacją z `p` do fałszu, to powinniśmy aplikować dowód `¬p` (term typu `p → False`) do
dowodu `p` (termu typu `p`), ale kiedy stosujemy funkcję `absurd` kolejność termów jest odwrotna. No
trudno, taka konwencja.

**Polecenie**: Udowodnij, że `¬p → p → q`. To zdanie zawiera dwa różne zdania atomowe, `p` i `q`
(`¬p` to zdanie albo formuła *złożona*, a nie atomowa), więc Lean musi wiedzieć - przynajmniej
lokalnie, to znaczy *wewnątrz twierdzenia* - że `p` i `q` to *zdania*, inaczej nie będzie wiedział,
czym jest `¬p → p → q`. Jednocześnie `p` i `q` mają być *zmiennymi*, za które chcemy móc podstawiać
dowolne zdania stosując to twierdzenie w przyszłości jak każdą inną funkcję. W takim razie
"zmienno-zdaniowość" albo "zmiennościowość i zdaniowość" nazw `p` i `q` musi być zakodowana poprzez
to, że `p` i `q` odgrywają rolę parametrów dowodzonego twierdzenia. Możemy te parametry umieścić
przed drukropkiem albo za, a jeżeli za, to możemy oznaczyć je za pomocą symbolu `∀`, jak nam się
podoba:

```lean
-- Dokończ dowód w trybie interaktywnym lub nieinteraktywnym lub w obydwu tych trybach. Jeżeli bez
-- dodatkowych wyjaśnień to dla Ciebie w tym momencie zbyt trudne, to moje próby ułatwienia Ci tego
-- zadania znajdziesz poniżej.
theorem tn1 (p : Prop) (q : Prop) : ¬p → p → q := by
```

Wiesz już, że udowodnienie tej implikacji, którą można równie dobrze zapisać jako `¬p → (p → q)` (bo
w Leanie strzałka wiąże z prawej), polega na udowodnieniu następnika `(p → q)` zakładając poprzednik
`¬p`. Wiesz też, że gdy będąc w trybie interaktywnym założysz ten poprzednik używając komendy
`intro` (z wybraną przez siebie nazwą dla hipotetycznego dowodu `¬p`), to jako cel do udowodnienia
zostanie Ci prostsze zdanie `(p → q)`. A żeby z kolei udowodnić to zdanie trzeba znowu założyć
poprzednik, w ten sam sposób co wcześniej (tylko używając innej nazwy), bo to też jest
implikacja. Wtedy zostanie do udowodnienia tylko zdanie `q`.

Jedynym sposobem, żeby udowodnić to ostatnie zdanie, będzie skorzystanie z tego, co już w tym
momencie będziesz miała, czyli z hipotetycznych dowodów zdań `¬p` i `p`. Byłbym zapomniał, a to
teraz będzie ważne - masz przecież jeszcze coś w kontekście: zdania jako takie (a nie ich dowody),
`p` i `q`. Te zmienne są parametrami twierdzenia `tn1`, a więc muszą być wewnątrz tego twierdzenia
dostępne. W trybie interaktywnym pozostanie Ci użyć komendy `exact` z odpowiednim termem. I w tym
momencie powinienem chyba jeszcze raz objaśnić definicję absurdu z której korzysta Lean.

Jeśli w trybie dowodzenia interaktywnego napiszesz `exact absurd` z dwoma (być może złożonymi)
argumentami, to jest jakimś dowodem jakiegoś zdania i jakimś dowodem negacji tego samego zdania
(jeszcze raz - w tej kolejności), to nie będzie trzeba już dodawać zdania-celu jako trzeciego (w tym
wypadku opcjonalnego) argumentu. Nie będzie trzeba tego robić, bo gdy jesteś w trybie dowodzenia
(niekoniecznie interaktywnego), Lean "zakłada" (Lean nie jest działającym celowo agentem, więc
właście nigdy nic nie "robi", ale możemy chyba nadal tak mówić), że chcesz udowodnić aktualny cel i
sam "decyduje", że eksplozja dedukcyjna ma być wykorzystana właśnie na rzecz tego celu.

Możesz spróbować skonstruować dowód w trybie nieinteraktywnym (a więc bez użycia taktyk `intro` czy
`exact`), konstruując funkcję dowodu `¬p`, zwracającą funkcję dowodu (inaczej nazwanego) `p`, która
z kolei będzie zwracać dowód `q` w postaci dowodu fałszu, który uzyskasz aplikując funkcję `absurd`
do odpowiednich argumentów:

```lean
theorem tn1' (p : Prop) (q : Prop) : ¬p → (p → q) := 
    fun (h1 : ¬p) => 
            -- Więcej tutaj nie podpowiem
```

Jeżeli skonstruowałaś już wcześniej ten dowód w trybie interaktywnym, to myślę, że w tym momencie
widzisz jednoznaczny związek między tamtym dowodem a tym, jak wygląda powyższy fragment kodu. Na
przykład, w trybie interaktywnym komenda `intro` z wybraną przez Ciebie nazwą po prostu zaczęła
tworzyć kod anonimowej funkcji o parametrze, który podałaś jako argument tej komendy.

Jak już wspominałem, w trybie nieinteraktywnym nie zadziała komenda `exact`, `intro`, czy
jakakolwiek inna taktyka. Możesz jednak zawsze *w dowolnym miejscu dowolnej definicji* wejść w tryb
interaktywny pisząc `by` i próbować zakończyć konstrukcję, a więc również jakikolwiek dowód lub
tylko jego fragment, używając taktyk.

Albo możesz nauczyć się czegoś nowego kodując dowód nieinteraktywne, a konkretnie użyć eksplozji
dedkukcyjnej w trybie nieinteraktywnym na co najmniej *dwa* sposoby. Jeden polega na tym, że
stosujemy funkcję `absurd` (w trybie nieinteraktywnym nie poprzedzamy jej komendą `exact`), ale to
już objaśniłem. Drugi, równoważny, tylko inaczej zapisany, polega na jawnym zastosowaniu tak zwanej
reguły *eliminacji* (tak nazywamy w logice reguły użycia przesłanek danego rodzaju) fałszu.

Jeżeli w rozpoczętym wyżej dowodzie *otoczysz nawiasami* aplikację `h1` (o typie `¬p`) do `h2` (o
typie `p`), czyli używając znanej Ci już, "naturalnej" metody wywoływania eksplozji dedukcyjnej
przez aplikację, to zgodnie z definicją negacji uzyskasz w ten sposób term typu `False`. Każdy taki
term jest wyposażony w regułę eliminacji fałszu - gdy dopiszesz *zaraz za prawym nawiasem* (bez
spacji) `.elim`, z kropką na początku, to zastosujesz tą regułę, co natychmiast zakończy dowód. A
więc ten sposób zadziała tak samo jak zastosowanie taktyki `exact` do aplikacji funkcji `absurd` w
trybie interaktywnym. Jeszcze tylko przypomnę, że nazwa `elim` to skrót od angielskiego
*elimination*, czyli eliminacji, co w logice oznacza *użycie* albo *wykorzystanie* (czyli jakby
"zużycie") założenia (danego rodzaju).

Może potrzebujesz, żebym to też omówił krok po kroku? Jeżeli (ilustracja) ...

```lean
p : Prop
np : ¬p
hp : p
```

... to ponieważ (rozpakowując definicję negacji) `np : ¬p` znaczy to samo, co `np : p → False`, to
...

```lean
#check np hp -- np hp : False
```

Wiesz już, że reguła eliminacji/(z)użycia fałszu mówi, że dla dowolnego zdania, jeśli mamy dowód
fałszu/akceptujemy fałsz, to mamy dowód/akceptujemy to zdanie. Matematycy zapisują tą regułę często
w takim zwięzłym stylu:

<ins><em>Fałsz</em></ins>  
*A*

albo tak:

<ins><em>A ¬A</em></ins>  
*B*

To nie jest fragment Leana ani poprawna "wypowiedź" w języku teorii typów, tylko fragment *prozy
matematycznej* dotyczącej dedukcji naturalnej. Nazywam to prozą matematyczną, bo ten fragment
*wymaga komentarza w języku naturalnym*, nie jest więc w *pełni* sformalizowany[^1]. Czy widzisz, że
chociaż z komentarzem ("A reguła eliminacji...") zapis z poziomą kreską jest zrozumały, to bez
komentarza, który pozwala domyślić się, czym jest *A* i co oznacza ta pozioma kreska, albo nie jest
zrozumiały, albo jest zrozumiały tylko dla kogoś, kto domyśla się tych brakujących informacji?
Widzimy więc, że formalizacja służy między innymi usuwaniu powodów, dla których trzeba się domyślać,
o co właściwie chodzi.

Gdybyś chciała skorzystać z aplikacji funkcji `elim` do dowodu fałszu, to możesz to zrobić albo tak ...

`jakis_dowod_falszu_byc_moze_w_nawiasach.elim`

... albo tak ...

`False.elim jakis_dowod_falszu_byc_moze_w_nawiasach`

Leanowi będzie wszystko jedno; oferuje dwie konwencje zamiast jednej tylko dla Twojej wygody.

Podsumowując, gdy masz ochotę użyć jawnie reguły eliminacji dla fałszu, musisz mieć jakiś dowód
fałszu. Jeżeli nie masz "fałszywego założenia" (np. `h : False`), a raczej nie będziesz go mieć, bo
wtedy dowód każdego możliwego zdania byłby trywialny, to musisz udowodnić fałsz przez *odrywanie*,
czyli za pomocą reguły *modus ponens*, czyli przez zastosowanie (dowodu) negacji jakiegoś zdania
`P`, czyli implikacji `P → False`, do (dowodu) zdania `P` (poprzednika tej implikacji), czyli przez
zastosowanie funkcji typu `P → False` do odpowiedniego dla niej argumentu; z perspektywy teorii
typów i izomorfizmu Curry'ego-Howarda to wszystko jest tym samym. Użyłem tu dużej litery `P`, żeby
zasygnalizować, że to może być jakieś zdanie złożone, a nie atomowe, na przykład jakaś implikacja.
Gdy masz już dowód fałszu, po prostu mówisz Leanowi, że chcesz go zastosować do skonstruowania
dowodu zdania, które w danym miejscu "czeka na bycie udowodnionym". Byłoby najlepiej, gdybyś
spróbowała zakończyć dowód twierdzenia `tn1` używając więcej niż jednego z wymienionych sposobów,
ale nie będę się przy tym upierał.

**Polecenie**: Spróbuj teraz udowodnić to twierdzenie w wybranym przez siebie trybie. Wydaje się
trudniejsze, ale tak naprawdę wcale nie jest, tylko *wygląda* na bardziej skomplikowane. Być może
pójdzie Ci najłatwiej, jeśli wejdziesz w tryb interaktywny i zaczniesz *swobodnie eksperymentować* z
komendami `intro`, `exact`, funkcją `absurd` i aplikacjami. Jak się pogubisz, zawsze możesz usunąć
fragment zapisanego kodu i spróbować inaczej.

```lean
theorem tn2 (p : Prop) (q : Prop) : ¬(p → q) → (p → q) → q :=
```

No dobrze, teraz muszę jeszcze wymyślić jakieś zadanie, które będzie polegało na *uzyskaniu*
negacji. Negacja to szczególny rodzaj implikacji, której następnikiem jest fałsz. A każdy term o
typie implikacji to jakaś funkcja. Żeby taka funkcja mogła zwrócić dowód fałszu, ten - być może
tylko hipotetyczny - fałsz musi się skądś wziąć, nie mogą więc w tym zadaniu występować same zdania
"pozytywne", czyli same asercje. Nie możemy też po prostu w tym zdaniu-zadaniu założyć dowodu
*samego fałszu*, a raczej możemy, ale to byłoby trywialne, bo wtedy dałoby się udowodnić każde
zdanie, a więc dałoby się wtedy uzyskać dowód negacji każdego zdania, korzystając tylko z dowodu
fałszu.

Chcę żeby "na końcu strzałek" była negacja jakiegoś zdania. To może tak: `¬q → p → ¬p`? No nie, z
`¬q` i `p` w żaden sposób nie uzyskamy `¬p`, bo bez dodatkowych przesłanek `¬q` i `p` nie wejdą ze
sobą w żadną interakcję. A z `q` i `¬q`?  Zakładając dowody tych dwóch zdań uzyskamy dowód każdego
zdania za pomocą eksplozji dedukcyjnej, a więc także negacji dowolnego zdania, ale to jest już moim
zdaniem dla Ciebie zbyt łatwe. 

Chyba już wiem co zrobić. Właściwie zaproponuję Ci nie jedno, a trzy zadania na ten temat.

**Polecenie**: Wiesz już, że każdy dowód fałszu jest "wyposażony" w sposób użycia o nazwie `elim`. A
mówiąc dokładniej, gdy mamy jakiś dowód fałszu, możemy go użyć do udowodnienia dowolnego zdania,
aplikując do tego dowodu dostępną w Leanie funkcję `False.elim`. To samo możemy zapisać również
krócej, jako dowód fałszu, zaraz potem (bez spacji) kropkę i zaraz potem `elim`. Jeżeli dowód fałszu
to jakiś term złożony, na przykład aplikacja, to musimy cały ten term otoczyć nawiasami i zapisać
prawy nawias jako `).elim`. Wiem, że już o tym mówiłem, teraz tylko na wszelki wypadek przypominam.

Udowodnij więc poniższe twierdzenie, najpierw korzystając z trybu interaktywnego, a potem już bez
użycia komendy `by`. Wystarczy wprowadzić poprzednik implikacji jako założenie i użyć tego
hipotetycznego dowodu fałszu wybierając jeden ze sposobów, które dotąd objaśniłem.

```lean
theorem ex_falso_quodlibet (p : Prop) : False → p := by
```

Wcześniej obawiałem się, że takie zadanie będzie dla Ciebie trywialne, ale uświadomiłem sobie w
końcu, że chociaż samo *zadanie* jest może trywialne, to jego *sens* już niekoniecznie. Udowadniając
to twierdzenia zobaczyłaś tak wyraźnie, jak tylko się da, *że* (w logice konstruktywnej) z fałszu
wynika wszystko. Ale *dlaczego* z fałszu wynika wszystko? Wygląda na to, że fałsz jest *zdaniem
fałszywym*. Widzisz, że coś tu nie gra?  Przecież zdanie jako takie nie może być ani prawdziwe, ani
fałszywe. Może to *nie* jest *zdanie fałszywe*, tylko jakiś "fałsz jako taki"? Zawsze możemy o to
spytać Leana:

```lean
#check False -- `False : Prop`
```

Jednak zdanie. Ciekawe? Moim zdaniem bardzo. Wrócimy do tego niebawem, gdy zaczniemy się już
posługiwać [językiem kosmitów](https://en.wikipedia.org/wiki/Category_theory).

Mam nadzieję, że już niemal *widzisz*, że w początkowej części udowadnianego zdania, albo gdzieś
"wcześniej", a może "wyżej", przed dowodzonym zdaniem, na przykład jako (globalny) aksjomat, *musimy
założyć lub uzyskać dowód negacji albo fałszu, żeby uzyskać dowód jakiejś negacji albo fałszu*. A
właściwie to musimy założyć lub uzyskać dowód samej negacji, bo jakikolwiek od razu dostępny dowód
fałszu pozwoliłby nam natychmiast udowodnić wszystko, co tylko byśmy chcieli.

Zaproponuję Ci jeszcze zadanie w zasadzie takie samo jak poprzednie, jednak zamiast zdań atomowych
będą tam zdania *złożone*, będące *aplikacjami predykatów*. Te predykaty będą dotyczyć liczb
naturalnych, bo ten typ już znasz. Być może trzeba będzie otoczyć niektóre aplikacje predykatów
nawiasami.

**Polecenie**: Udowodnij poniższe twierdzenie. To twierdzenie tylko wygląda na bardziej
skomplikowane; przekonasz się, że w dowodzie nie będziesz korzystać wcale z faktu, że te zdania mają
strukturę podmiot-orzeczenie.

```lean
theorem tn3 (P : Nat → Prop) (Q : Nat → Prop) (n : Nat) : ¬ P n → (P n → Q n) := by
```

Co by tu napisać, żeby zminimalizować ryzyko paniki... Może tak: Często parametry twierdzeń
zawierają tylko informacje o tym, co *znaczą* poszczególne symbole lub nazwy, a więc wystarczy na te
parametry tylko rzucić okiem, żeby się zorientować, *o czym jest mowa*. W tym wypadku twierdzenie ma
dotyczyć jakiś predykatów `P` i `Q` i jakiejś liczby naturalnej `n`. To jest odpowiednik części
*Jeżeli* n *i* m *to liczby naturalne...*, z którą spotkałaś się w rozdziale czwartym. Właściwie to
nic ciekawego, tylko taka [nudna
księgowość](https://www.google.com/search?q=ksi%C4%99gowo%C5%9B%C4%87+nie+jest+nudna).

No dobrze, a co ze zdaniem do udowodnienia? Przecież tam są tylko *trzy* połączone strzałkami
zdania, z których dwa to tak jakby *to samo* zdanie, tylko raz występujące w postaci asercji, a raz
negacji. Spróbuj może znowu zacząć od trybu interaktywnego i swobodnie poeksperymentuj ze znanymi Ci
taktykami i funkcją `absurd`.

Może męczy Cię to moje powtarzanie, ale nie mogę zakładać, że każda czytelniczka i każdy czytelnik
na tym etapie już to złapał: Przypominam, że zapisując początek twierdzenia `tn3` musieliśmy wstawić
parametr typu `Nat`, bo inaczej nie moglibyśmy pisać zdań złożonych z predykatów dotyczących liczb
naturalnych w sposób, który byłby dla Leana "zrozumiały". Sam predykat, na przykład `Ponury`, nie
jest zdaniem (jest predykatem, a więc pewną funkcją {nie *typem* funkcyjnym}). Dopiero, dajmy na to,
`Ponury Krystian` jest zdaniem. Analogicznie, sam predykat `P : Nat → Prop`, dotyczący liczb
naturalnych, nie jest jeszcze zdaniem, dopiero aplikacja `P` do liczby naturalnej jest
zdaniem. Skoro więc mamy dowodzić zdania na temat (jakiś) własności (tutaj `P` i `Q`) liczb
naturalnych, to musimy mieć do dyspozycji co najmniej jedną, bliżej nieokreśloną (lepiej:
*arbitralną*[^2]) liczbę naturalną, której te własności mogą przysługiwać albo nie.

Wewnątrz (w lokalnym kontekście) dowodu twierdzenia `tn3` od samego początku są więc widoczne *trzy*
termy (to są właśnie parametry tego twierdzenia): (jakieś) dwa predykaty dotyczące liczb
naturalnych - `P` i `Q` - i (jakaś) liczba naturalna `n`. Wewnątrz dowodu zawsze możemy korzystać z
parametrów dowodzonego twierdzenia, bo twierdzenie to dla nas nic innego jak funkcja zwracająca term
typu `Prop`, a wewnątrz każdej funkcji możemy zawsze korzystać z jej parametrów (o ile ich lokalnie
nie przysłonimy tworząc jakby "wewnętrzny kontekst" i nadając nazwom parametrów nowe znaczenie, ale
o tym kiedy indziej).

To wszystko komplikuje strukturę *typu stałej* `tn3`, ale w tym wypadku nie ma znaczenia dla
*dowodu* tego twierdzenia. Tak naprawdę mamy tu po prostu implikację, której następnikiem jest
implikacja i której poprzednikiem co prawda też jest (szczególna) implikacja (bo negacja to tak
naprawdę implikacja), ale tej negacji-implikacji nie musimy "rozbierać na części", bo pełni tutaj
jedynie rolę przesłanki (to jest poprzednika). Obie "zwykłe" implikacje musimy kolejno "rozłączać",
wprowadzając (do kontekstu) jako lokalne hipotezy ich poprzedniki, a raczej hipotetyczne dowody
(czyli założenia) tych poprzedników. Wreszcie występującą tu negację-implikację musimy tylko -
jawnie lub niejawnie - aplikować.

## Implikacja przeciwna

Następne zadanie jest chyba trudniejsze niż te poprzednie, ale warto się z nim zmierzyć, bo dotyczy
często stosowanego twierdzenia.

**Szkielet dowodu `¬q → ¬p` zakładając `p → q`**: Jeżeli zdanie `p → q` jest prawdziwe, to jeżeli
`¬q`, to nie może być prawdą, że `p`. Gdyby bowiem *wtedy* `p` było prawdą, to moglibyśmy użyć `p →
q` do uzyskania `q`, co razem z `¬q` dawałoby nam sprzeczność.

Można to objaśnić również tak (dla uproszczenia pomijam poniżej znajdujące się cały czas w
kontekście deklaracje `p : Prop` i `q : Prop`):

Jeżeli `p → q` ...  
(kontekst: `h1 : p → q`)

... to jeżeli `¬q` ...  
(kontekst: `h1 : p → q`, `h2 : ¬q`)

... to jeżeli `p` ...  
(kontekst: `h1 : p → q`, `h2 : ¬q`, `h3 : p`)

... to z `h2 : ¬q`, `h1 : p → q` i`h3 : p` wynika fałsz  
(term kończący dowód: `h2 (h1 h3) : False`)

Czyli: Zakładając `p → q`, to zakładając `¬q`, z założenia `p` możemy wyprowadzić dowód fałszu: `p →
False`.

Czyli: Zakładając `p → q`, to zakładając `¬q` możemy wyprowadzić dowód `¬p`.
    
Czyli: Jeżeli `p → q`, to `¬q → ¬p`.

**Polecenie**: No to udowodnij teraz, albo kiedy indziej, albo wcale, jak uważasz, twierdzenie `cp`
(to skrót od [*contraposition*](https://en.wikipedia.org/wiki/Contraposition)). Użyłem tu krótszego
zapisu dla dwóch parametrów, to jest napisałem `(p q : Prop)` zamiast `(p : Prop) (q : Prop)`. Jak
już wiesz, dla Leana to znaczy to samo, ale pozwala na taki skrót tylko wtedy, gdy sąsiadujące
parametry mają ten sam typ. Przyznam, że lubię ten skrótowy zapis.

```lean
theorem cp (p q : Prop) (h : p → q) : ¬q → ¬p :=
```

W tym dowodzie masz zawsze do dyspozycji jakieś dwa zdania (`p` i `q`), ale z tego akurat będziesz
korzystać tylko "w tle". Ważniejszy jest jakiś dowód `h `implikacji `p → q`, którego również możesz
używać *bez* wprowadzania tego dowodu do kontekstu (za pomocą `intro`), bo ten dowód jest parametrem
tego twierdzenia.

Jeżeli czujesz się niepewnie, to raz jeszcze podpowiadam, że zdanie do udowodnienia jest tak
naprawdę implikacją, której poprzednikiem i następnikiem też są implikacje, ale akurat poprzednika
nie będziesz "dekonstruować". Przypuszczam, że największą trudność sprawi Ci ostatni krok, gdy celem
będzie już tylko `¬p`. A ponieważ to jest tak naprawdę implikacja, to trzeba będzie wtedy stworzyć
odpowiednią funkcję, co w trybie interaktywnym można zrobić za pomocą taktyki ...

### Przypisy

[^1]: W pełni sformalizowany fragment prozy matematycznej można by więc nazwać *matematyczną
    poezją*.

[^2]: Co ciekawe, słownik języka polskiego [nie pomaga](https://sjp.pwn.pl/slowniki/arbitralny.html)
    w zrozumieniu sposobu, w jaki słowo *arbitralny* jest często używane przez matematyków,
    filozofów, czy w ogóle ludzi zajmujących się nauką (to jest również w znaczeniu *dowolny*, albo
    *jakiś*, albo *jakikolwiek danego rodzaju*).
    
