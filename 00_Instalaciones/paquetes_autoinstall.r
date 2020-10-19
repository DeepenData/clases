# SCRIPT AUTOMATICO DE INSTALACIÓN DE PAQUETES R PARA CURSO DE DATASCIENCE
#
# Curso dictado por Dr. A.Acevedo <DeepenData>. M.Muñoz <manu-mg> es el ayudante.
# Esta lista incluye los paquetes más comunes que usaremos, algunos más complegos
# como los de Espectrometria de Masas no estan incluidos, más que nada porque
# no odio sus computadores ni quiero hacerlos sufrir intentando instalarlos.
# Guia más comleteta esta disponible en  https://rpubs.com/DeepenData/r00-instalacion-paquetes
# Un repositorio con todas las clases en https://github.com/DeepenData/clases
#
# -- Script hecho y mantenido por Manu

version <- "2.0.0"
fecha   <- "2020-10-19"

# LISTADOS DE PAQUETES -- Solo son vectores de nombres

packages <- c(# PAQUETES INSTALADOS DESDE CRAN
"devtools",   # Utilidades de manejo de archivos, descargas, etc.
"broom",      # Convierte objetos de R a Tibbles, como "readr"
"dbplyr",     # Manipulación de bases de datps (eg. SQL)
"dplyr",      # Manipulación de datos mediante gramatica propia
"fs",         # Operaciones agnosticas de sistemas de archivos
"haven",      # Trabaja con archivos SPSS, Stata y SAS
"httr",       # Herramientas del protocolo HTTP, como GET, etc...
"magrittr",   # Operadores cañeria (pipes, %>%)
"modelr",     # Funciones de modelado compatibles con pipes
"openssl",    # Trabaja con certificados y encriptación SSL
"readr",      # Traducción (pharsing, de archivos a una tibble)
"readxl",     # Permite leer archivos de Excel
"stringr",    # Operadores consistentes para strings
"tibble",     # Dataframes del Siglo 21 (moderniza sintaxis)
"gapminder",  # data de Gapminder
"tidyverse",  # Set de paquetes que hacen muchas cosas
"gifski",     # encoding de GIFs
"av",         # herramientas de audio y video
"webshot",    # screenshots de paginas web
"ggplot2",    # Graficos complejos
"GGally",     # extensión de ggplot2
"ggsci",      # paletas de colores para publicación
"ggpubr",     # ggplot simplificado para publicaciones
"gganimate",  # graficos animados
"ggmuller",   # diagrama de evolucionarios Muller
"autoplotly", # visualizaciones interactivas
"gridExtra",  # extensión de grid, para la creación de figuras
"missRanger", # Permite completar data incompleta (gaps)
"outForest",  # Detección y reemplazo de outliers y gaps
"OutlierDetection", # Detección avanzada de outliers
"BiocManager") # Gestor de paquetes de Bioconductor

bioPacks <- c(# PAQUETES DESDE BIOCONDUCTOR
"Biostrings", # Manipulación de strings en biología
"biomaRt")    # Acceso a bases de datos biomedicas

biocran  <- c(# PAQUETES CRAN DEPENDIENTES DE BIOCONDUCTOR
  "biomartr")  # Permite descargar elementos de Biomart

instalar <- c(packages, bioPacks, biocran) # Lista completa de dependencias

# ACTUALIZACIONES -- Actualiza todo antes de instalar cosas nuevas

update.packages(ask = FALSE, checkBuilt = TRUE, type = getOption("pkgType"))
BiocManager::install(update = TRUE, ask = FALSE) # Actualiza de Bioconductor

# INSTALACIONES -- compara con listas, e instala los que no están

instalables <- instalar[!(instalar %in% installed.packages()[,"Package"])] # Substrae los que faltan
options(install.packages.check.source = "yes") # Chequea la fuente de los paquetes

if(length(instalables)) {

  # Instalaciones desde CRAN
  instalables.cran <- packages[!(packages %in% installed.packages()[,"Package"])]     # Lista
  install.packages(instalables.cran, quiet = TRUE)        # Instala los que faltan desde CRAN

  # Instalaciones desde Bioconductor
  instalables.bioPacks <- bioPacks[!(bioPacks %in% installed.packages()[,"Package"])] # Lista
  BiocManager::install(instalables.bioPacks, ask=FALSE)

  # Instalaciones dependientes CRAN de Bioconductor
  instalables.biocran <- biocran[!(biocran %in% installed.packages()[,"Package"])]    # Lista
  install.packages(instalables.biocran, quiet = TRUE)     # Instala los que faltan desde CRAN

  # FIN DE ESTAS INSTALACIONES
  print(paste0(length(instalables)," paquetes instalados. (Actualizado a ",fecha,")"))} else
  print(paste0("Todo al dia! (Actualizado a ",fecha,")")) # Avisa que esta listo
