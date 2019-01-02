paper.pdf: references.bib paper.tex plots/myplot1.pdf plots/myplot2.pdf R_data_4_TeX/myvars.csv R_data_4_TeX/mytable.csv R_data_4_TeX/mystats1.csv R_data_4_TeX/mystats2.csv
	pdflatex paper
	biber paper
	pdflatex paper
	pdflatex paper

plots:
	mkdir -p plots

R_data_4_TeX:
	mkdir -p R_data_4_TeX

R_code.r: plots R_data_4_TeX

plots/myplot1.pdf: R_code.r
	R CMD BATCH --vanilla R_code.r

plots/myplot2.pdf: R_code.r
	R CMD BATCH --vanilla R_code.r

R_data_4_TeX/myvars.csv: R_code.r
	R CMD BATCH --vanilla R_code.r

R_data_4_TeX/mytable.csv: R_code.r
	R CMD BATCH --vanilla R_code.r

R_data_4_TeX/mystats1.csv: R_code.r
	R CMD BATCH --vanilla R_code.r

R_data_4_TeX/mystats2.csv: R_code.r
	R CMD BATCH --vanilla R_code.r

clean: 
	\rm -f *.aux *.bbl *.blg *.log *.bak *.out *.run.xml *-blx.bib *.Rout *.bcf Rplots.pdf

