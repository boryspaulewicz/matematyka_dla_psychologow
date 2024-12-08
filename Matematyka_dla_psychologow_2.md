# Fałsz, negacja, sprzeczność i eksplozja

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

`Absurd` jest pewnym *zdaniem jako takim*, jak bowiem widać z definicji ma typ `Prop`. A więc
`Absurd` jest też pewnym *typem*, bo zdania są typami. To jest w dodatku *zdanie
parametryczne*. Oznacza *funkcję*, która *z dowolnego zdania jako takiego (*tutaj arbitralnie
nazwanego a*) tworzy term tego zdania*.

Jak każde zdanie, nie jest ono ani prawdziwe (udowodnione), ani fałszywe (nie jest udowodniona jego
negacja), ale *gdybyśmy znaleźli* (w jakimś kontekście) *dowód tego zdania*, to otrzymalibyśmy term
o typie: *funkcja, która z każdego zdania tworzy term tego zdania*, czyli *funkcja, która z każdego
zdania tworzy dowód tego zdania*. Można to zdanie nazwać również *Fałsz*.

*Ex falso quodlibet*

*Z Fałszu wynika wszystko*

