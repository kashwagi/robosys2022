#!/bin/bash
# SPDX-FileCopyrightText: 2022 Yuki Kashiwagi
# SPDX-License-Identifier: BSD-3-Clause


ng () {
	echo NG at Line $1
	res=1
}

res=0

### I/O TEST ###
out=$(seq 5 | ./plus)
[ "${out}" = 15 ] || ng ${LINENO}

[ "$res" = 0 ] && echo OK        # &&（AND記号）は左側が成功すると右側を実行
exit $res

### STRANGE INPUT ###
  out=$(echo あ | ./plus)
  [ "$?" = 1 ]      || ng ${LINENO}
  [ "${out}" = "" ] || ng ${LINENO}
    
  out=$(echo | ./plus) #空文字
  [ "$?" = 1 ]      || ng ${LINENO}
  [ "${out}" = "" ] || ng ${LINENO}
    
[ "$res" = 0 ] && echo OK
  exit $res

#count test
out=$(./count pppppppppp)
[ "${out}" = 10 ] || ng ${LINENO}
