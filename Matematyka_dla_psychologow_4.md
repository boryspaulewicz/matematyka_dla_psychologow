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

Następnie podejmiemy próbę sformalizowania rozumowań, które będą wymagały wprowadzenia dość
zaskakującej, ale bardzo prostej definicji - definicji pojęcia *zadania*. Dzięki temu będziemy mogli
całkowicie zakodować w języku teorii typów zależnych artykuł naukowy dotyczący zjawiska swoiście
*psychologicznego*. Zobaczymy również z nowej perspektywy *całą* psychologię.

Wprowadzenie formalnej wersji tej definicji będzie umotywowane następującym wglądem. Ten dziwny
wgląd przytrafił mi się w końcu po ponad dwudziestu latach uczenia się i myślenia wciąż o jednym
małym zbiorze kilku ściśle ze sobą powiązanych zagadek meta-teoretycznych dotyczących psychologii:

*Cel, zadanie, wartość, użyteczność i norma są jednym i tym samym - preferencją zewnętrznego
obserwatora*.

*Zachowanie, ten centralny przedmiot zainteresowania psychologii, to nic innego jak działanie
celowe*.

Stąd będzie wynikał między innymi taki oto dziwny wniosek:

*Bycie takim a nie innym zachowaniem jest stopniowalne i może być jedynie przybliżane przez
rzeczywiste procesy fizyczne*.

Nie tylko ten wniosek będzie zresztą dziwny. Ale wybiegam już za bardzo w przyszłość.

Osiągniemy to wszystko, mam nadzieję, nie korzystając niemal z żadnej wiedzy psychologicznej, bo ja
akurat nie mam poczucia, żebym sporo takiej wiedzy zastał. Coś tam wiadomo i do niektórych rzeczy
bardzo się przydaje to, co już wiadomo, ale nie oszukujmy się, psychologia naukowa jest wciąż na
etapie powstawania.

Będziemy korzystać przede wszystkim z tej niezwykłej *meta-matematyki stosowanej* jaką jest teoria
typów zależnych, a której autorem jest wybitny szwedzki matematyk i filozof [Per
Martin-Löf](https://en.wikipedia.org/wiki/Per_Martin-L%C3%B6f). A może filozof i matematyk? Nie
wiem, co by wolał. Wciąż jest z nami, więc może jeszcze zdążę go o to zapytać.

A gdyby udało nam się zrealizować tylko niektóre z tych ambitnych celów, nawet tylko jeden, to kto
wie, może kiedyś nadarzy się okazja, żeby przytaczając słowa innej wybitnej postaci, matematyka i
informatyka teoretycznego [Hala Abelsona](https://www.youtube.com/watch?v=2Op3QLzMgSY), zażartować:
*If I have not seen as far as others, it is because giants were standing on my shoulders*.

Wiem, że te cele są bardzo ambitne, mogą się nawet wydawać szalone i w jakimś sensie może takie są,
więc na tym etapie mówię tylko - spróbuję. Potrzebuję do tego Twojej pomocy i właściwie już z niej
skorzystałem, to znaczy, skorzystałem już z samego faktu, że postrzegam Ciebie jako czytelniczkę
albo czytelnika.

Gdybym próbował napisać to, co staram się teraz napisać, jako artykuł naukowy, musiałbym się zgodzić
na granie według reguł gry, które obowiązują mnie, moich kolegów i moje koleżanki z pracy kiedy
piszemy manuskrypty i wysyłamy je do redakcji czasopism wysokopunktowanych. Musiałbym na przykład
pisać w stylu, który obecnie obowiązuje w tego typu publikacjach, a brzydzę się tym stylem, bo
uważam, że nie służy wyjaśnianiu zjawisk i rozwiązywaniu problemów, tylko stwarzaniu *pozorów*, że
się coś takiego robi. Musiałbym też po raz kolejny znosić to, że redaktorzy i recenzenci zwykle
swoje wymagania wyrażają z pozycji autorytetu, rzadko podając powody, dla których oczekują takich a
nie innych zmian. Jak wiesz, moim zdaniem taka postawa jest wręcz *anty*-naukowa.

W następnej części zapoznamy się z rachunkiem predykatów wyższego rzędu. Pokazałem Ci już, jak można
używać skromnego fragmentu tej teorii, żeby prześwietlać zawiłości dowodów na istnienie Boga. Gdy
poznamy większą część, to wtedy to samo, tylko znacznie lepiej, będziemy mogli zrobić z
rozumowaniami formułowanymi przez psychologów. Jeżeli moje szczere wyznanie nie zmotywowało Cię,
żeby mi nadal towarzyszyć, to trudno, rozumiem, ale i tak będę sobie wyobrażał, że piszę to wszystko
dla Ciebie, bo tak jest mi po prostu łatwiej.
