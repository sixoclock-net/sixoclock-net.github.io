# BWA



## 功能简介



BWA，全称Burrow-Wheeler Aligner ，是用于将DNA序列（reads）比对（映射）到大型参考基因组（例如人类基因组）的软件包，由C/C++编写。 它包含三种算法：BWA-backtrack, BWA-SW 和 BWA-MEM. 第一种算法用于Illumina测序序列reads，reads长度最高支持100bp，而其余两种算法用于更长reads（长度可从70bp到几Mbp）的比对。

## 输入文件

参考基因组fasta文件（*.fa）：待比对物种的参考基因组，一般为fasta格式的文本文件

测序fastq文件(*.fq)：待比对reads序列，一般为包含成千上万条reads的文本文件。

## 输出文件

sam文件：比对好的存放reads比对结果信息的sam文件

## 下载使用

软件运行条件:
:fontawesome-brands-docker:
:fontawesome-brands-linux:

确保操作系统中安装有docker和git软件，并且当前用户具有docker运行权限。



下载方式一：

dockerhub：

```bash
docker pull 6oclock/bwa:v0.7.12-r1044
```



下载方式二：

阿里docker镜像仓库：

```
sudo docker pull registry.cn-shenzhen.aliyuncs.com/6oclock/bwa:v0.7.12-r1044
```



## 使用案例

#### 下载测试数据

```
git clone https://github.com/6-oclock/example-data.git
```



#####  建立索引 index

```
WORKDIR=`readlink -f ./`
docker run -v ${WORKDIR}:${WORKDIR} 6oclock/bwa:v0.7.12-r1044 \
index -a bwtsw ${WORKDIR}/example-data/NGS/reference/lambda_virus.fa
```

#####  mem比对

单端测序数据简单比对

```
docker run -v ${WORKDIR}:${WORKDIR} 6oclock/bwa:v0.7.12-r1044 \
mem ${WORKDIR}/example-data/NGS/reference/lambda_virus.fa \
${WORKDIR}/example-data/NGS/reads/reads_1.fq > mem-se.sam
```

**双端测序数据指定参数比对**

```
docker run -v ${WORKDIR}:${WORKDIR} 6oclock/bwa:v0.7.12-r1044 \
mem -t 4 -M -R '@RG\tID:E1602061\tSM:bar\tLB:library1' \
${WORKDIR}/example-data/NGS/reference/lambda_virus.fa \
${WORKDIR}/example-data/NGS/reads/reads_1.fq \
${WORKDIR}/example-data/NGS/reads/reads_2.fq > mem-pe.sam
```



## 软件出处与原文链接

gtihub：https://github.com/lh3/bwa