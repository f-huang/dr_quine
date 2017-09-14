#!/usr/bin/python
from __future__ import print_function
import os
'''
	1
'''
filename='Grace_kid.py'
f=open(filename, 'w')
os.chmod(filename, 0744)
string="#!/usr/bin/python\nfrom __future__ import print_function\nimport os\n'''\n\t1\n'''\nfilename='Grace_kid.py'\nf=open(filename, 'w')\nos.chmod(filename, 0744)\nstring=%r\nprint(string%%string,file=f)\nf.close()"
print(string%string,file=f)
f.close()
