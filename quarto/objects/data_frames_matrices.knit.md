# Data frames & Matrices
![](/images/Rmatrix.png){style="width:200px; background:white; border-radius:5px; border: 5px white solid" fig-align="center"}

<u id='data_frame_tooltip'>__Data frames__</u> & <u id='matrix_tooltip'>__matrices__</u> are 2-dimensional data structures as they have rows and columns.

A <u id='matrix_tooltip'>__matrix__</u> only contains 1 <u id='class_tooltip'>__class__</u> (homogeneous). A <u id='data_frame_tooltip'>__data frame__</u> can contain multiple <u id='class_tooltip'>__classes__</u> (heterogeneous), but each column can only contain one <u id='class_tooltip'>__class__</u>. 

Most of the time <u id='data_frame_tooltip'>__data frames__</u> and <u id='matrix_tooltip'>__matrices__</u> can be treated the same. Because of this I generally use <u id='data_frame_tooltip'>__data frames__</u> and so we will focus on them.

## mtcars dataset
![](/images/car.png){style="width:200px; background: white; border-radius:5px" fig-align="center"}

R comes with a set of pre-loaded data. If you are interested you can use the <u id='function_tooltip'>__function__</u> `data()` to see the full list.

We will have a quick look at the dataset "mtcars". This is a <u id='data_frame_tooltip'>__data frame__</u> containing information on various cars. To look at the <u id='data_frame_tooltip'>__data frame__</u> in the __console window__ run the below.


::: {.cell}

```{.r .cell-code}
mtcars
```
:::


The above shows the info in the __console window__. 
However we can have a better look at it in RStudio if we save it as a <u id='variable_tooltip'>__variable__</u> in our __environment__ and then click the <u id='variable_tooltip'>__variable__</u> name on the __Environment pane__ of the __"environment and history"__ __window__.


::: {.cell}

```{.r .cell-code}
cars_info <- mtcars
```
:::


Now the <u id='variable_tooltip'>__variable__</u> will be listed in your __Environment pane__ in the __"environment and history" window__ . 
Click on the name "cars_info" in the __Environment pane__. 
A tab in your __script editor__ will open so you can have a good look at the contents of the <u id='data_frame_tooltip'>__data frame__</u>.

When you are ready, close the "cars_info" tab and remove the <u id='variable_tooltip'>__variable__</u> with the below command.


::: {.cell}

```{.r .cell-code}
rm(cars_info)
```
:::


## Creating a data frame
![](/images/oystercatcher.png){style="width:200px; background: white; border-radius:5px" fig-align="center"}

Now it is time to create our own <u id='data_frame_tooltip'>__data frame__</u>.

First we will create three <u id='variable_tooltip'>__variables__</u> containing <u id='vector_tooltip'>__vectors__</u>. 
These will be our three columns.


::: {.cell}

```{.r .cell-code}
Crab <- c(10,1,1)
Oystercatcher <- c(5,6,4)
Starfish <- c(3,3,7)
```
:::


Now let us create the <u id='data_frame_tooltip'>__data frame__</u>.


::: {.cell}

```{.r .cell-code}
#Using the function data.frame to create a data frame
beach_df <- data.frame(Crab,Oystercatcher,Starfish)
```
:::



## Viewing the data frame
![](/images/view_pc.png){style="width:200px; background: white; border-radius:5px" fig-align="center"}

Look at the <u id='variable_tooltip'>__variable__</u> "beach_df" (it is useful to use "df" in __<u id='variable_tooltip'>variable</u> names__ to signify it is a <u id='data_frame_tooltip'>__data frame__</u>) and you will see that each <u id='vector_tooltip'>__vector__</u> has become a column. 
The __<u id='variable_tooltip'>variable</u> names__ have become the column names (this is why we used capital letters in the __<u id='variable_tooltip'>variable</u> names__).

You can think of <u id='data_frame_tooltip'>__data frames__</u> in three different ways:

- A list of columns
- A list of rows
- A table

Look at the column and row names with two new <u id='function_tooltip'>__functions__</u>.

::: {.cell}

```{.r .cell-code}
colnames(beach_df)
row.names(beach_df)
```
:::


We can use the <u id='function_tooltip'>__function__</u> `row.names()` and the __assignment operator__ to change the row names to something more useful.

::: {.cell}

```{.r .cell-code}
row.names(beach_df) <- c("Formby","West Kirby","Crosby")
```
:::


Now look at your "beach_df" <u id='data_frame_tooltip'>__data frame__</u> to see the difference.


::: {.cell}
::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-a1edaa571b77cf7981e7" width="100%"></span>
<script type="application/json" data-for="htmlwidget-a1edaa571b77cf7981e7">{"x":{"element":"operator_tooltip","opts":{"content":"+, -, /, *, etc.","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-6c1e9fa95bcab130a0a1" width="100%"></span>
<script type="application/json" data-for="htmlwidget-6c1e9fa95bcab130a0a1">{"x":{"element":"variable_tooltip","opts":{"content":"Container of an R object with a name","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-3fc928fa57ca756c248f" width="100%"></span>
<script type="application/json" data-for="htmlwidget-3fc928fa57ca756c248f">{"x":{"element":"function_tooltip","opts":{"content":"Named block of code that performs a specific task","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-eacc3d7239f7db24407c" width="100%"></span>
<script type="application/json" data-for="htmlwidget-eacc3d7239f7db24407c">{"x":{"element":"class_tooltip","opts":{"content":"Object data type, e.g. integer, double, string, and logical","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-08d0bcbc774fd11abdca" width="100%"></span>
<script type="application/json" data-for="htmlwidget-08d0bcbc774fd11abdca">{"x":{"element":"data_structure_tooltip","opts":{"content":"Object structure type, e.g. scalar, vector, and data frame","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-967591110374d2b59aa7" width="100%"></span>
<script type="application/json" data-for="htmlwidget-967591110374d2b59aa7">{"x":{"element":"integer_tooltip","opts":{"content":"Number without decimal points","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-aadab1a5e6d58ebb6aeb" width="100%"></span>
<script type="application/json" data-for="htmlwidget-aadab1a5e6d58ebb6aeb">{"x":{"element":"double_tooltip","opts":{"content":"Number with decimal points","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-4611386d30bf62b4cf7f" width="100%"></span>
<script type="application/json" data-for="htmlwidget-4611386d30bf62b4cf7f">{"x":{"element":"string_tooltip","opts":{"content":"Text","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-354f20bb8656d3d5c65b" width="100%"></span>
<script type="application/json" data-for="htmlwidget-354f20bb8656d3d5c65b">{"x":{"element":"logical_tooltip","opts":{"content":"TRUE or FALSE","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-6959c8e94606e0ed8ca5" width="100%"></span>
<script type="application/json" data-for="htmlwidget-6959c8e94606e0ed8ca5">{"x":{"element":"scalar_tooltip","opts":{"content":"A single value in a object","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-3d3a4ad77d7160b73930" width="100%"></span>
<script type="application/json" data-for="htmlwidget-3d3a4ad77d7160b73930">{"x":{"element":"vector_tooltip","opts":{"content":"Homogenous 1-dimensional data structure","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-0885e4198130474c1399" width="100%"></span>
<script type="application/json" data-for="htmlwidget-0885e4198130474c1399">{"x":{"element":"matrix_tooltip","opts":{"content":"Homogeneous 2-dimensional data structure","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::

::: {.cell-output-display}

```{=html}
<span class="tippy html-widget html-fill-item" height="464px" id="htmlwidget-05db1fdfd25e0b257e29" width="100%"></span>
<script type="application/json" data-for="htmlwidget-05db1fdfd25e0b257e29">{"x":{"element":"data_frame_tooltip","opts":{"content":"Heterogeneous 2-dimensional data structure. Each column is homogeneous","arrow":true,"placement":"bottom"}},"evals":[],"jsHooks":[]}</script>
```

:::
:::

