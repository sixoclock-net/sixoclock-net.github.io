**BED 文件**

BED的全称是Browser Extensible Data，是为基因组浏览器（genome browser）设计的。BED包含有3个必须的字段和9个可选字段。
三个字段包括：
1 chrom - 染色体名字
2 chromStart - 染色体起始位点
3 chromEnd - 染色体终止位点
这里必须指出的是chromStart是起始于0，而不是1。
可选的9个字段包括：
4 name - 名字
5 score - 分值(0-1000), 用于genome browser展示时上色。
6 strand - 正负链，对于ChIPseq数据来说，一般没有正负链信息。
7 thickStart - 画矩形的起点
8 thickEnd - 画矩形的终点
9 itemRgb - RGB值
10 blockCount - 子元件（比如外显子）的数目
11 blockSizes - 子元件的大小
12 blockStarts - 子元件的起始位点
一般情况下，我们只用到前面5个字段，这也是做peak calling的MACS输出的字段。
