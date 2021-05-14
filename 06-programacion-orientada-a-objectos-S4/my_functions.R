import_my_csv <- function(url){readr::read_csv(url) %>% dplyr::select(-matches("x1"))}


create_metabolism <- function(genes =  genes_url, reactions = reactions_url, metabolites = metabolites_url) {
  genes_df          <- import_my_csv(genes_url) 
  genes             <- new("genes", indentifiers = genes_df["Gene_ID"], gene_to_reactions = genes_df["Reactions"])
  
  reactions_df      <- import_my_csv(reactions_url) 
  reactions         <- new("reactions", indentifiers =  reactions_df[c('rxn_ids','rxn_names')], stoichiometry = reactions_df['reactions'], subsystem = reactions_df["rxn_subsystems"])
  
  metabolites_df    <- import_my_csv(metabolites_url) 
  metabolites       <- new("metabolites", indentifiers =metabolites_df[c('ID', 'Name')], compartemt = metabolites_df['Compartment'], formula = metabolites_df['Formula'])  
  
  new("metabolism", genes =  genes, reactions = reactions, metabolites = metabolites) %>% glimpse}




setGeneric("metabolite_to_genes",                            function(S4_object, name_pattern) standardGeneric("metabolite_to_genes"))
setMethod("metabolite_to_genes",  signature(S4_object= "metabolism"), function(S4_object, name_pattern) {
  
  regex(name_pattern, ignore_case = T) -> name_pattern
  name_pattern_to_IDs(S4_object, 'metabolites', name_pattern) -> met_ids  
  mets_to_rxns(S4_object,met_ids) -> my_rxns
  genes_by_reactions(S4_object) %>% filter(rxn %in% my_rxns) %>% .[["gene"]]
})

setGeneric("mets_to_rxns",                            function(S4_object, met_ids) standardGeneric("mets_to_rxns"))
setMethod("mets_to_rxns",  signature(S4_object= "metabolism"), function(S4_object, met_ids) {
  
  cbind(S4_object@reactions@indentifiers,S4_object@reactions@stoichiometry) %>% filter(str_detect(reactions,paste0(met_ids, collapse = '|'))) %>%  .[['rxn_ids']]
  
  
})

setGeneric("name_pattern_to_IDs",                            function(S4_object, entry, name_pattern) standardGeneric("name_pattern_to_IDs"))
setMethod("name_pattern_to_IDs",  signature(S4_object= "metabolism"), function(S4_object, entry, name_pattern) {
  
  regex(name_pattern, ignore_case = T) -> name_pattern
  
  slot(S4_object, entry) %>% slot('indentifiers') %>% names %>% str_extract(regex('.*id.*', ignore_case = T)) %>% na.exclude %>% as.character -> my_id_col
  slot(S4_object,entry) %>% slot('indentifiers') %>% names %>% str_extract(regex('.*nAme.*', ignore_case = T)) %>% na.exclude %>% as.character -> my_name_col
  slot(S4_object, entry) %>% slot('indentifiers') %>% select(c(my_id_col, my_name_col)) %>%filter(str_detect(.[[2]],name_pattern)) %>% select(my_id_col) %>% .[[1]]
  
})

setGeneric("genes_by_reactions",   function(x) standardGeneric("genes_by_reactions"))
setMethod("genes_by_reactions", "metabolism", function(x){ 
  slot(x@genes, 'indentifiers')[[1]]  -> genes
  slot(x@genes, 'gene_to_reactions')[[1]] %>% as.list()%>% str_extract_all('\\w+') %>% 
    tibble(  rxn=. ,gene = genes) %>% unnest(cols = rxn)
})

setGeneric("genes_ids",   function(x) standardGeneric("genes_ids"))
setMethod("genes_ids", "metabolism", function(x) slot(x@genes, 'indentifiers')[[1]])




setGeneric("genes_ids<-",                            function(S4_object, value) standardGeneric("genes_ids<-"))
setMethod("genes_ids<-",  signature(S4_object= "metabolism"), function(S4_object, value) {
  S4_object@genes@indentifiers <-data.frame(Gene_ID = value )
  S4_object
})



























