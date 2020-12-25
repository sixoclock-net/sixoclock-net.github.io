# MACS2

> ChIP-seq的核心是检峰（Peak Calling），当然现成的工具有很多，其中MACS比较常用，本文以MACS v2为例进行检峰的原理和使用。

#### 一、背景

染色质免疫共沉淀技术（Chromatin Immunoprecipitation，**ChIP**）也称结合位点分析法，是研究体内蛋白质与DNA相互作用的有力工具，通常用于转录因子结合位点或组蛋白特异性修饰位点的研究。

![img](https:////upload-images.jianshu.io/upload_images/7288149-6675a2c50cb60369.png?imageMogr2/auto-orient/strip|imageView2/2/w/553/format/webp)

多种组学手段

#### 二、实验

![img](https:////upload-images.jianshu.io/upload_images/7288149-2e447b62777df4f6.png?imageMogr2/auto-orient/strip|imageView2/2/w/569/format/webp)

ChIP实验模式图

#### 一、软件下载

著名代码托管网站github上有最新的开发版本： *https://github.com/taoliu/MACS*

#### 二、软件使用

（1）双峰模型

![img](https:////upload-images.jianshu.io/upload_images/7288149-e1299ac90a323e50.png?imageMogr2/auto-orient/strip|imageView2/2/w/428/format/webp)

检峰过程

MACS2是基于模型（**泊松分布**）的方法进行检峰的，上述示意图中的模型是**双峰模型**，目的是为了将比对上的Reads朝3`端偏移（shift），以更准确地得到蛋白-DNA互作的位置。

这里需要注意对于单端数据（SE）需要进行shift以评估平均插入片段大小（Insert Size）；若使用的数据为双端（PE）则直接使用真实的Fragment Size进行检峰。

（2）检峰

![img](https:////upload-images.jianshu.io/upload_images/7288149-d61a594f7131efae.png?imageMogr2/auto-orient/strip|imageView2/2/w/435/format/webp)

单链双峰模型

2.1 建立shift模型：

MACS2以固定大小窗口扫描基因组；取前1000个富集程度最好的峰；区分正/负链比对reads，评估d的长度；建立正/负链模型。

2.2 检测显著峰

Reads向中心Shift 1/2d的距离；以长度2d的窗口扫描全基因组得到显著富集的候选峰（基于泊松分布）； 合并重叠的峰。

\# d：插入片段长度

#### 三、峰型

（1） 窄峰 -转录因子等

![img](https:////upload-images.jianshu.io/upload_images/7288149-a12667fea69629dc.png?imageMogr2/auto-orient/strip|imageView2/2/w/564/format/webp)

专转录因子

（2） 混合峰 - 聚合酶II等



![img](https:////upload-images.jianshu.io/upload_images/7288149-633e06a7c621bf01.png?imageMogr2/auto-orient/strip|imageView2/2/w/550/format/webp)

聚合酶II

（3）宽峰 -组蛋白等



![img](https:////upload-images.jianshu.io/upload_images/7288149-9f0f596d2340ceda.png?imageMogr2/auto-orient/strip|imageView2/2/w/592/format/webp)

组蛋白

#### 四、如何使用

> MACS2非常适合转录因子和组蛋白修饰类型的检峰。

使用MACS2时需要根据不同峰型进行参数的调整，软件说明文档参数如下：

常用参数：macs2 callpeak -t ChIP.bam -c Control.bam -f BAM -g hs -n test -q 0.01

宽峰参数：macs2 callpeak -t ChIP.bam -c Control.bam --broad -g hs --broad -cutoff1

其中，-t为ChIP样本；-c为control样本即input；-f为输入文件的格式，一般使用BWA、Bowtie2比对后的BAM文件；-g有效基因组大小，MACS2内置了一些物种如人类是hs；-n为样本名称；-q为检峰显著性阈值； --broad为检测宽峰的阈值； -cutoff为筛选fold-enrichment的阈值。

针对转录因子类型为了得到结合位置的峰顶可以添加 --call-summits，另外--extsize具体数值可以使用macs2 predictd进行评估（例如评估值为200），检峰参数如下:

> macs2 callpeak -t ChIP.bam -c Control.bam -f BAM -g hs -n test --call-summits --nomodel --extsize 200 -q 0.01

针对组蛋白类型，需要合并邻近的峰形成宽峰，检峰参数如下：

> macs2 callpeak -t ChIP.bam -c Control.bam -f BAM -g hs -n test **--broad** --nomodel --extsize 173 -cutoff 2 -q 0.01

对于双端数据，-f参数为BAMPE，这时检峰所使用的插入片段长度为实际的平均插入片段长度，不需要建模（使用--nomodel，同时--extsize失效）

检峰之后就是检测基序（motif）了，链接：[检测基序](https://www.jianshu.com/p/bf350c5e140f)

#### 五、其他软件

参考如下文章：

![img](https:////upload-images.jianshu.io/upload_images/7288149-1dcb4ad721b10715.png?imageMogr2/auto-orient/strip|imageView2/2/w/644/format/webp)

检峰软件比较

![img](https:////upload-images.jianshu.io/upload_images/7288149-422d44bf3f6adf12.png?imageMogr2/auto-orient/strip|imageView2/2/w/468/format/webp)

检峰精确性比较(NRSF基序)

#### 六、参  考

[1] https://www.encodeproject.org/

[2] https://en.wikipedia.org/wiki/ChIP-sequencing

[3] https://www.illumina.com/techniques/sequencing/dna-sequencing/chip-seq.html



作者：浩渺予怀
链接：https://www.jianshu.com/p/0c272643f88b
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。