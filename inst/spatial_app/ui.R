
library(shiny)
library(png)
library(SingleCellExperiment)
library(ggplot2)
library(plotly)

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("select"), 
   radioButtons("pick", "sample", choices=c("1R", "6NR")),
   width=2
   ),
  mainPanel(
   tabsetPanel(
    tabPanel("H+E", 
      helpText("H&E stained image, transformed high-resolution"),
      plotOutput("hne", height="600px", width="600px")),
    tabPanel("Journal", 
      helpText("Image from journal"),
      fluidRow(
            column(width=7,plotOutput("jour",
                height="400px", width="400px")),
            column(width=5,plotOutput("key")))),
    tabPanel("ST", 
      helpText("Spot assignments guessed from cluster labels"), plotlyOutput("visium"),
      helpText("CAF = cancer-associated fibroblast, M0* = macrophage, U* = not assigned here")
     ),
     

tabPanel("about",
helpText("
on 7/30/2024 the content in the 'Supplementary file' table at ", a("this GEO URL for GSM7661255", href="https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSM7661255")," was retrieved"),
helpText("Upon using 'tar zxf' on the payload, a folder was produced with contents"),
pre("
HCC1R
├── data_SME_1541_identity.csv
├── filtered_feature_bc_matrix
│   ├── barcodes.tsv.gz
│   ├── features.tsv.gz
│   └── matrix.mtx.gz
├── filtered_feature_bc_matrix.h5
└── spatial
    ├── aligned_fiducials.jpg
    ├── detected_tissue_image.jpg
    ├── scalefactors_json.json
    ├── tissue_hires_image.png
    ├── tissue_lowres_image.png
    └── tissue_positions_list.csv
"),
helpText("This python program was used to import the spatial transcriptomics data and format as
scanpy AnnData:"),
pre('
import stlearn as st

data_hcc1R=st.Read10X("HCC1R/")
data_hcc1R.var_names_make_unique()
data_hcc1R.write_h5ad("hcc1r.h5ad")
'),
helpText("The Bioconductor zellkonverter package was used to import the h5ad to SingleCellExperiment format
as 'hcc1rYES'."),
helpText("The interactive visualization was produced using"),
pre('
  assn = hcc1rYES$clustid+1
  classes = c("Tum/SAA1", "M0a", "Tum/HP", "M0b", "CAF", "Tum/CYP2E1",
       "U1", "U2", "U3")
  clvec = classes[assn]
  dat = data.frame(x=hcc1rYES$array_col, y=hcc1rYES$array_row, clust=factor(clvec))
  colarr = c("1"="darkblue", "2"="orange", "3"="purple", "4"="red", "5"="lightgreen", "6"="steelblue3",
   "7"="black", "8"="yellow", "9"="gold")
  names(colarr) = classes
  pl = ggplot2::ggplot(dat, aes(y=x,x=y,colour=clust,text=clust)) + ggplot2::geom_point() +
   scale_colour_manual(values=colarr)
  plotly::ggplotly(pl)
')
)

)
)
)
    )
