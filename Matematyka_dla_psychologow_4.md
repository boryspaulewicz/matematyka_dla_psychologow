# Cel

Jeżeli dotarła/eś do tego momentu, to chyba mogę Ci wyjawić prawdziwy cel naszej podróży. Zamierzam
wytłumaczyć Ci między innymi, na czym polega istota wnioskowania statystycznego, w wersji
częstościowej i bayesowskiej. Będę przy tym w pewnym sensie oszukiwał, ale tak naprawdę nie. To
znaczy, niektóre zdania, które w tych teoriach są twierdzeniami i niektóre pojęcia, które są w nich
definiowane za pomocą pojęć bardziej elementarnych będę wprowadzał aksjomatycznie.

Już chyba rozumiesz, że nic złego się wtedy nie stanie, bo dowód jest zwykle nieważny, liczy się
tylko istnienie dowodu. A definicje mogą być dowolne, są bowiem tylko wyborami językowymi i ich
wartość sprowadza się do użyteczności i formalnej poprawności. To nadal będzie jednak dopiero
początek.

Omówimy następnie podstawy wnioskowania przyczynowego. Dzięki temu będziemy mogli zarazem głęboko i
jasno zrozumieć o co chodzi w badaniach obserwacyjnych i eksperymentalnych, a także o co chodzi w
pomiarze, o ile interpretujemy go czysto przyczynowo.

Mając do dyspozycji te wszystkie narzędzia, dokonamy *pełnej formalizacji* dwóch rodzajów "obiektów
prozaicznych" - naukowego artykułu empirycznego i naukowego artykułu teoretycznego. Okaże się wtedy,
że nie ma między nimi w zasadzie różnicy, bo każdy artykuł empiryczny zawiera teoretyczny fragment,
a każdy artykuł teoretyczny służy ostatecznie do zmiany sposobu wnioskowania z wyników empirycznych
badań. Dzięki temu dostrzeżemy możliwość istnienia alternatywnego sposobu uprawiania nauki, z
perspektywy którego tracą na znaczeniu takie praktyki jak na przykład prerejestracja badań,
testowanie hipotez, czy nawet proces recenzji. Bo też jaką rolę może odegrać recenzent czy redaktor,
gdy *całe* rozumowanie jest sformalizowane i sprawdzone maszynowo pod względem poprawności? Wyrazić
zainteresowanie albo jego brak? A może jakąś inną subiektywną opinię?

Ponieważ taki sformalizowany artykuł naukowy będzie pewnym programem komputerowym wraz z
dokumentacją, wyrażającym w języku teorii typów zależnych rozumowanie, które obecnie komunikujemy
posługując się prawie wyłącznie językiem naturalnym, to te artykuły będzie można *składać* w większe
programy. Nietrudno wyobrazić sobie, że kolekcja takich napisanych we wspólnym języku artykułów
mogłaby tworzyć biblitekę wiedzy naukowej, złożonej dosłownie ze *strumieni wnioskowania z
danych*. Praca teoretyczna polegałaby wtedy na odkrywaniu nowych sposobów łączenia danych z
wnioskami i odkrywania nowych wniosków, a więc na *przekierowywaniu* dedukcyjnych strumieni
empirycznych albo "zasilających wnioski". Praca *czysto empiryczna* polegała by zaś na dostarczaniu
danych w taki sposób, żeby zminimalizować konflikt interesów.

Czemu mówię o konflikcie interesów? W tym momencie każdy artykuł empiryczny powinien w zasadzie
zawierać adnotację o występowaniu takiego konfliktu. Mam na myśli konflikt interesów, który jest
zarazem powszechny i o którym, o ile mi wiadomo, w ogóle się nie mówi - *autor artykułu i wniosków
jest zwykle odpowiedzialny za zbieranie lub analizę danych*. Dlatego tak zwane wątpliwe praktyki
badawcze (ang. *questionable research practices*) są w ogóle *możliwe*. W połączeniu z silnie i
stale oddziałującymi zachętami, takimi jak rozliczanie pracowników niemal wyłącznie z *ilości*
publikacji, *ilości* punktów publikacyjnych i *ilości* grantów, ta możliwość musi często prowadzić
do wątpliwych praktyk, ponieważ naukę, na moje między innymi szczęście, uprawiają *zwykli ludzie*,
tacy jak Ty czy ja. Jestem durniem i wielu rzeczy nie rozumiem, ale gdybym miał zgadywać,
powiedziałbym, że sedno tego problemu polega na tym, że w obecnym systemie wątpliwe praktyki
badawcze są *bardzo opłacalne* i jednocześnie *łatwe*.

Zwróć proszę uwagę, że gdyby istniał ten alternatywny sposób uprawiania nauki, który teraz sobie
wyobrażamy, nie miałoby znaczenia, czy autorem "artykułu" jestem ja, pracownik zatrudniony na
uczelni, czy Ty, albo dajmy na to Twoja babcia. Bo czemu miałoby to mieć *jakiekolwiek* znaczenie?
Gdyby okazałoby się, że Twoja babcia ma coś ważnego do powiedzenia na interesujący z naukowego
punktu widzenia temat, to chyba wypadałoby potraktować Ją poważnie. Ja tak w każdym razie
sądzę. Gdyby Twoja (albo niestety już nieżyjąca moja) babcia potrafiła dobrze uzasadnić swoje
wnioski, to te wnioski powinny być traktowane tak samo jak uzasadnione wnioski pracownika
naukowego. Wydaje mi się, że się z tym zgodzisz, bo nie potrafię dostrzec nawet tylko zarysu
jakiegoś sensownego kontrargumentu.

Wracając do celów, następnie podejmiemy próbę sformalizowania rozumowań, które będą wymagały
wprowadzenia dość zaskakującej, ale bardzo prostej definicji - definicji pojęcia *zadania*. Dzięki
tej jednej abstrakcyjnej definicji będziemy mogli całkowicie zakodować w języku teorii typów
zależnych artykuł naukowy dotyczący pewnego prostego zjawiska swoiście *psychologicznego*. Zaczniemy
się wtedy przyglądać z nowej perspektywy *całej* psychologii, dokładnie tak jak już zaczęliśmy się
przyglądać z nowej perspektywy matematyce. Z matematyką robiliśmy to mówiąć *tylko* o implikacji i z
psychologią zrobimy to samo mówiąc *tylko* o jednym prostym psychologicznym badaniu
eksperymentalnym. W dodatku tam też będziemy wręcz zmuszeni, żeby wprowadzić symbol *strzałki*.

Wprowadzenie formalnej wersji definicji zadania będzie umotywowane pewnym wglądem. Ten osobliwy
wgląd przytrafił mi się w końcu po ponad dwudziestu latach uczenia się i myślenia wciąż o jednym
małym zbiorze kilku ściśle ze sobą powiązanych zagadek dotyczących podstaw psychologii:

*Cel, zadanie, wartość i norma są jednym i tym samym - preferencją hipotetycznego zewnętrznego
obserwatora*.

*Zachowanie, ten centralny przedmiot zainteresowania psychologii, to nic innego jak działanie celowe
w przyjętym znaczeniu pojęcia cel*.

Stąd będzie wynikał między innymi taki oto dziwny wniosek:

*Bycie takim a nie innym zachowaniem jest stopniowalne i może być jedynie przybliżane przez
rzeczywiste procesy fizyczne*.

W ten sposób rozwiążemy, a raczej *unieważnimy*, zagadkę (nie)racjonalności zachowania zwierząt.

Nie tylko ten wniosek będzie zresztą dziwny. Zobaczymy w nowym świetle sens pomiaru
psychologicznego. Zamiast próbować, jak to mają w zwyczaju psychologowie poznawczy i nie tylko oni,
zobaczyć to, co:

niewidzialne

ekstremalnie złożone

idiosynkratyczne

zmienne i 

w ogromnym stopniu zależne od całej, w zasadzie nieobserwowalnej historii interakcji organizmu z
jego środowiskiem

to jest strukturę umysłu i przebieg procesów umysłowych, albo zamiast skupiać się na czysto
przyczynowych relacjach między fizycznie rozumianymi bodźcami i reakcjami, jak to mają w zwyczaju
behawioryści, nagle bardzo zainteresujemy się czymś jakby kompletnie "z drugiej strony" - *ś r o d o
w i s k i e m*.

Będzie to środowisko jako coś, czym zawsze było dla psychologa *jako psychologa* i czym zawsze
pozostanie - będzie to *układ powiązanych zadań*. Wielką zaletą tak rozumianego środowiska jako
przedmiotu badań będzie jego ... bezpośrednia obserwowalność i względnie łatwa modyfikowalność. A
także to, że wszystko, co na temat tak rozumianego środowiska ustalimy, będzie miało automatycznie
znaczenie jednocześnie teoretyczne i aplikacyjne. Nabierzemy wręcz ochoty, żeby zacząć powolutku
konstruować coś na kształt ogólnej teori środowiska rozumianego właśnie w taki sposób. *Funkcje
poznawcze*, takie jak percepcja, pamięć, czy uwaga, okażą się wtedy dosłownie *własnościami
zadań*. No będzie się działo, ale zdaje się, że zanadto już wybiegam w przyszłość.

Osiągniemy to wszystko, mam nadzieję, nie korzystając z żadnej niemal wiedzy psychologicznej, bo też
nie mam poczucia, żebym sporo takiej wiedzy zastał. Coś tam mniej więcej wiadomo i do niektórych
rzeczy bardzo się przydaje to, co wiemy, ale nie oszukujmy się, psychologia naukowa jest ciągle na
etapie powstawania.

Będziemy przy tym korzystać przede wszystkim z tej niezwykłej *meta-matematyki stosowanej*, której
próbuję tu używać jako *systematycznej metody badania meta-teoretycznego*, jaką jest teoria typów
zależnych, a której autorem jest wybitny szwedzki matematyk i filozof [Per
Martin-Löf](https://en.wikipedia.org/wiki/Per_Martin-L%C3%B6f). A może filozof i matematyk? Nie
wiem, co by wolał. Wciąż jest z nami, więc może jeszcze zdążę go o to zapytać. Kto wie, nawet na
pewnym etapie może się nawet pojawić teoria kategorii, bo ta nadaje się znakomicie do formalizacji,
czyli tego, co nazwałem już - dopiero co uzasadniając i ilustrując ten terminologiczny wybór -
"matematyczną konkretyzacją", relacji między różnymi punktami widzenia na to samo.

A gdyby udało nam się zrealizować niektóre z tych ambitnych celów, nawet tylko jeden, to
niewykluczone, że nadarzy się okazja, aby któreś z nas, przytaczając słowa innej wybitnej postaci,
matematyka i informatyka teoretycznego [Hala Abelsona](https://www.youtube.com/watch?v=2Op3QLzMgSY),
zażartowało, mówiąc: *If I have not seen as far as others, it is because giants were standing on my
shoulders*.

Wiem, że te cele są bardzo ambitne, mogą się nawet wydawać szalone i w jakimś sensie pewnie takie
są, więc na tym etapie mówię tylko - spróbuję. Potrzebuję do tego Twojej pomocy i właściwie już z
niej skorzystałem. To znaczy, skorzystałem już z samego faktu, że postrzegam Ciebie jako
czytelniczkę albo czytelnika.

Gdybym próbował napisać to, co staram się teraz napisać, jako artykuł naukowy, musiałbym się zgodzić
na granie według reguł gry, które obowiązują mnie, moich kolegów i moje koleżanki z pracy, kiedy
piszemy manuskrypty i wysyłamy je do redakcji czasopism wysokopunktowanych. Musiałbym na przykład
pisać w stylu, który obecnie obowiązuje w tego typu publikacjach. Brzydzę się tym stylem, zresztą
nie tylko ja, bo uważam, że nie służy wcale dobrze wyjaśnianiu zjawisk i rozwiązywaniu problemów, za
to nadaje się świetnie do stwarzania *pozorów*, że się coś takiego robi. Bardzo dobrze umiem
stwarzać tego rodzaju pozory, bo posługuję się swobodnie technicznym językiem stastycznym i
przyczynowym, ale nie chcę tego robić. Musiałbym też po raz kolejny znosić to, że redaktorzy i
recenzenci zwykle swoje wymagania wyrażają z pozycji autorytetu i realnej władzy, rzadko podając
powody, dla których oczekują takich a nie innych zmian. Jak wiesz, moim zdaniem taka postawa jest
wręcz *anty*naukowa.

W następnej części zapoznamy się z rachunkiem predykatów wyższego rzędu. Pokazałem Ci już, jak można
używać skromnego fragmentu tej teorii, żeby prześwietlać zawiłości dowodów na istnienie Boga. Gdy
poznamy większą część, to wtedy dokładnie to samo, tylko znacznie lepiej, będziemy mogli zrobić z
rozumowaniami formułowanymi przez autorów psychologicznych badań i teorii. Jeżeli moje wyznanie nie
zmotywowało Cię, żeby mi nadal towarzyszyć, to trudno, rozumiem, ale i tak będę sobie wyobrażał, że
piszę to wszystko dla Ciebie, bo tak jest mi po prostu łatwiej.
