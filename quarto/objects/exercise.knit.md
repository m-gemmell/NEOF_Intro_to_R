# Exercise
![](/images/beach.png){style="width:200px; background:white; border-radius:5px" fig-align="center"}

For this exercise produce the following tables as <u id='data_frame_tooltip'>__data frames__</u> in R. Please carry this out in your __"Exercises.R"__ script and remember about code sections and annotations.

Solutions are in the expandable boxes. 
Try your best to solve each challenge but use the solutions for help if you would like. 
Even if your method works it can be good to check the solution as there are many ways to do the same thing in python.

::: {.callout-tip}
You can either write completely new code or reuse and alter previous code.
:::

## df

::: {.callout-note}
The top row is the column names and the left-most column is the row names.
:::


::: {.cell}
::: {.cell-output-display}


|     | One| Three| Five|
|:----|---:|-----:|----:|
|Two  |   2|     6|   10|
|Four |   4|    12|   20|
|Six  |   6|    18|   30|


:::
:::


::: {.callout-note collapse="true" title="df solution"}
#### Step 1 {-}
Create __vectors__ for columns and row names:

::: {.cell}

```{.r .cell-code}
One <- c(2,4,6)
Three <- c(6,12,18)
Five <- c(10,20,30)
row_names <- c("Two", "Four", "Six")
```
:::

#### Step 2a {-}
Create the __data frame__ from vectors:

::: {.cell}

```{.r .cell-code}
df <- data.frame(One,Three,Five)
```
:::

Add row names:

::: {.cell}

```{.r .cell-code}
row.names(df) <- row_names
```
:::

#### Step 2b{-}
Alternatively you can define the row names in the `data.frame()` `function` as an option:

::: {.cell}

```{.r .cell-code}
df <- data.frame(One,Three,Five, row.names = row_names)
```
:::

:::

## beach_df_2

::: {.callout-note}
The top row is the column names and the left-most column is the row names.
:::


::: {.cell}
::: {.cell-output-display}


|             | Crab| Oystercatcher| Sandpiper| Starfish|
|:------------|----:|-------------:|---------:|--------:|
|Formby       |   10|             5|         1|        3|
|West Kirby   |    1|             6|         1|        3|
|Crosby       |    1|             4|         2|        7|
|New Brighton |    4|             4|         3|        4|


:::
:::


::: {.callout-note collapse="true" title="beach_df_2 solution"}
#### Step 1 {-}
Create __vectors__ for columns and row names:

::: {.cell}

```{.r .cell-code}
Crab <- c(10,1,1,4)
Oystercatcher <- c(5,6,4,4)
Sandpiper <- c(1,1,2,3)
Starfish <- c(3,3,7,4)
row_names_2 <- c("Formby","West Kirby","Crosby","New Brighton")
```
:::

#### Step 2a {-}
Create the __data frame__ from __vectors__:

::: {.cell}

```{.r .cell-code}
beach_df_2 <- data.frame(Crab,Oystercatcher,Sandpiper,Starfish)
```
:::

Add row names:

::: {.cell}

```{.r .cell-code}
row.names(beach_df_2) <- row_names_2
```
:::

#### Step 2b {-}
Alternatively you can define the row names in the `data.frame()` __function__ as an option:

::: {.cell}

```{.r .cell-code}
beach_df_2 <- data.frame(Crab,Oystercatcher,Sandpiper,Starfish, row.names = row_names_2)
```
:::

:::

## Next step

Fabulous!
You've completed the R objects part and can continue to the [Files & subsetting part](/files_subsetting/intro.qmd).


::: {.cell}
::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-3940e98f2f099ae541b0" width="100%"></span>
<script type="application/json" data-for="htmlwidget-3940e98f2f099ae541b0">{"x":{"element":"data_frame_tooltip","opts":{"content":"Heterogeneous 2-dimensional data structure. Each column is homogeneous","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::
:::

