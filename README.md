# motifStack: plot multiple motifs in one figure [![build](https://travis-ci.com/jianhong/motifStackWorkshop.svg?branch=master)](https://travis-ci.com/jianhong/motifStackWorkshop)

# Instructor(s) name(s) and contact information

Jianhong Ou <jianhong.ou@duke.edu>; Lihua Julie Zhu <Julie.Zhu@umassmed.edu>

# Workshop Description

A sequence motif is a short recurring pattern with biological significance such as a DNA recognition sequence for a transcription factor (TF), a mRNA splicing signal, or a functional region of a protein domain. High-throughput experimental approaches and computational tools have been developed to generate large numbers of transcription factor (TF) motifs in several organisms, available in databases such as TRANSFAC, JASPAR, FlyFactorSurvey, and CIS- BP. To facilitate the analysis of binding site diversity/conservation within families of TFs and the evolution of binding sites between different species, we have developed a Bioconductor package motifStack. In this workshop, we will demonstrate the features and flexibility of motifStack for visualizing the alignment of multiple motifs in various styles. In addition, we will illustrate the utility of motifStack for providing insights into families of related motifs using several large collections of homeodomain (HD) DNA binding motifs from human, mouse and fly. Furthermore, we will show how motifStack facilitated the discovery that changing the computational method used to build motifs from the same binding data can lead to artificial segregation of motifs for identical TFs within a motif alignment. The package is available at http://bioconductor.org/packages/motifStack and all datasets are available at https://github.com/jianhong/motifStack.documentation/tree/master/pcmsDatasetALL. 

*Expectation:* Detailed notes and R code will be provided for reproducibility and follow-up exploration.
After this workshop, participants should be able to apply the learned skills to generate publication-quality
figures to depict their own motif dataset.

## Pre-requisites

* Basic knowledge of R syntax
* Basic knowledge of sequence motifs

## Workshop Participation

This workshop is for users who are interested in the graphic representation of multiple motifs. Participants are expected to have motifStack package installed in their own computer or pull the motifStack docker from https://hub.docker.com/r/jianhong/motifstack

## _R_ / _Bioconductor_ packages used

_MotifDb_
_motifStack_

## Time outline

| Activity                     | Time |
|------------------------------|------|
| Introduction of motifStack   | 10m  |
| Quick start of motifStack    | 5m   |
| Best Practices               | 30m  |
| Question & Answer            | 5m   |

# Workshop goals and objectives

*Learning goals* 

1.	Gain the knowledge of typical workflows for the analysis, generation, alignment and visualization of DNA/RNA/amino acid motifs.

2.	Learn how to visualize the alignment of multiple motifs in various styles using motifStack.

3.	Become aware that experimental approaches, motif generation and alignment tools may affect motif alignment results and visualization.


*Learning objectives*

1.	Learn how to import motifs from databases or a matrices.

2.	Learn how to plot a single motif.

3.	Learn how to plot multiple motifs in various styles such as a linear tree and a radial tree.

4.	Understand how to merge similar motifs and display the merged motif as motif signature.

5.	Understand how to use various color options to highlight different motif features.

6.	Understand how to set different distance cutoffs to group related motifs.
