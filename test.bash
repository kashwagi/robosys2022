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
