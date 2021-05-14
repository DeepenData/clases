#creación del objeto S4: seteo de las clases.
library(methods)

setClass("genes", 
           slots = c(
           indentifiers    = "data.frame",
           gene_to_reactions   = "data.frame"))

setClass("reactions", 
         slots = c(
           indentifiers  = "data.frame", 
           stoichiometry = "data.frame", 
           subsystem     = "data.frame"))

setClass("metabolites", 
         slots = c(
           indentifiers = "data.frame", 
           compartemt   = "data.frame",
           formula      = "data.frame"))

#la clase metabolism depende de las clases genes, reactions y metabolites, predefinidas arriba.
setClass("metabolism", 
         slots = c(
           genes = 'genes', 
           reactions = 'reactions',
           metabolites = 'metabolites'))
