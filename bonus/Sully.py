#!/usr/bin/python
from __future__ import print_function
import os
import sys
i=5
if (i <= 0):
	sys.exit(0)
i = i if os.path.basename(__file__) == 'Sully.py' else i - 1
filename='Sully_{}.py'.format(i)
f=open(filename, 'w+')
os.chmod(filename, 0744)
string="#!/usr/bin/python\nfrom __future__ import print_function\nimport os\nimport sys\ni=%i\nif (i <= 0):\n\tsys.exit(0)\ni = i if os.path.basename(__file__) == 'Sully.py' else i - 1\nfilename='Sully_{}.py'.format(i)\nf=open(filename, 'w+')\nos.chmod(filename, 0744)\nstring=%r\nprint(string%%(i, string), file=f)\nf.close()\nos.system('./'+filename)"
print(string%(i, string), file=f)
f.close()
os.system('./'+filename)
