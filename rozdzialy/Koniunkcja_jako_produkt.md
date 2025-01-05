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

`{1, 20, *, X, -3.4}`

Zbiory *nieskończone* możemy tylko w jakiś sposób *scharakteryzować*, bo zapisane dosłownie nie
zmieściłyby się na żadnej stronie. Wymyślając ten przykład chciałem od razu zasugerować, że (zgodnie
z dominującym w matematyce zwyczajem) zbiory mogą zawierać dowolne elementy, na przykład takie,
które nie należą do żadnego dającego się łatwo zidentyfikować rodzaju albo typu. A więc zbiory to
takie dowolne kolekcje potencjalnie różnorodnych elementów.

Jak już wiesz, można powiedzieć, że funkcja to pewien "obiekt", który przyporządkowuje każdemu
elementowi swojej dziedziny dokładnie jeden element swojej przeciwdziedziny. Żeby mieć jasny obraz
sytuacji, przygotuj proszę czystą kartkę i `Narysus okrag` o średnicy kroku. O krok w prawo od
prawego brzegu tego okręgu również `Narysuj okrag`. W lewym okręgu `Narysuj Punkt x₁`, `Narysuj
Punkt x₂` i `Narysuj Punkt x₃`, jeden nad drugim, oznaczając je indeksowanymi literami `x` (to
znaczy oznaczając je jako `x₁`, `x₂` i `x₃`) z *lewej* strony. W prawym okręgu tak samo `Narysuj`
punkty `y₁`, `y₂` i `y₃`, oznaczając je z *prawej*.

Mamy już (kandydata na) dziedzinę `X` i (kandydata na) przeciwdziedzinę `Y`. Stosujemy tutaj dosyć
powszechną konwencję, zgodnie z którą duże litery oznaczają zbiory, a małe litery oznaczają
elementy. Czasami nie sposób trzymać się tej konwencji konsekwentnie, ponieważ zdarza się, właściwie
dość często, że elementami zbiorów są również zbiory, ale tym razem takie komplikacje nie wystąpią.

Trzeba wiedzieć, że to, w jakiej *kolejności* zapisane są elementy zbioru *nie ma znaczenia*, tak
samo jak nie ma znaczenia, czy ten sam element zapiszemy *więcej niż raz*. Na przykład, `{1, 2}` to
*ten sam zbiór* co `{2, 1}` i *ten sam zbiór* co `{1, 1, 2}`, bo do wszystkich tych zbiorów *należą
dokładnie te same elementy*, to jest `1` i `2`, a to, które elementy do danego zbioru należą, a
które nie, *decyduje o tożsamości zbioru*. Celowo napisałem *ten sam zbiór*, a nie na przykład *ten
sam obiekt*, bo takie *zapisy* można przecież *interpretować dowolnie* (interpretacja jest zawsze
pewnym *wyborem*, pamiętasz?), a z pewnych punktów widzenia te trzy wyrażenia na pewno mogłyby
oznaczać różne "rzeczy". A mówiąc to samo, ale inaczej: To, które elementy należą, a które nie
należą do danego zbioru decyduje o tym, które zbiory są *równe*, czyli *nierozróżnialne jako
zbiory*, czyli *wzajemnie zastępowalne jako zbiory*. Zastąpienie w dowolnym miejsu, w którym ma
występować jakiś zbiór, na przykład zbioru `{1, 2}` przez zbiór `{2, 1, 1}` *nic nie zmieni*, to
jest zdanie pozostanie prawdziwe albo fałszywe, jeżeli to było miejsce w jakimś zdaniu, i dany
obiekt pozostanie tym samym obiektem, jeżeli to była część wyrażenia charakteryzującego jakiś
obiekt.

Można więc powiedzieć, że *każdy* zbiór jest *tym samym*, co pewna *kolekcja zdań* mówiących o tym,
że *taki a taki element należy do danego zbioru*. Być może wyjaśnienie tego w ten właśnie sposób
pozwoli Ci łatwiej zrozumieć, że powtórzenie i kolejność zapisanych elementów zbioru nie ma
znaczenia, bo przecież *treść* zawarta w kolekcji zdań mówiących o relacji należenia elementów do
zbioru *nie ulegnie zmianie*, gdy te zdania zapiszemy w innej kolejności, albo gdy niektóre zdania
zapiszemy więcej niż raz.

`Narysuj Strzalka x₁ y₁`, i tak samo dla par `⟨x₂, y₁⟩` (czyli `Narysuj Strzalka x₂ y₁`) i `⟨x₃,
y₂⟩`. Zgadza się, chcemy, żeby element `y₃` ["został na
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

Można więc myśleć o funkcjach jako o abstrakcyjnych własnościach pewnego rodzaju. Na przykład, można
powiedzieć, że na Twoim pierwszym rysunku każdy element zbioru `X` ma określoną `f-`*własność*
`Y`. Albo można o funkcjach myśleć jako o *doskonałych pomiarach* pewnych właściwości. Jak zawsze,
warto o tym samym myśleć czasem na wiele różnych sposobów.

Odtąd ograniczymy nasze rozważania do dowolnych zbiorów *skończonych*, to jest takich, które mają
skończenie wiele elementów. Mówiąc dokładniej, będziemy teraz opisywać świat (albo *przestrzeń*) w
którym istnieją tylko zbiory skończone, w którym występują dowolne takie zbiory, a także
wszystkie możliwe funkcje między takimi zbiorami.

## An arrow is an arrow is an arrow ...

Może zapnij pasy, a jak nie masz, to nie wiem, zrób cokolwiek, żebyś mogła czuć w miarę
bezpiecznie. Będziemy teraz [mówić jednocześnie w kilku
językach](https://www.youtube.com/watch?v=33Raqx9sFbo), to jest w języku zbiorów skończonych, języku
teorii kategorii, języku teorii typów i języku naturalnym.

`∀ X : Zbior`, istnieje funkcja `Idₓ` taka, że `f(x) = x`. Poznajesz? To nic innego jak (w tym
momencie teoriomnogościowa) identyczność działająca na elementach zbioru `X`. Poniżej najniższego
rysunku `Narysuj Punkt X` i strzałkę o nazwie `Idₓ`, która zawija się w taki sposób, że `Zrodlo Idₓ`
i `Cel Idₓ` to `Punkt X`. Zwróć uwagę, że ten rysunek to *wyrażenie w języku teorii kategorii*, a
*nie* w języku teorii zbiorów. To znaczy, że właśnie *zmieniłaś język*, a więc również *punkt
widzenia*.

Na to, co wcześniej nazywałem punktami, zwykle używa się nazwy *obiekt* , jednak zależało mi, żebyś
pamiętała, że *w teorii kategorii* obiekty to *tylko punkty zaczepienia strzałek*. Strzałki w tej
teorii nazywamy często *morfizmami* albo *odwzorowaniami*, ale te nazwy, podobnie jak słowo
*obiekt*, oddają dobrze *genezę* teorii kategorii, za to *nie* oddają dobrze *uniwersalności jej
zastosowań* i sposobu, w jaki jej *używamy*. Wiedząc już o mylącym charakterze tych słów, pod
rysunkiem napisz *komentarz*: W teorii kategorii każdy obiekt jest wyposażony w morfizm
identycznościowy. Każdy taki morfizm jest endomorfizmem.

Skoro już to zapisałaś i już wiesz, że używam słowa *punkt* w sposób niestandardowy, będę tak nadal
mówił, bo mam wrażenie, że tak Ci będzie łatwiej o tym konsekwentnie *myśleć*; sam zresztą całkiem
niedawno odkryłem, że mi to pomaga.

Morfizmy w teorii kategorii (czyli strzałki w tej teorii) nazywamy *endomorfizmami* (od
starogreckiego [ἔνδον](https://en.wiktionary.org/wiki/%E1%BC%94%CE%BD%CE%B4%CE%BF%CE%BD)
oznaczającego *w* albo *wewnątrz* \{i wtedy raczej nie nazywamy ich "endostrzałkami", bo to nie
brzmi dobrze\}) *wtedy i tylko wtedy*, gdy są właśnie takimi "zawijasami" jak identyczności (ale
istnieją też inne endomorfizmy, które nie są identycznościami), to znaczy, gdy mają *to samo źródło
i cel*.

Żeby coś, co nie jest opisane czy scharakteryzowane jawnie jako kategoria zasługiwało (z pewnego
punktu widzenia!) na nazwę kategoria, musi istnieć sposób opisu części struktury tego czegoś w
języku punktów i strzałek, spełniający następujące wymagania (nie trzeba panikować, znowu będę się
powtarzał i omówię też dość szczegółowo kilka prostych przykładów):

1. Wszystkie części określonego rodzaju postrzegamy jako punkty.

2. Wszystkie części określonego rodzaju postrzegamy jako strzałki.

W ten sposób, że:

3. Każdy punkt `X` ma swoją (endo)strzałkę identycznościową `Idₓ`.

4. Istnieje operacja na obiektach źrodłowych (to jest będących częściami struktury tego czegoś, co
   opisujemy jako kategorię), która odpowiada *składaniu strzałek* i którą oznaczamy czasem *w
   języku kategorii* za pomocą symbolu `∘`, taka, że dla dowolnych (a więc też potencjalnie równych,
   to jest zastępowalnych parami) strzałek `f`, `g` i `h` (uwaga, będą "skróty myślowe"):

    4-1. `Id f = f Id = f`
    
    4-2. `f ∘ (g ∘ h) = (f ∘ g) ∘ h`

