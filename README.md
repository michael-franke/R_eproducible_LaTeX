# R_eproducible_LaTeX: reproducible research papers with R and LaTeX

Aiming for reproducibility of research results helps the community digest and check previous
research. It also helps individual researchers achieve a cleaner workflow. Tools like
Rmarkdown, knitr and Sweave are excellent, but partly obscure the full power of LaTeX
and a clean separation between analysis/coding and paper/presentation writing. 

The working example presented here provides an alternative. The main idea is that computational
results are stored (using R or any other programming language) in CSV files and read into
LaTeX. We provide an example of storing data in CSV files and convenience functions to read
data from these CSV files into LaTeX in order to produce single-valued results as well as large
tables of results.

More information is provided in the PDF file `paper.pdf` and its LaTeX-source `paper.tex`.  The
R code that does the (dummy) data analysis is in `R_code.r`. If you change anything relevant
for the final `paper.pdf`, e.g., in `paper.tex` or `R_code.r`, you can use `make` followed by
`make clean` to rebuilt the whole paper.
