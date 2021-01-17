#### GFF格式

##### 简介

GFF全称为general feature format，是用于描述DNA，RNA和蛋白质序列的基因和其他特征的一种文件格式。

##### 文件格式

GFF文件由Tab键分隔开的9列组成，形如下图：

```shell
NC_000001.11    RefSeq  region  1       248956422       .       +       .       ID=NC_000001.11:1..248956422;Dbxref=taxon:9606;Name=1;chromosome
NC_000001.11    BestRefSeq      pseudogene      11874   14409   .       +       .       ID=gene-DDX11L1;Dbxref=GeneID:100287102,HGNC:HGNC:37102;
NC_000001.11    BestRefSeq      transcript      11874   14409   .       +       .       ID=rna-NR_046018.2;Parent=gene-DDX11L1;Dbxref=GeneID:100
NC_000001.11    BestRefSeq      exon    11874   12227   .       +       .       ID=exon-NR_046018.2-1;Parent=rna-NR_046018.2;Dbxref=GeneID:10028
NC_000001.11    Gnomon  CDS     379769  379870  .       -       0       ID=cds-XP_024307731.1;Parent=rna-XM_024451963.1;Dbxref=GeneID:112268260
```

- 第一列：序列的编号，一般为*chr*或者*scaffold* 编号；
- 第二列：注释的来源，一般为数据库或者注释的机构，如果未知，则用点“.”代替；像图中第一行则代表对该序列的注释来自于RefSeq数据库；
- 第三列：该序列的类型，如gene、transcript、CDS等;
- 第四列：该序列在参考序列上的起始位置，计数从1开始；
- 第五列：该序列在参考序列上的终止位置；
- 第六列：对该序列注释的评分，是注释信息可能性的说明，可以是序列相似性比对时的E-value值或者基因预测是的P-value值，`.`表示为空；
- 第七列：表示该序列对应于参考序列正负链中的哪一条，`+`表示，`-`表示负链；
- 第八列：该列注释信息仅对第三列为“CDS"的类型有效，表示起始编码的位置，有效值为0、1、2，0表示该编码框的第一个密码子第一个碱基位于其5'末端；1表示该编码框的第一个密码子的第一个碱基位于该编码区外；2表示该编码框的第一个密码子的第一、二个碱基位于该编码区外
- 第九列：该列包含众多非固定的注释信息，以多个键值对(tag=value)组成,不同属性之间以分号相隔，一个键可以有多个值，不同值用`,`分割。这里不做详细的解释。

##### 文章参考

https://cloud.tencent.com/developer/article/1036910