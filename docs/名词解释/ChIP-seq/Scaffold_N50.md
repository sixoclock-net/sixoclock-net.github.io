# Scaffold N50

Scaffold N50与Contig N50的定义类似。Contigs拼接组装获得一些不同长度的Scaffolds。将所有的Scaffold长度相加，能获得一个Scaffold总长度。然后将所有的Scaffolds按照从长到短进行排序，如获得Scaffold 1，Scaffold 2，Scaffold 3...………Scaffold 25。将Scaffold按照这个顺序依次相加，当相加的长度达到Scaffold总长度的一半时，最后一个加上的Scaffold长度即为Scaffold25。将Scaffold按照这个顺序依次相加，当相加的长度达到Scaffold总长度的一半时，最后一个加上的Scaffold长度即为Scaffold N50。举例：Scaffold 1+Scaffold 2+ Scaffold 3 +Scaffold 4 +Scaffold 5=Scaffold总长度*1/2时，Scaffold 5的长度即为Scaffold N50。Scaffold N50可以作为基因组拼接的结果好坏的一个判断标准。
