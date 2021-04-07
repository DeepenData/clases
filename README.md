# Curso de Bioinformática en R Introductorio - Abril 2021

_Clases de bioinformática para gente no informática._

Los avances en la obtención de datos biológicos asociados a genes, proteínas y metabolitos han dado lugar a un rápido aumento del volumen y complejidad de datos publicados en distintos repositorios de libre acceso (por ejemplo Gene Expression Omnibus de NCBI). Actualmente se requiere de bioinformáticos que apliquen herramientas bioinformáticas y ciencia de datos para generar resultados biológicamente interpretables desde datos complejos y diversos.

Este curso está orientado a alumnos sin ningún conocimiento previo sobre programación y computacional ni bioinformática. Se espera que al final del curso los alumnos dominen herramientas básicas de bioinformática y principios generales de ciencia de datos para aplicarlos en sus respectivas áreas de investigación.

## Tabla de contenidos

1. Herramientas computacionales y programación para bioinformática
    1. Herramientas computacionales
        - Interacción con terminales
        - Conceptos generales sobre lenguajes de programación e IDEs
        - R y RStudio
    2. Creación e importación de estructuras de datos
        - Importación desde distintos formatos
        - Formatos comunes: Excel, CSV y TSV, descargas
        - Estructuras tipicas de DataScience
        - Manejando versiones de Datasets
    3. Exploración y transformación de estructuras de datos en R
        - Librerias para manipulación de datos: _TidyR_ y _DplyR_
        - Filtrado de datos y Regex
        - _Piping_ de codigo
2. Obtención y pre-procesamiento de datos biológicos y metadatos asociados
    1. Descargas desde repositorios e interacción con objetos obtenidos
        - Consulta de objetos y bases de datos accesibles desde R mediante APIs de repositorios públicos 
    2. Control de calidad de datos
        - Detección, análisis y tratamiento de valores ausentes, datos corruptos y/o extremos mediante aprendizaje automático
    3. Pre-procesamiento de datos
        - Estandarización, normalización y re-escalamiento
3. Descubrimiento de patrones y formulación de hipótesis biológicas a partir de aprendizaje automático (machine learning) no-supervisado
    1. Análisis de expresión diferencial
        - Estadísticas sobre datos bioquímicos y de expresión génica
    2. Detección de grupos mediante clustering
        - Análisis de expresión diferencial
        - Métodos no supervisados (basados en densidad), semi-supervisados y jerárquicos (dendrogramas)
        - Técnicas de visualización para datos con múltiples anotaciones
    3. Reducción de dimensionalidad
       - Métodos de reducción de dimensionalidad lineales y no-lineales

-----

## Información sobre _branches_ de este repo

- `main` Incluye el codigo de las clases, datasets, y padding adicional para la salida de Bookdown
- `dev` son los manuscritos (llenos de faltas ortograficas, chistes malos, y referencias obscuras), para evitar spamear la versión principal
- `gh-pages` tiene el resultado del rendering de Bookdown

Ciertos archivos de datasets son muy pesados para incluir en este repo, por lo que estan como links de descarga desde S3 o bases de datos externas. 
