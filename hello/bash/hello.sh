#!/bin/bash

 # 定义变量
name="John"
age=25
 # 字符串操作
greeting="Hello, ${name}!"
echo $greeting

printf "age: %d name: %s\n" $age ${name}

 # if 分支
if [ $age -gt 18 ]; then
    echo "You are an adult."
elif [ $age -eq 18 ]; then
    echo "You are turning 18."
else
    echo "You are a minor."
fi

num1=100
num2=100
if test $[num1] -eq $[num2]
then
    echo '两个数相等！'
else
    echo '两个数不相等！'
fi

file=/bin/ls
if [ -f $file ]
then
   echo "文件为普通文件"
else
   echo "文件为特殊文件"
fi


 # case 分支
fruit="apple"
case $fruit in
    "apple")
        echo "It's an apple."
        ;;
    "banana")
        echo "It's a banana."
        ;;
    *)
        echo "It's neither an apple nor a banana."
        ;;
esac

 # for 循环
for ((i=1; i<=5; i++)); do
    echo "Iteration: $i"
done

 # for 循环
for i in {1..5}; do
    echo "Iteration: $i"
done

for i in {1..10..2}; do
    echo "Iteration: $i"
done

for str in 'This is a string'
do
    echo $str
done

for file in $(ls .); do
    echo "file name is ${file}"
done

string="hello eBPF"
echo "str: ${string}"
echo "str len: ${#string}"
echo "sub string: ${string:6:4}"

val=`expr 2 + 2`
echo "两数之和为 : $val"
echo "两数之和为 : $((2+3))"
echo "mod: $((100%12))"

fruits=("apple" "banana" "orange")
fruits[3]="peach"
echo "数组的元素为: ${fruits[*]}"
echo "数组元素个数为: ${#fruits[*]}"
echo "第一个元素为: ${fruits[0]}"

# for-in 循环
for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done

 # while 循环
counter=0
while [ $counter -lt 5 ]; do
    echo "Counter: $counter"
    counter=$((counter + 1))
done

 # until 循环
num=0
until [ $num -ge 5 ]; do
    echo "Number: $num"
    num=$((num + 1))
done
 # 函数定义和调用
function say_hello() {
    local name=$1
    echo "Hello, $name!"
}
 say_hello "Alice"
 # 常用命令调用
current_dir=$(pwd)
echo "Current directory: $current_dir"
ls -l

who > users
wc -l users
rm users
