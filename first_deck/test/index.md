---
title       : Test title
subtitle    : subtest title
author      : me
job         : curious
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Read-And-Delete

1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

--- .class #id 

## Slide 2

Test slide to ensure slide 2
and then does text get wrapped around or what ?
1. hello
2. bello
3. cello
 --- .class #id

## Slide 3

        ## Question1
        What is 1 + 1 ?
        
        1. 1
        2. _2_
        3. 3
        4. 4
        
        *** .hint This is ahint
        ***. explanation This is an explanation
--- .class #id

## Slide 4


```r
        sum(1:10)
```

```
## [1] 55
```

```r
        10*(11)/2
```

```
## [1] 55
```




