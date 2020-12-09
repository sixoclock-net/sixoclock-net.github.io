# 参考基因组



## 功能简介

 参考基因组是一个包含一个物种的所有已知的代表性核酸序列构成的数据集。科学家选择一个物种的多个个体的DNA，通过基因组测序，获得每个个体的DNA，然后拼接成能够代表该物种基因组构成的一组基因序列。由于参考基因组是由许多个体的DNA测序信息通过组装而成的，因此其不能准确地代表任何单个生物体的基因组，相反，参考基因组提供了来自每个供体（DNA提供者）的不同DNA序列的单倍体嵌合体，本质上是一种该物种基因序列经过组合的代表性基因序列。

通俗讲，参考基因组是一个能够代表一个物种基因组序列组成的一串或多条核酸序列，一般以FASTA文件存储。

## 文件格式

一个物种的参考基因组文件是一个存储基因序列的fasta文件，内容形如：

```
>gi|9626243|ref|NC_001416.1| Enterobacteria phage lambda, complete genome
GGGCGGCGACCTCGCGGGTTTTCGCTATTTATGAAAATTTTCCGGTTTAAGGCGTTTCCGTTCTTCTTCG
TCATAACTTAATGTTTTTATTTAAAATACCCTCTGAAAAGAAAGGAAACGACAGGTGCTGAAAGCGAGGC
TTTTTGGCCTCTGTCGTTTCCTTTCTCTGTTTTTGTCCGTGGAATGAACAATGGAAGTCAACAAAAAGCA
GCTGGCTGACATTTTCGGTGCGAGTATCCGTACCATTCAGAACTGGCAGGAACAGGGAATGCCCGTTCTG
CGAGGCGGTGGCAAGGGTAATGAGGTGCTTTATGACTCTGCCGCCGTCATAAAATGGTATGCCGAAAGGG
>gi|9626374|ref|NC_001465.1| Enterobacteria phage lambda, complete genome
AAGGGGATGAACCGCTTCCCGGTGCCGTTCACTTCCCGAATAACCCGGATATTTTTGATCTGACCGAAGC
GCAGCAGCTGACTGCTGAAGAGCAGGTCGAAAAATGGGTGGATGGCAGGAAAAAAATACTGTGGGACAGC
AAAAAGCGACGCAATGAGGCACTCGACTGCTTCGTTTATGCGCTGGCGGCGCTGCGCATCAGTATTTCCC
GCTGGCAGCTGGATCTCAGTGCGCTGCTGGCGAGCCTGCAGGAAGAGGATGGTGCAGCAACCAACAAGAA
AACACTGGCAGATTACGCCCGTGCCTTATCCGGAGAGGATGAATGACGCGACAGGAAGAACTTGCCGCTG
CCCGTGCGGCACTGCATGACCTGATGACAGGTAAACGGGTGGCAACAGTACAGAAAGACGGACGAAGGGT
```

上边每一个`>`开头的一段序列为参考基因组的一段连续的核酸序列，且`>`开头一行为对该段序列的描述信息。

核酸序列字符有ATCGN物种组成，其中ATCG分别表示4中脱氧核糖核酸碱基，N表示该处序列尚未得知。



### 人类参考基因组

 人类参考基因组是一个包含人类所有染色体与线粒体DNA核酸序列组成的fasta文件。目前主流的人类参考基因组为GRCh38版本。

GRCh38是2013年12月17日由基因组参考联盟（  [Genome Reference Consortium](https://en.wikipedia.org/wiki/Genome_Reference_Consortium) ）发布的。 此版本包含大约250个空白（序列未知），而第一个版本大约有150,000个空白。GRCh38组装件减少或减少了100多个缝隙。 纳米孔测序已通过使用超长读段关闭了GRCh38参考装配中的12个缺口。

GRCh38包含的染色体有：1–22 (chr1–chr22), X (chrX), Y (chrY) and Mitochondrial (chrM).

目前为止的人类参考基因组版本

|  Release name   | Date of release | Equivalent UCSC version |
| :-------------: | :-------------: | :---------------------: |
|     GRCh38      |    Dec 2013     |          hg38           |
|     GRCh37      |    Feb 2009     |          hg19           |
| NCBI Build 36.1 |    Mar 2006     |          hg18           |
|  NCBI Build 35  |    May 2004     |          hg17           |
|  NCBI Build 34  |    Jul 2003     |          hg16           |



 目前为止的小鼠参考基因组版本

| Release name  | Date of release | Equivalent UCSC version |
| :-----------: | :-------------: | :---------------------: |
|    GRCm38     |    Dec 2011     |          mm10           |
| NCBI Build 37 |    Jul 2007     |           mm9           |
| NCBI Build 36 |    Feb 2006     |           mm8           |
| NCBI Build 35 |    Aug 2005     |           mm7           |
| NCBI Build 34 |    Mar 2005     |           mm6           |

# 使用案例

### 提供坐标体系

随着DNA测序成本的降低以及新的全基因组测序技术的出现，更多的基因组序列将继续产生。 参考基因组通常用作构建新基因组的指南，使它们的组装比最初的人类基因组计划更快，更便宜。 

### 提供基因组参考值

参考基因组本质上是对一个物种的基因组确立了坐标体系，该物种的任何个体的基因组数据都可以拿来和参考基因组进行比较，同时两个个体的基因组数据也可以通过参考基因组坐标体系下的数据进行相互之间的比较。比如snp，cnv等的计算都是通过参考基因组的坐标体系进行计算的。

# 原文链接

[wiki reference genome]( https://en.wikipedia.org/wiki/Reference_genome )