## Teoria mnogości w zarysie

Jak być może wiesz, do niedawna w pewnym sensie najważniejszym podstawowym językiem matematyki był
język teorii mnogości, a konkretnie język teorii
[Zermelo-Frankla](https://pl.wikipedia.org/wiki/Aksjomaty_Zermela-Fraenkla). Nawet, jeżeli to wiesz,
to i tak na wszelki wypadek przytoczę tutaj odpowiedni cytat z
[Wikipedii](https://pl.wikipedia.org/wiki/Teoria_mnogo%C5%9Bci) (2024-12-29):

> Po odkryciu paradoksów tzw. naiwnej teorii mnogości udało się sformułować teorię zbiorów jako
> teorię aksjomatyczną; jej standardową wersją jest aksjomatyka ZF uwieńczona w latach 30. XX
> wieku. Stała się ona podstawą innych działów matematyki, ponieważ do pojęcia zbioru zredukowano
> inne szeroko używane obiekty jak liczby, funkcje oraz inne relacje; teoria mnogości stała się tak
> źródłem modeli różnych teorii formalnych.

Wolałbym "w ten sposób" zamiast "tak" w ostatnim zdaniu, ale trudno, jest jak jest. Nie będziemy się
teraz przyglądać aksjomatom tej teorii, ponieważ my sobie sami *zrobimy* - ze strzałek i funkcji -
pewną wersję teorii mnogości w jednym z późniejszych rozdziałów, ale zanim to nastąpi, zacznę odtąd
korzystać z teorii *ZF* jako źródła ważnych przykładów.

Pojęcie zbioru jako takiego jest interesujące przede wszystkim dla specjalistów zajmujących się
teorią mnogości, natomiast dla reszty świata to raczej nie jest nic ciekawego, bo zbiór to tylko
pewna *kolekcja* (jakiś) elementów czy obiektów. To, że teoria *ZF* ma status jednej z teorii
podstawowych w matematyce oznacza między innymi, że można skonstruować rozmaite obiekty matematyczne
posługując się tylko zbiorami. Zbiory *skończone* możemy zapisać *dosłownie*, na przykład tak:

$\set{1, 20, \*, X, -3.4}$

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, bo zapisane dosłownie nie
zmieściłyby się na żadnej stronie. Wymyślając ten przykład chciałem od razu zasugerować, że (zgodnie
z dominującym w matematyce zwyczajem) zbiory mogą zawierać dowolne elementy, na przykład takie,
które nie należą do żadnego dającego się łatwo zidentyfikować rodzaju albo typu. A więc zbiory to
takie dowolne[^1] kolekcje potencjalnie różnorodnych elementów.

Jak już wiesz, można powiedzieć, że funkcja to pewien obiekt, który przyporządkowuje każdemu
elementowi swojej dziedziny dokładnie jeden element swojej przeciwdziedziny. Żeby mieć jasny obraz
sytuacji, przygotuj proszę czystą kartkę i `Narysus okrag` o średnicy kroku. O krok w prawo od jego
prawego brzegu `Narysuj okrag` i w lewym okręgu `Narysuj Punkt x₁`, `Narysuj Punkt x₂` i `Narysuj
Punkt x₃`, jeden na drugim, oznaczając je indeksowanymi literami `x` z *lewej* strony. W prawym
okręgu tak samo `Narysuj` punkty `y₁` i `y₂`, oznaczając je z *prawej*.

Mamy już dziedzinę `X` i przeciwdziedzinę `Y`. Stosujemy tutaj dosyć powszechną konwencję, zgodnie z
którą duże litery oznaczają zbiory, a małe litery oznaczają elementy. Czasami nie sposób trzymać się
tej konwencji konsekwentnie, ponieważ zdarza się, właściwie dość często, że elementami zbiorów są
również zbiory, ale tym razem takie komplikacje nie wystąpią.  

Trzeba też wiedzieć, że to, w jakiej *kolejności* zapisane są elementy zbioru *nie ma znaczenia*,
tak samo jak nie ma znaczenia, czy ten sam element zapiszemy *więcej niż raz*. Na przykład, $\set{1,
2}$ to *ten sam* zbiór co $\set{2, 1}$ i *ten sam* co $\{1, 1, 2}$, bo do wszystkich tych zbiorów
*należą dokładnie te same elementy*, to jest $1$ i $2$, a to, jakie elementy do danego zbioru
należą, a jakie nie, *decyduje o tożsamości zbioru*. A mówiąc inaczej, to decyduje o tym, które
zbioru są różne, czyli *nierozróżnialne jako zbiory*, czyli *zastępowalne jako zbiory*: Zastąpienie
w dowolnym miejsu, w którym ma występować jakiś zbiór, na przykład zbioru $\{1, 2}$ przez zbiór
$\{2, 1, 1}$ *nic nie zmieni*, to jest zdanie pozostanie prawdziwe albo fałszywe, jeżeli to było
miejsce w jakimś zdaniu, i dany obiekt pozostanie tym samym obiektem, jeżeli to była część wyrażenia
charakteryzującego jakiś obiekt.

Można więc powiedzieć, że każdy zbiór jest tym samym, co pewna *kolekcja zdań* mówiących o tym, że
*taki a taki element należy do danego* zbioru. Być może wyjaśnienie tego w ten właśnie sposób
pozwoli Ci łatwiej zrozumieć, że powtórzenie i kolejność zapisanych elementów zbioru nie ma
znaczenia, bo przecież *treść* zawarta w kolekcji zdań mówiących o relacji należenia elementów do
zbioru *nie ulegnie zmianie*, gdy te zdania zapiszemy w innej kolejności, albo gdy niektóre zdania
zapiszemy więcej niż raz.

`Narysuj Strzalka x₁ y₁`, i tak samo dla par `⟨x₂, y₁⟩` (czyli `Narysuj Strzalka x₂ y₁`) i `⟨x₃,
y₂⟩`. Zgadza się, chcemy, żeby element `y₂` ["został na
lodzie"](https://sjp.pwn.pl/ciekawostki/haslo/zostawic-kogos-na-lodzie;5391760.html). Oznacz ten
rysunek od góry literą `f`, jak *funkcja*, bo to jest pewna funkcja: Każdemu elementowi zbioru `X`
przyporządkowałaś właśnie dokładnie jeden element zbioru `Y`. To jest użyteczny *przykład
reprezentatywny* funkcji, bo prawie wszystkie zbiory są niepuste, wiele funkcji nie "trafia" w każdy
element przeciwdziedziny i często zdarza się, że niektóre elementy "trafiają" w ten sam element.

Byłoby dobrze, gdybyś jeszcze narysowała poniżej bardziej samodzielnie dwa przykłady sposobów
przyporządkowania element*om* (czyli to będą *źródła* strzałek) jakiegoś zbioru `X` (bo po co
wymyślać dla kolejnych przykładów ciągle nowe nazwy) elementy (czyli to będą *cele*) jakiegoś zbioru
`Y`, tak, żeby to *nie* były funkcje. "Zepsuć funkcyjność" można na dokładnie *dwa* sposoby - albo
jakiś element z lewej będzie *wysyłał więcej niż jedną strzałkę*, albo jakiś element z lewej *nie
będzie wysyłał żadnej strzałki*. Takie rysunki będą poprawnymi charakterystykami pewnych *relacji*,
ale nie funkcji, bo funkcje to *relacje specjalne*, to jest takie, jak już wyjaśniłem.

Odtąd ograniczymy nasze rozważania do dowolnych zbiorów *skończonych*, to jest takich, które mają
skończenie wiele elementów. Mówiąc dokładniej, będziemy teraz opisywać świat (albo *przestrzeń*)
złożony tylko z takich i dowolnych takich zbiorów i dowolnych funkcji między takimi zbiorami.
