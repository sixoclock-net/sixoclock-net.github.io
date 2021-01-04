# 什么是Contig N50？

Reads拼接后会获得一些不同长度的Contigs, 将所有的Contig长度相加，能获得一个Contig总长度。将所有的Contigs按照从长到短进行排序，如获得Contig 1, Contig 2, Contig 3, ..., Contig 25。将Contig按照这个顺序依次相加，当相加的长度达到Contig总长度的一半时，最后一个加上的Contig长度即为Contig N50。



__一个例子:__

Contig1+Contig2+ Contig3+Contig4=Contig总长度的1/2时，Contig4的长度即为Contig N50。

Contig N50可以作为基因组拼接的结果好坏的一个判断标准。