#!/usr/bin/python
'''
	1
'''
def print_quine(string):
	print string%string
if __name__ == '__main__':
	'''
		2
	'''
	string="#!/usr/bin/python\n'''\n\t1\n'''\ndef print_quine(string):\n\tprint string%%string\nif __name__ == '__main__':\n\t'''\n\t\t2\n\t'''\n\tstring=%r\n\tprint_quine(string)"
	print_quine(string)
