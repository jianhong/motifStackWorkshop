TFs <- read.delim("~/Downloads/CisBP_2019_06_05_10_44_am/TF_Information.txt", header = FALSE)
TFs <- as.character(TFs[, 1])[-1]
url <- "http://cisbp.ccbr.utoronto.ca/TFreport.php?searchTF="
library(XML)
tbls <- lapply(TFs, function(.ele){
  tables <- readHTMLTable(paste0(url, .ele))[[2]]
  ts <- which(tables$V1=="Directly determined binding motifs")
  te <- which(tables$V1=="Motifs from related TFs")
  tables <- tables[ts:te, ]
  tables
})

names(tbls) <- TFs

tbs <- lapply(tbls, function(.ele){
  out <- .ele[3:(nrow(.ele)-1), ]
  colnames(out) <- as.character(t(.ele)[, 2, drop=TRUE])
  out
})

tbs <- do.call(rbind, tbs)
tbs <- tbs[tbs[, 1]!="No direct experiments", ]
dim(tbs)

n <- cbind(do.call(rbind, strsplit(as.character(tbs[, 1]), " ")), sub(" et al.\\(.*?\\).*$", "", as.character(tbs[, 5])))

unique(n[, 3])

n <- n[grepl("SELEX|B1H|PBM|SMiLE", n[, 3]), ]

library(motifStack)

pwms <- readLines("~/Downloads/CisBP_2019_06_05_10_44_am/PWM.txt")

x <- grepl("Motif", pwms)
y <- grepl("TF Name", pwms)

pwms[y] <- paste(pwms[y], n[match(sub("Motif.", "", pwms[x]), n[, 2]), 3], sep="__")

writeLines(pwms, "~/Downloads/CisBP_2019_06_05_10_44_am/PWM.1.txt")

pfms <- importMatrix("~/Downloads/CisBP_2019_06_05_10_44_am/PWM.1.txt", format="cisbp")

## convert pfm file format for MatAlign2tree
pfmpath <- "pfms"
dir.create(pfmpath)
null <- 
  lapply(pfms, function(.e){
    mat <- .e@mat
    rownames(mat) <- paste(rownames(mat), "|", sep="\t")
    write.table(mat, col.names = FALSE, sep = "\t", quote = FALSE, 
                file = file.path(pfmpath, paste0(.e@name, ".pfm")))
  })
pfmfiles <- dir(pfmpath, full.names = TRUE)
unlink(pfmfiles[grepl("__NA", pfmfiles)])
unlink(pfmfiles[grepl("\\.\\d\\.pfm", pfmfiles)])
pfmfiles <- dir(pfmpath, full.names = TRUE)
## keep the fpms exist in multiple methods
factors <- sub("__(.*?).pfm$", "", pfmfiles)
ft <- table(factors)
keep <- names(ft)[ft>1]
keep <- factors %in% keep
unlink(pfmfiles[!keep])
