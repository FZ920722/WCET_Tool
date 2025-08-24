# !/bin/bash

# # # # # # # # # # # # 
# # 定义逗号分隔的字符串
# # input="apple,banana,orange"
# input="apple"
# # 用tr将逗号替换为换行符，逐行打印
# echo "$input" | tr ',' '\n' | sed 's/$/\/.c/'
# echo "$input" | tr ',' '\n' | sed 's/^/-I /'
# echo "$input" | tr ',' '\n' | sed 's/^/-I /; s/$/\/.c/'
# # # # # # # # # # # # 

set -e -u -o pipefail

# source example.sh
# ./example aa bb cc dd


echo "The shell excution:$0"    #4.sh
echo "parameter number:$#"      #4
echo "parameter list 1:$*"      #aa bb cc dd
echo "parameter list 2:$@"      #aa bb cc dd

a=2
b=3
expr $a + $b            # 输出5
expr $RANDOM % 100          # $RANDOM表示随机数

echo "当前登录用户信息："
a='who | wc -l'
b=who | awk '{print $1, $2}'
# 以空格为分割符裁出第一个字段和第二个字段
if [$a -gt 5]
then
	echo "当前登陆${a}个用户"
	echo "用户太多，警告！！"
else
	echo "当前用户较少"
	# echo -e “登陆情况如下：$b”
fi

read -p "分数:" aa
if [ $aa -le 100 ] && [ $aa -gt 85 ]
then
	echo "优秀"
elif	[ $aa -le 84 ] && [ $aa -gt 70 ]
then
	echo "合格"
elif [ $aa -le 69 ] && [ $aa -gt 60 ]
then
	echo "凑合"
else
	echo "不及格"
fi
