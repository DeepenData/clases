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

version <- "1.0.1"
fecha   <- "2020-10-01"

# LISTADOS DE PAQUETES -- Solo son vectores de nombres

packages <- c(# PAQUETES INSTALADOS DESDE CRAN
"devtools",   # Utilidades de manejo de archivos, descargas, etc.
"tidyverse",  # Set de paquetes que hacen muchas cosas
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

instalar <- c(packages, bioPacks) # Lista completa de dependencias

# INSTALACIONES -- compara con listas, e instala los que no están

instalables <- instalar[!(instalar %in% installed.packages()[,"Package"])] # Substrae los que faltan
options(install.packages.check.source = "yes") # Chequea la fuente de los paquetes
if(length(instalables)) {
  install.packages(instalables) # Instala los que faltan
  print(paste0(length(instalables)," paquetes instalados. (Actualizado a ",fecha,")"))} else
  print(paste0("Todo al dia! (Actualizado a ",fecha,")")) # Avisa que esta listo

