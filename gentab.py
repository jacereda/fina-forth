import sys
res = ''
for prim in sys.stdin.read().split('PRIM(')[1:]:
	res += '&&' + prim.split(')')[0] + ',\n'
print(res)
