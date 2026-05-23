<div id="main" class="col-md-9" role="main">

# E2: Language analysis and production with R and some LLMs

<div class="section level2">

## Elegant nonsense

With a very simple model of English grammar and a little vocabulary, we
can randomly generate ‘normal-sounding’ sentences.

Here is a vector of elegant nouns.

<div id="cb1" class="sourceCode">

``` r
nouns = c("Mercedes", "Tiffany", "Lamborghini", "Maserati", "Tosca", "La Traviata",
   "Diamonds", "Crystal", "Lenox")
```

</div>

We’ll continue to set up some vectors of verbs (past tense),
prepositions, adjectives, prepositions, and indicatives.

<div id="cb2" class="sourceCode">

``` r
pastverbs = c("radiated", "glowed", "luxuriated", "ecstatized", "overwhelmed",
  "hyperventilated", "raptured", "raved", "stupendousized")
preps = c("on", "over", "beyond", "above", "beneath", "within", "across")
adjectives = c("magnificent", "majestic", "sophisticated", "exquisite",
  "glorious", "regal")
preps = c("on", "over", "beyond", "above", "beneath", "within", "across")
indic = c("the", "a", "any", "some")
```

</div>

Our model for a sentence is

    (*) indicative + noun + verb(tensed) + preposition + indicative + adjective + noun

We produce a sentence by sampling purely randomly from the relevant
vocabulary vectors. We use `sprintf` to substitute our choices into a
template of seven strings.

<div id="cb4" class="sourceCode">

``` r
get1 = function (x) sample(x, size=1)
up1 = function(x) paste0(toupper(substring(x,1,1)), substring(x,2))
sentence = function() {
  cat(sprintf("%s %s %s %s %s %s %s.", up1(get1(indic)), get1(nouns), get1(pastverbs),
     get1(preps), get1(indic), get1(adjectives), get1(nouns)))
}
set.seed(12345) # reproducible
sentence()
```

</div>

    ## A Lamborghini raved over the sophisticated Crystal.

<div id="cb6" class="sourceCode">

``` r
sentence()
```

</div>

    ## A La Traviata hyperventilated across a majestic Mercedes.

<div id="cb8" class="sourceCode">

``` r
sentence()
```

</div>

    ## Some Crystal raptured within a magnificent Maserati.

<div id="cb10" class="sourceCode">

``` r
sentence()
```

</div>

    ## Some Lamborghini stupendousized within the exquisite Diamonds.

The potential repetitiousness of purely random sampling can be avoided.
In the following sentence generator, we prevent reuse of the initial
noun or indicative.

<div id="cb12" class="sourceCode">

``` r
sentence_nr = function() {
  i1 = get1(indic)
  n1 = get1(nouns) 
  pv1 = get1(pastverbs)
  p1 = get1(preps)
  i2 = get1(setdiff(indic,i1))   # don't repeat indicative
  ad = get1(adjectives) 
  n2 = get1(setdiff(nouns,n1)) # don't repeat noun
  sprintf("%s %s %s %s %s %s %s.", up1(i1), n1, pv1, p1, i2, ad, n2)
}
sentence_nr()
```

</div>

    ## [1] "Some Tiffany ecstatized beyond the magnificent Tosca."

<div id="cb14" class="sourceCode">

``` r
sentence_nr()
```

</div>

    ## [1] "Some La Traviata stupendousized beneath any sophisticated Mercedes."

We can also compose longer sentences, using the conjunction “because”:

<div id="cb16" class="sourceCode">

``` r
linked = function() cat(sprintf("%s,\n because %s", sub(".$", "", sentence_nr()), sentence_nr()))
linked()
```

</div>

    ## Any Mercedes overwhelmed over a sophisticated Maserati,
    ##  because The Lamborghini radiated over some magnificent Lenox.

<div id="cb18" class="sourceCode">

``` r
linked()
```

</div>

    ## Any Maserati glowed above some glorious Diamonds,
    ##  because Any Diamonds raptured across a glorious La Traviata.

Exercise 1. What does the `up1` function do? Apply it to the string
“foo”. What is the result?

Exercise 2. There is something wrong with the last two productions. What
is it and how would you go about correcting it?

Exercise 3. Propose an alternate schematic to the one noted above as
`(*)`. Implement it in a function `altsentence` and illustrate its use
with our vocaularies. For example

    noun + "is not" + noun

could be implemented as

<div id="cb21" class="sourceCode">

``` r
altsentence = function() {
   sprintf("%s is not %s", get1(nouns), get1(nouns))
}
altsentence()
```

</div>

    ## [1] "Diamonds is not Crystal"

<div id="cb23" class="sourceCode">

``` r
altsentence()
```

</div>

    ## [1] "Lamborghini is not Tosca"

Come up with something more interesting than this!

</div>

<div class="section level2">

## Lexical tagging of English sentences

I asked perplexity.ai ($20/mo) to produce 10 lexically tagged sentences.
By “lexical tagging” we refer to a process of associating with each word
or phrase a category defining the word’s role in sentence meaning.
Examples of tags include

    - DT: Determiner
    - NN: Noun, singular or mass
    - NNP: Proper noun, singular
    - VB: Verb, base form
    - VBZ: Verb, 3rd person singular present
    - JJ: Adjective
    - IN: Preposition or subordinating conjunction
    - CD: Cardinal number

The full set of “part of speech” tags can be found at the [U Penn
linguistics
site](https://www.ling.upenn.edu/courses/Fall_2003/ling001/penn_treebank_pos.html).

Here’s what came back from perplexity.ai:

-   \[The/DT\] \[Eiffel/NNP\] \[Tower/NNP\] \[is/VBZ\] \[a/DT\]
    \[wrought-iron/JJ\] \[lattice/NN\] \[tower/NN\] \[on/IN\] \[the/DT\]
    \[Champ/NNP\] \[de/NNP\] \[Mars/NNP\] \[in/IN\] \[Paris/NNP\]
    \[,/,\] \[France/NNP\] \[./.\]

-   \[Photosynthesis/NN\] \[is/VBZ\] \[the/DT\] \[process/NN\] \[by/IN\]
    \[which/WDT\] \[plants/NNS\] \[use/VBP\] \[sunlight/NN\] \[,/,\]
    \[water/NN\] \[and/CC\] \[carbon/NN\] \[dioxide/NN\] \[to/TO\]
    \[produce/VB\] \[oxygen/NN\] \[and/CC\] \[energy/NN\] \[in/IN\]
    \[the/DT\] \[form/NN\] \[of/IN\] \[sugar/NN\] \[./.\]

-   \[The/DT\] \[Great/NNP\] \[Wall/NNP\] \[of/IN\] \[China/NNP\]
    \[is/VBZ\] \[a/DT\] \[series/NN\] \[of/IN\] \[fortifications/NNS\]
    \[and/CC\] \[walls/NNS\] \[built/VBN\] \[across/IN\] \[the/DT\]
    \[historical/JJ\] \[northern/JJ\] \[borders/NNS\] \[of/IN\]
    \[ancient/JJ\] \[Chinese/JJ\] \[states/NNS\] \[./.\]

-   \[William/NNP\] \[Shakespeare/NNP\] \[was/VBD\] \[an/DT\]
    \[English/JJ\] \[playwright/NN\] \[,/,\] \[poet/NN\] \[,/,\]
    \[and/CC\] \[actor/NN\] \[widely/RB\] \[regarded/VBN\] \[as/IN\]
    \[the/DT\] \[greatest/JJS\] \[writer/NN\] \[in/IN\] \[the/DT\]
    \[English/JJ\] \[language/NN\] \[./.\]

-   \[The/DT\] \[human/JJ\] \[genome/NN\] \[contains/VBZ\]
    \[approximately/RB\] \[3/CD\] \[billion/CD\] \[base/NN\]
    \[pairs/NNS\] \[of/IN\] \[DNA/NN\] \[./.\]

-   \[Albert/NNP\] \[Einstein/NNP\] \[developed/VBD\] \[the/DT\]
    \[theory/NN\] \[of/IN\] \[relativity/NN\] \[,/,\] \[one/CD\]
    \[of/IN\] \[the/DT\] \[two/CD\] \[pillars/NNS\] \[of/IN\]
    \[modern/JJ\] \[physics/NN\] \[./.\]

-   \[The/DT\] \[Amazon/NNP\] \[rainforest/NN\] \[,/,\] \[covering/VBG\]
    \[much/JJ\] \[of/IN\] \[northwestern/JJ\] \[Brazil/NNP\] \[and/CC\]
    \[extending/VBG\] \[into/IN\] \[Colombia/NNP\] \[,/,\] \[Peru/NNP\]
    \[and/CC\] \[other/JJ\] \[South/NNP\] \[American/NNP\]
    \[countries/NNS\] \[,/,\] \[is/VBZ\] \[the/DT\] \[world’s/NN$\]
    \[largest/JJS\] \[tropical/JJ\] \[rainforest/NN\] \[./.\]

-   \[The/DT\] \[periodic/JJ\] \[table/NN\] \[is/VBZ\] \[a/DT\]
    \[tabular/JJ\] \[arrangement/NN\] \[of/IN\] \[the/DT\]
    \[chemical/JJ\] \[elements/NNS\] \[,/,\] \[organized/VBN\] \[on/IN\]
    \[the/DT\] \[basis/NN\] \[of/IN\] \[their/PRP$\] \[atomic/JJ\]
    \[numbers/NNS\] \[,/,\] \[electron/NN\] \[configurations/NNS\]
    \[,/,\] \[and/CC\] \[recurring/VBG\] \[chemical/JJ\]
    \[properties/NNS\] \[./.\]

-   \[The/DT\] \[United/NNP\] \[Nations/NNPS\] \[(/\] \[UN/NNP\] \[)/\]
    \[is/VBZ\] \[an/DT\] \[intergovernmental/JJ\] \[organization/NN\]
    \[that/WDT\] \[aims/VBZ\] \[to/TO\] \[maintain/VB\]
    \[international/JJ\] \[peace/NN\] \[and/CC\] \[security/NN\] \[,/,\]
    \[develop/VB\] \[friendly/JJ\] \[relations/NNS\] \[among/IN\]
    \[nations/NNS\] \[,/,\] \[achieve/VB\] \[international/JJ\]
    \[cooperation/NN\] \[,/,\] \[and/CC\] \[be/VB\] \[a/DT\]
    \[center/NN\] \[for/IN\] \[harmonizing/VBG\] \[the/DT\]
    \[actions/NNS\] \[of/IN\] \[nations/NNS\] \[./.\]

-   \[The/DT\] \[Mona/NNP\] \[Lisa/NNP\] \[is/VBZ\] \[a/DT\]
    \[half-length/JJ\] \[portrait/NN\] \[painting/NN\] \[by/IN\]
    \[Italian/JJ\] \[artist/NN\] \[Leonardo/NNP\] \[da/NNP\]
    \[Vinci/NNP\] \[,/,\] \[considered/VBN\] \[an/DT\] \[archetypal/JJ\]
    \[masterpiece/NN\] \[of/IN\] \[the/DT\] \[Italian/NNP\]
    \[Renaissance/NNP\] \[./.\]

</div>

<div class="section level2">

## Statistics of parts of speech

The sentnce data do not possess a regular structure amenable to
tabulation. There is a hierarchical format: arbitrary numbers of
language particles and annotations are ordered within each sentence, and
the sentences form a group of ten.

A popular format for irregularly structured data is “JSON”. We asked
perplexity.ai to produce the tagged sentences in JSON format. R can
ingest JSON for programmatic analysis using the jsonlite package.

<div id="cb26" class="sourceCode">

``` r
library(jsonlite)
myj = system.file("json/tensent.json", package="YESCDS")
sdat = fromJSON(myj, flatten=FALSE)
frames = sdat[[2]]
frames[[1]]
```

</div>

    ##            word tag
    ## 1           The  DT
    ## 2        Eiffel NNP
    ## 3         Tower NNP
    ## 4            is VBZ
    ## 5             a  DT
    ## 6  wrought-iron  JJ
    ## 7       lattice  NN
    ## 8         tower  NN
    ## 9            on  IN
    ## 10          the  DT
    ## 11        Champ NNP
    ## 12           de NNP
    ## 13         Mars NNP
    ## 14           in  IN
    ## 15        Paris NNP
    ## 16            ,   ,
    ## 17       France NNP
    ## 18            .   .

We see that for each sentence we have a data.frame with one row for each
English word and associated part of speech.

The overall frequency distribution of parts of speech in this little
collection is:

<div id="cb28" class="sourceCode">

``` r
alltags = lapply(seq_len(length(frames)), function(x) frames[[x]][,2])
sort(table(unlist(alltags)))
```

</div>

    ## 
    ##    (    )  NN$ NNPS PRP$  VBP  JJS   RB   TO  VBD  WDT   CD  VBG  VBN   VB   CC 
    ##    1    1    1    1    1    1    2    2    2    2    2    4    4    4    5    9 
    ##  VBZ    .    ,  NNS   IN   JJ   DT  NNP   NN 
    ##    9   10   15   16   25   25   28   29   39

Here’s how we might use R to determine how many words into a sentence we
need to go to find a verb:

<div id="cb30" class="sourceCode">

``` r
sapply(frames, function(z) min(grep("VB", z[,2])))
```

</div>

    ##  [1] 4 2 6 3 4 3 5 4 7 4

Exercise 1. What is the position of the verb in the fourth sentence?
What is the verb, and what type is it? Consult the link to U Penn
linguistics given above.

Exercise 2. Which sentence has the verb in the “latest” position, and
why is the position number so high? Should the counting procedure be
adjusted?

</div>

<div class="section level2">

## Using an LLM

In this section we will assume that you are working on a machine that is
able to use software and data organized at huggingface.co, specifically
a version of
[BERT](https://huggingface.co/google-bert/bert-base-uncased).

We will ‘source’ a github gist that will work if python is present, and
if it and the reticulate package have been configured to be able to find
python packages torch and transformers.

This code chunk will produce a table of scores and completions for the
prompt `The capital of Spain is [MASK].`.

<div id="cb32" class="sourceCode">

``` r
devtools::source_gist("https://gist.github.com/vjcitn/0e1b0289eb1a219b98d60b5b863f8d62")
```

</div>

This turns out to be difficult to use on the ‘free’ galaxy instance. The
software can be demonstrated at `https://vjcitn.shinyapps.io/AIapp`. Of
interest:

-   positive scores for factually false completions
-   better score distributions when the prompt is ‘warmed up’ – for
    example, beginning the prompt with “You are a scholar of …” to build
    context.

The code in the gist can be modified to change the model, and the prompt
can be changed to seek scored responses to different prompts.

</div>

</div>
