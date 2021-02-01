每千个碱基的转录每百万映射读取的reads(RPKM, Reads Per Kilobase of exon model per Million mapped reads）, 主要用来对单端测序（single-end RNA-seq）进行定量。


RPKM= total_exon_reads/ (mapped_reads(Millions) * exon_length(KB))


total exon reads：某个样本mapping到特定基因的外显子上的所有的reads；

mapped reads ( Millions ) :某个样本的所有reads总和；

exon length( KB )：某个基因的长度（外显子的长度的总和，以KB为单位）。
