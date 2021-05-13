import_my_csv <- function(url){readr::read_csv(url) %>% dplyr::select(-matches("x1"))}


create_metabolism <- function(genes =  genes_df, reactions = reactions_df, metabolites = metabolites_df) {
  
  genes       <- new("genes", indentifiers = genes_df["Gene_ID"], gene_to_reactions = genes_df["Reactions"])
  reactions   <- new("reactions", indentifiers =  reactions_df[c('rxn_ids','rxn_names')], stoichiometry = reactions_df['reactions'], subsystem = reactions_df["rxn_subsystems"])
  metabolites <- new("metabolites", indentifiers =metabolites_df['ID', 'Name'], compartemt = metabolites_df['Compartment'], formula = metabolites_df['Formula'])  
  
  new("metabolism", genes =  genes, reactions = reactions, metabolites = metabolites) %>% glimpse}