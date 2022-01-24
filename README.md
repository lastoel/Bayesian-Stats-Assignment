# Bayesian-Stats-Assignment
## Final Assignment for the Bayesian Statistics Course

This folder contains scripts used to extract the results from the raw output. Below you can find a description of the files.

| File name                         | Description of file  |
|-----------------------------------|----------------------|
| `Data pre/Data Preprocessing.R`   | R file reading in and tidying up the data in `DryEyesData.csv`. |
| `Functions/THUGS.R`               | R file containing The Hecking Ultimate Gibbs Sampler (with an M-H step) function. |
| `Functions/Autocorrcalc.R`        | R file containing a function for calculating the autocorrelation of a parameter's chain. |
| `Functions/DIC.R`                 | R file containing a function for calculating the DIC of a model. |
| `Functions/Pvalcalc.R`            | R file containing a function for calculating a Bayesian p-value for a test statistic. |
| `Functions/Skewcalc.R`            | R file containg a function for calculating the skewness of a distribution, for my particular test statistic. |
| `1. Analyses.Rmd`                 | MAIN FILE - RUN ME! R Markdown file that can be used to generate the models presented in the manuscript. Output to `Model*.Rdata`. | 
| `2. Figures.R`                    | R file to generate the figures in the manuscript with. Figures in the manuscript take `Model1.Rdata` as read in object. Note that if you load the alternative model, the names in the figures won't match the name of the variable anymore (but those figures were also not provided in the manuscript). |
| `3. Tables.R`                     | R file to generate the tables in the manuscript with. Tables in the manuscript take `Model1.Rdata` as read in object. Note that if you load the alternative model, the names in the figures won't match the name of the variable anymore (but those figures were also not provided in the manuscript). |
| `Workspaces`                      | Folder where all the different models resulting from `1. Analysis.Rmd` are stored. |
| `Stoel_Final_Assignment`          | Manuscript that was handed in for partial completion of the course Bayesian Statistics. |


