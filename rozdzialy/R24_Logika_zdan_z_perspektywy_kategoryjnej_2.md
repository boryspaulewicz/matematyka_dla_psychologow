<!-- -*- coding: utf-8 -*- -->
Wtedy dla każdych trzech kolejno składalnych strzałek `a'`, `b'` i `c'`, złożenie `(c' b') a'`
będzie odpowiadało złożeniu `a (b c)`, które jest z założenia (że `ℂ` to kategoria) równe złożeniu
`(a b) c`, a złożenie `(a b) c` będzie odpowiadało złożeniu `c' (b' a')` w `ℂ'`, a więc `(c' b') a'
= c' (b' a')`. Łączność składania będzie więc zachowana. Identyczności pozostaną natomiast niemal
tymi samymi identycznościami, bo punkty "zostaną na swoich miejscach", każda endostrzałka po
odwróceniu będzie (niemal, bo to dwie różne kategorie) tą samą strzałką, a każde złożenie o postaci
`f Id = f` będzie odpowiadało złożeniu `Id' f' = f'` w `ℂ'`, i tak samo dla złożeń o postaci `Id f`.

W przypadku kategorii skończonych można zobaczyć, jak "działa" zasada dualności również w inny
sposób. Zacznijmy od strzałek `a : X → Y`, `b : Y → Z`, `c : Z → V` i `d : X → U`. Ten *graf* to
jeszcze nie kategoria, bo nie ma tu ani identyczności, ani operacji składania. Tym razem jednak
wygenerujemy wolną kategorię nad tym grafem inaczej.

**Rysunek 3**: `Narysuj` proszę tabelkę, ale taką "niedomkniętą" ani z dołu, ani z
prawej. Zaczynając z góry oznacz z lewej strony kolejne rzędy jako `a`, `b`, `c` i `d`, i tak samo
oznacz kolejne kolumny. Każda kratka w tej tabelce będzie złożeniem strzałki-kolumny i
strzałki-rzędu: Jeżeli `f` to kolumna kratki i `g` to jej rząd, czyli jeżeli kratka to (to samo c
para uporządkowana) `(g, f)`, to ta kratka ma zawierać złożenie `g f`. Czyli wartość każdej kratki
uzyskujemy do-kładając strzałki oznaczające rzędy do strzałek oznaczających kolumny. Pomijamy rzędy
i kolumny oznaczające elementy neutralne, bo nie musimy ich tak reprezentować (chociaż moglibyśmy je
wstawiać jako *wartości* kratek), bo to są w pewnym sensie tylko punkty (jako specjalne strzałki).

Na naszym grafie nie ma żadnych endostrzałek, a więc kratki na przekątnej pozostaną puste, bo tylko
endostrzałki mogą się składać same ze sobą. Nie ma też na tym grafie żadnej strzałki kompatybilnej
ze strzałkami `a` i `b`, a więc musimy dodać nową strzałkę w kratce `(b,a)` i nadać jej unikalną
nazwę. Pierwsza niewykorzystana litera alfabetu to `e`, dlatego nazwiemy ją `e`. Możesz od razu
dorysować tą strzałkę do grafu i wyrazić fakt, że `e = b a` za pomocą ptaszka. Strzałka `a` nie jest
składalna ani ze strzałką `c` ani `d`, a więc kratki `(c,a)` i `(d,a)` pozostaną puste. Strzałka `b`
jest składalna tylko ze strzałką `c`. Nie mamy jeszcze strzałki, która mogłaby być tym złożeniem, a
więc nadajemy jej nazwę `f`, zapisujemy ją w kratce `(c,b)`, i dorysowujemy ją do grafu, zaznaczając
za pomocą ptaszka, że `f = c b`.

Będzie z tym trochę zabawy i pojawią się kolejne strzałki, których złożenia też trzeba będzie
sprawdzić i być może dodać, ale już wiesz, jak to należy zrobić, prawda? Gdy ta tabelka będzie już
skończona, będziesz mogła uzyskać dualną wersję uzyskanej w ten sposób wolnej kategorii nad grafem
*transponując* tą tabelkę, to znaczy rysując nową tabelkę taką, że to, co było w oryginalnej tabelce
w kratce `(i,j)`, gdzie `i` i `j` to nazwy jakiś strzałek w oryginalnej kategorii, będzie w tej
nowej tablce w kratce `(j,i)` (albo `(j',i')`). Wtedy będzie też widać jak na dłoni (albo jak na
kartce), że kategoria dualna, chociaż nie musi być całkiem taka sama, jest jednak w pewnym
ogólniejszym sensie taka sama. Gdy kategoria jest skończona, jej dualna wersja to przecież *ta sama
tabelka, tylko przetransponowana*.

Dualizowalność konstrukcji wyrażonych w języku teorii kategorii można również opisać tak: Każda
*struktura* w kategorii `ℂ` odpowiada swojemu dualnemu odpowiednikowi (mhm) w kategorii dualnej
`ℂ'`, i vice versa. Na przykład, każdemu punktowi początkowemu i każdemu produktowi w `ℂ` odpowiada
dokładnie jeden punkt końcowy i koprodukt w `ℂ'` odpowiednio, i tak samo dla każdej innej
konstrukcji strzałkowo-złożeniowej. Kategorie występują więc zawsze w dualnych parach. Zasada
dualności dotyczy wszystkich konstrukcji z obiektów i strzałek i wszystkich konstrukcji opartych na
złożeniach, czyli *wszystkich definicji i zdań w języku teorii kategorii*. A to znaczy, że
definiując *jeden* rodzaj konstrukcji kategoryjnej, automatycznie definiujemy *dwa* dualne względem
siebie rodzaje konstrukcji, i udowadniając *jedno* zdanie wyrażone w języku teorii kategorii
automatycznie udowadniamy *dwa* dualne względem siebie zdania!

Ta niezwykła cecha teorii kategorii wymaga niestety trochę czasu, żeby się do niej przyzwyczaić,
podobnie jak niemało czasu wymaga przyzwyczajenie się do pisania czasem lewą ręką, gdy całe życie
pisało się prawą. Na szczęście, rzadko rozważamy całe dualne kategorie; na ogół skupiamy się raczej
na *wybranych* fragmentach albo własnościach jakiejś kategorii, na przykład na konkretnych rodzajach
struktur wewnątrz jakiejś kategorii, takich jak punkt początkowy, albo na konkretnych twierdzeniach,
i *odwracamy strzałki i złożenia "lokalnie", to jest tylko w ramach opisów tych konstrukcji,
własności albo twierdzeń*, tak jak to zresztą robimy w tym rozdziale.

Jeżeli teraz odwrócisz wszystkie strzałki i złożenia (a tam akurat są jakieś złożenia) w definicji
*produktu*, to uzyskasz definicję *koproduktu*: Koproduktem obiektów `X` i `Y` nazywamy taki obiekt,
który możemy oznaczyć jako `X + Y`, że istnieją strzałki `i₁` i `i₂`, nazywane *injekcjami*, *z* `X`
*do* `X + Y` i *z* `Y` *do* `X + Y` odpowiednio (odwrócenie strzałek występujących w definicji
produktu) takie, że dla każdej pary strzałek `f` i `g` *z* `X` i `Y` *do* jakiegoś `Z` odpowiednio
(kolejne odwrócenie strzałek) istnieje unikalna strzałka `f+g` (ale uwaga, bardzo różnie się to
zapisuje) *z* `X + Y` *do* `Z` (kolejne odwrócenie) taka, że `f+g i₁ = f` i `f+g i₂ = g` (odwrócenie
złożeń wymuszone przez odwrócenie strzałek). Żeby to było łatwiej zobaczyć, zapiszę te dwie
definicje formalnie.

Produkt punktów `X` i `Y` to taki punkt, który oznaczamy jako `X × Y`, że:  
`∃ π₁ : X × Y → X, ∃ π₂ : X × Y → Y, ∀ Z : Ob, ∀ f : Z → X, ∀ g : Z → Y, ∃¹ ⟨f,g⟩ : Z → X × Y,`  
`π₁ ⟨f,g⟩ = f ∧ π₂ ⟨f,g⟩ = g`

*Ko*produkt punktów `X` i `Y` to taki punkt, który oznaczamy jako `X + Y`, że:  
`∃ i₁ : X → X + Y, ∃ i₂ : Y → X + Y, ∀ Z : Ob, ∀ f : X → Z, ∀ g : Y → Z, ∃¹ (f+g) : X + Y → Z,`  
`(f+g) i₁ = f ∧ (f+g) i₂ = g`

gdzie `Ob` oznacza typ obiekt w danej kategorii, a `∃¹`, jak już wiesz, czytamy jako istnieje
dokładnie jedno coś pewnego rodzaju.

W kategorii `Set` koprodukty to dokładnie znane Ci już sumy rozłączne zbiorów. Żeby się o tym
przekonać, wystarczy popatrzeć na rysunek struktury wewnętrznej dowolnej sumy rozłącznej dwóch
zbiorów skończonych, na którym widać też strukturę wewnętrzną injekcji. Ponieważ ... 

Suma rozłączna zawiera *tylko wierne kopie* zbiorów - nazwijmy je znowu `X` i `Y` - będących jej
członami, *oznakowane* w taki sposób, żeby żadne dwa elementy z obydwu zbiorów nie były trafione
przez wewnętrzne strzałki obydwu (w tym wypadku injektywnych) injekcji.

... to gdy tylko określimy, dla dowolnego zbioru `Z`, do jakich elementów `Z` mają być posłane przez
jakieś funkcje `f : X → Z` i `g : Y → Z` elementy `X` i `Y` odpowiednio, to wtedy to, do czego ma
być posłana każda kopia w `X + Y`, żeby powstająca w ten sposób funkcja `(f+g) : X + Y → Z` dołożona
do injekcji dawała funkcje `f` i `g`, będzie wymuszone (i będzie istniała taka funkcja). I
odwrotnie, każda funkcja `h : X + Y → Z` będzie oczywiście opdowiadała unikalnej parze
uporządkowanej strzałek z `X` i `Y` do `Z` odpowiednio, bo złożenia `h i₁` i `h i₂`, jak to
złożenia, są unikalne. Wiem, że to jest trudne. Ale to jest też piękne i bardzo przydatne w wielu
sytuacjach.

Można też powiedzieć, że symbol `+`, za pomocą którego oznaczamy czasem w języku teorii kategorii
operację tworzenia koproduktów, reprezentuje jakby drugą stronę albo "wywiniętą na drugą stronę"
wersję tego, co oznaczamy w teorii kategorii za pomocą symbolu `×`, czyli oznacza "wywiniętą na
drugą stronę" wersję operacji tworzenia produktów. A w kategorii `FinSet` (zbiorów skończonych) te
operacje odpowiadają, jak wiesz z jednego z poprzednich rozdziałów, operacjom dodawania i mnożenia
liczb naturalnych, zrealizowanym w zbiorach skończonych za pomocą operacji tworzenia sum rozłącznych
i iloczynów kartezjańskich.

Ponieważ te konstrukcje są z perspektywy teorii kategorii swoimi dualnymi odpowiednikami, możemy z
tego punktu widzenia *zobaczyć* - nawet całkiem dosłownie, gdybyśmy przedstawili to za pomocą
diagramów - głęboki związek między dodawaniem i mnożeniem, a tym samym dostrzec, że te dwie operacje
są w pewnym technicznym i abstrakcyjnym sensie *dwiema wersjami tej samej operacji*.

Często, ale nie zawsze, bo to czasem źle brzmi, konstrukcje dualne do takich konstrukcji, które
wydają się bardziej podstawowe albo są częściej używane, nazywamy w teorii kategorii tym samym
określeniem, ale dodając przedrostek *ko* (a po angielsku *co*, jak w pytaniu *co to ma
być?*). Produkty pojawiają się w matematyce znacznie częściej niż koprodukty, dlatego właśnie w
nazwie *produkt* przedrostek *ko* nie występuje. Ale mógłby występować, ponieważ dualizacja jest
operacją odwracalną, a zatem produkt to ... kokoprodukt.

## [To ja dziękuję bardzo](https://strangerthings.fandom.com/wiki/The_Upside_Down)

Gdy tylko uda nam się znaleźć kategoryjny odpowiednik pojęcia, konstrukcji lub zdania w jakiejś
opisanej jako kategoria "przestrzeni" (na przykład, kategoryjny odpowiednik zbioru pustego, będącego
częścią struktury przestrzeni zbiorów i funkcji), możemy zacząć szukać odpowiedników tych struktur w
innych kategoriach. No to teraz poszukamy znanych Ci już konstrukcji kategoryjnych w kategorii
powstającej w naturalny sposób z relacji dowiedlności zdefiniowanej na zdaniach. Przypominam, że w
tej kategorii punkty są zdaniami (albo zdania są punktami), a strzałki to przypadki (fakty)
zachodzenia relacji dowiedlności zdań ze zdań.

Czy ta kategoria *ma* obiekt początkowy? A jeśli ma, to *czym* on jest? Otóż obiektem początkowym w
tej kategorii jest dobrze nam już znany *Absurd*, inaczej *zdanie fałszywe*, które w Leanie jest
zdefiniowane tak:

```lean
inductive False : Prop
```

To jest *cała* definicja zdania `False`. **Czytamy to** w ten sposób: Definiuję indukcyjnie
(`inductive`), czyli przez *wymienienie wszystkich możliwych sposobów konstruowania termów
definiowanego typu danych*, zdanie `False` (`False : Prop`) jako typ, którego termów (czyli tutaj
dowodów) *nie da się skonstruować*. Dlatego ta definicja indukcyjnego typu danych kończy się tak
gwałtownie.

Zdanie/typ `False` jest ewidentnie obiektem analogicznym do zbioru pustego w kategorii `Set`. Tak
samo jak zbiór pusty, typ `False` spełnia warunki kategoryjnej definicji obiektu początkowego: Dla
każdego zdania `P`, czyli dla każdego punktu w rozpatrywanej teraz kategorii dowiedlności zdań ze
zdań, jak już wiesz, można udowodnić zdanie `False → P`, czyli istnieje *jakaś* strzałka z punktu
`False` do punktu `P`, bo z fałszu wynika wszystko. Co więcej, istnieje *co najwyżej jedna* taka
strzałka, bo w tej kategorii nie ma nigdy dwóch różnych równoległych strzałek, bo to jest cienka
kategoria, a jest cienka, bo to jest pewna relacja (dowiedlności \{jako kategoria\}). A dlaczego
zawsze można zdefiniować funkcję (czyli udowodnić implikację) z `False` do dowolnego zdania? Bo
każda taka funkcja *nie ma nic do przetworzenia*.

Obiektem dualnym do zdania fałszywego w tej kategorii jest *zdanie prawdziwe*, które w Leanie jest
zdefiniowane tak:

```lean
inductive True : Prop where
  | intro : True
```

**Czytamy to** w ten sposób: Definiuję indukcyjnie zdanie `True` jako takie, że (`where`) term/dowód
tego typu/zdania można skonstruować *w dokładnie jeden sposób* (bo w ciele tej definicji jest tylko
jedna pozioma kreska `|`) *z niczego* (bo wyrażenie za tą kreską nie ma parametrów) jako term
`intro` typu `True`. Tworząc definicje indukcyjne automatycznie tworzymy też przestrzenie nazw dla
ciał tych definicji, dlatego normalnie zapisujemy ten jedyny term/dowód typu/zdania `True` jako
`True.intro`. Jak łatwo sprawdzić, to zdanie spełnia wymagania obiektu końcowego ze względu na
interpretację strzałek jako czegoś, co wyraża relację dowiedlności zdań:

```lean
example (P : Prop) : P → True := True.intro
```

A więc z perspektywy kategoryjnej zdanie prawdziwe albo prawda i zdanie fałszywe albo fałsz są
obiektami dualnymi, a więc w pewnym sensie są tym samym obiektem, tylko każdy z nich jest - z
pewnego, to jest kategoryjnego punktu widzenia - "wywróconą na drugą stronę" wersją
drugiego. Widzimy też, że istnieje oczywiste podobieństwo między typem/zdaniem `True` i każdym
możliwym singletonem.

Strzałki *do* obiektów końcowych i strzałki *z* obiektów początkowych są - co wynika z definicji
tych obiektów - *trywialne*.  Za to strzałki *z* obiektów końcowych i *do* obiektów początkowych nie
są. Na przykład, strzałki *z* "końcówek" w `Set` to elementy (ważne pojęcie), a jeżeli istnieje
strzałka z `X` *do* "początku" w `Set`, to `X` jest początkiem, więc taka strzałka mówi coś
ważnego. A w kategorii dowiedlności? Dla każdego zdania `P`, istnieje strzałka *z* końcówki `True`
*do* `P` wtedy i tylko wtedy, gdy `P` jest zdaniem prawdziwym, na przykład, gdy `P` jest zdaniem
(nie strzałką w tej kategorii!) `q → q`, bo tylko wtedy, gdy `P` jest zdaniem prawdziwym, można
skonstruować dowód implikacji `True → P`. I dualnie, dla każdego zdania `P`, istnieje strzałka *z*
`P` *do* początku `False` wtedy i tylko wtedy, gdy istnieje dowód negacji `P`, czyli kiedy `P` jest
zdaniem fałszywym. A więc asercja (`P`, dla jakiegoś `P : Prop`) i negacja (`¬ P` dla jakiegoś `P :
Prop`) są swoimi dualnymi odpowiednikami.

Produkty w tej kategorii to *koniunkcje zdań*: Dla każdego zdania `P` i zdań `Q` i `R`, jeżeli z `P`
wynika `Q` i z `P` wynika `R`, czyli jeżeli można udowodnić implikacje `P → Q` i `P → R`, czyli
jeżeli w logice zdań jako kategorii dowiedlności zdań ze zdań istnieją strzałki `P → Q` i `P → R`,
to istnieje unikalna strzałka z `P` do `Q × R`, czyli istnieje dowód implikacji `P → Q ∧ R`. Ten
dowód jako strzałka składa się z projekcjami `Q × R → Q` i `Q × R → R`, czyli dowód tej implikacji
składa się z dowodami zdań `Q ∧ R → Q` i `Q ∧ R → R`, dając jedyne możliwe strzałki `P → Q` i `P →
R` odpowiednio, bo te złożenia nie mogą dawać innych strzałek, bo nie ma tu żadnych par różnych
równoległych strzałek. W dodatku koniunkcja zdań jest zdefiniowana w Leanie jako para uporządkowana
zdań, a więc każdy dowód koniunkcji to para uporządkowana dowodów zdań będących jej członami, co
dodatkowo podkreśla ścisły związek między kategoryjnym pojęciem produktu (i iloczynem kartezjańskim
zbiorów) i pojęciem koniunkcji w logice zdań.

*Koproduktami* w tej kategorii są natomiast dokładnie *alternatywy* zdań, które zapisujemy prawie
jak koniunkcje, tylko odwracając symbol `∧` do góry nogami, czyli używając symbolu `∨`. W tym
momencie, może jeszcze tego nie wiedząc w znaczeniu psychologicznym, w innym znaczeniu wiesz już w
zasadzie wszystko o logicznej alternatywie, bo "funkcjonalnie" logiczna alternatywa to dokładnie
lustrzane odbicie koniunkcji. Tak oto wyjaśnił nam się tytuł tego rozdziału (w którym `~` oznacza
"jest w pewien sposób tym co"):

`p ∧ q ~ p ← ∘ → q ~ X ← ∘ → Y ~ X → ∘ ← Y ~ p → ∘ ← q ~ p ∨ q`

No i powiedz teraz, czy jest coś bardziej praktycznego, niż dobra teoria?
