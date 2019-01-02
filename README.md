# R_eproducible_LaTeX: reproducible research papers with R and LaTeX

Aiming for reproducibility of research results helps the community digest and check previous
research. It also helps individual researchers achieve a cleaner workflow. Rmarkdown, Sweave
and knitr are excellent tools, but in order to regain the full power of LaTeX and a clean
separation between analysis/coding and paper/presentation writing, this little working example
provides an alternative. The main idea is that numerical and string results (including tables)
are stored (using R or any other programming language) and picked up by LaTeX. We provide
convenience functions in LaTeX to read data from CSV files and produce single-valued results as
well as tables. 

More information is provided in the PDF file `paper.pdf` and its LaTeX-source `paper.tex`,
which give a minimal example of this approach.

The R code that does the (dummy) data analysis is in `R_code.r`. If you change anything
`paper.tex` or `R_code.r` you can use `make` followed by `make clean` to rebuilt the whole
paper.
