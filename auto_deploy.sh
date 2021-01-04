
DOC_DIR='docs'

cat mkdocs.yml.base
for category in 名词解释
do
    echo "  - ${category}:" # 缩进用2个空格
    for subdir in `ls ${DOC_DIR}/${category}/`
    do
        echo "    - ${subdir}:"
        for file in `ls ${DOC_DIR}/${category}/${subdir}`; do echo "      - ${category}/${subdir}/${file}";done
    done
    
done
cat mkdocs.yml.tail
# mkdocs gh-deployw