TPM（Transcripts Per Kilobase of exonmodel per Million mapped reads），每千个碱基的转录每百万映射读取的Transcripts)，优化的RPKM计算方法，可以用于同一物种不同组织的比较。
$$
TPMi={( Ni/Li )*1000000 } / sum( Ni/Li+……..+ Nm/Lm )
$$

Ni：mapping到基因i上的read数；
Li：基因i的外显子长度的总和。
