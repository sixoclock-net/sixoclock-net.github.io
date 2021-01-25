FPKM（Fragments Per Kilobase of exon model per Million mapped fragments），每千个碱基的转录每百万映射读取的fragments，与RPKM的区别主要是FPKM针对pair-end测序表达量进行计算。
$$
RPKM= total~exon~fragments/ (mapped~reads~(Millions) * exon~length(KB))
$$

total exon fragments：某个样本mapping到特定基因的外显子上的所有的fragments；

mapped reads ( Millions ) :某个样本的所有reads总和；

exon length( KB )：某个基因的长度（外显子的长度的总和，以KB为单位）。

对于双末端测序而言，如果一对paired-read都比对上了，那么这一对paired-read称之为一个fragment，而如果一对paired-Read中只有一个比对上了，另外一个没有比对上，那么就将这个比对上的read称之为一个fragment.
