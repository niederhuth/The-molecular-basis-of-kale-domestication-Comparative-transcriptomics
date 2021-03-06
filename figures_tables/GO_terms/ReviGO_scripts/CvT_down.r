

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0017038","protein import",0.257,1.5752,0.766,0.000,"protein import"),
c("GO:0051276","chromosome organization",1.477,3.1462,0.593,0.000,"chromosome organization"),
c("GO:0032543","mitochondrial translation",0.068,1.5100,0.523,0.557,"chromosome organization"),
c("GO:0006139","nucleobase-containing compound metabolic process",26.547,3.1462,0.441,0.059,"nucleobase-containing compound metabolism"),
c("GO:0034641","cellular nitrogen compound metabolic process",34.137,2.5216,0.496,0.484,"nucleobase-containing compound metabolism"),
c("GO:0046483","heterocycle metabolic process",29.664,3.1462,0.592,0.234,"nucleobase-containing compound metabolism"),
c("GO:0006725","cellular aromatic compound metabolic process",29.628,2.9432,0.592,0.245,"nucleobase-containing compound metabolism"),
c("GO:0090304","nucleic acid metabolic process",21.449,1.5100,0.449,0.597,"nucleobase-containing compound metabolism"),
c("GO:1901360","organic cyclic compound metabolic process",30.324,1.5100,0.708,0.178,"nucleobase-containing compound metabolism"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="GO_terms/ReviGO_plots/CvT_down_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the treemap command documentation for all possible parameters - there are a lot more
treemap(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "Cabbage vs TO1000 Lower Expressed Genes",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
