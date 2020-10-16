# DEMOSTRACIÓN DE LOOPS PARA ARCHIVOS
# Este script genera los archivos que uso
# como ejemplo en cuadero 07_algoritomos.Rmd
# La data real es secreta y solo mia
# (muajajaja)
#     - Manu 2020/10/15 17:42

# ¿QUE HACE ESTO?
# Hay un total de 18 instancias
# de las que se usan en general 16
# segun la probabilidad c(15,16,16,16,16,17,17,18)
# y quedan idles 2 o 3

# Entonces, se tienen los IDs y el tiempo de CPU
# en archivos .csv con el codigo mes.semana abcd

library(stringi);  # Genera ids para las maquinas
stringi::stri_rand_strings(18,18, pattern = "[a-f0-9]") -> rand.id
ids = c(); index = 1
for (i in rand.id){
    ids[index] <- paste0("i-0",i) # Todos los ids empiezan como i-0nnnnnn
    index = index + 1
  }
rand.id <- NULL

library("stats") # Para distribuciones normales del tiempo de CPU
zeit <- as.integer((60*80)*(pnorm(seq(1.6,5.0,by = .2), mean = 2.2, sd = 0.1)*100))

library("readr") # para guardar los csv
reportes = c("instancias-09c.csv","instancias-09d.csv","instancias-10a.csv","instancias-10b.csv")
for (i in reportes)
  {
    # Podria usar una normal pero es más facil hacer el vector y sample()
    n <- sample(c(14,15,16,17),1)
    out <- data.frame(
      ID      = sample(ids,  n), # Lee IDS
      CPUzeit = sample(zeit, n)  # Les asigna un tiempo
      )
    # Todo esto esta en el mismo directorio que 07-clase... Por orden hare un subDir
    write.csv2(out, paste0("./procesamiento-lotes/",i)) # Guarda en el subdirectorio
  }

# NOTAS DE DEBUG
# 1. Este archivo fue creado en mi propio ambiente,
#    es posible que la linea 40 falle al no existir
#    el subdirectorio "./procesamiento-lotes/", para
#    lo cual reemplacen ",paste0(...))" por ",i)"
#    pero eso tirara los csv al directorio de trabajo
# 2. RDS es mejor que CSV, pero para este ejemplo lo
#    que busco es interoperabilidad, no eficiencia

