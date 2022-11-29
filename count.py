#!/usr/bin/python3
# SPDX-FileCopyrightText: 2022 Yuki Kashiwagi

import collections

dp = open('sample.txt','r',encoding='UTF-8')
mozi = dp.read()
all = len(mozi)
txtcount = collections.Counter(mozi)
data = [[0 for j in range(3)] for i in range(52)]
data2 = [[0 for j in range(3)] for i in range(26)]
i=0
code = 0x41
while i < 52:

    data[i][1]=str(chr(code))
    data[i][0]=txtcount[chr(code)]
    data[i][2]=str(txtcount[chr(code)]/all*100) + "%"
    
    if code == 0x5A:
        code =0x60
    code +=1
    i +=1

mozi2 = mozi.lower()
txtcount2 = collections.Counter(mozi2)


i=0
code = 0x61
while i < 26:

    data2[i][1]=str(chr(code))
    data2[i][0]=txtcount2[chr(code)]
    data2[i][2]=str(txtcount2[chr(code)]/all*100) + "%"

    code +=1
    i +=1

data.sort(key=lambda x:x[0])
data2.sort(key=lambda x:x[0])
data = reversed(data)
data2 = reversed(data2)
print("総文字数", end="")
print(all)
print(*data,sep='\n')
print("Aa区別なし")
print(*data2,sep='\n')
print("End")

dp.close()
