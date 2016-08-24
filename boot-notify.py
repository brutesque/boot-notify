#!/usr/bin/env python

"""
Boot notification using prowl.
"""
import os, time, socket
import prowlpy

try:
	apikey = os.environ['BOOTNOTIFY_API_KEY']
except KeyError, e:
	print time.ctime(), 'Environment variable BOOTNOTIFY_API_KEY not found.'
	exit(1)

p = prowlpy.Prowl(apikey)

def notified():
	try:
		p.add(
			application=os.uname()[1],
			event='Boot notification',
			description='Your system just booted.',
			priority=0,
		)
		return True
	except socket.gaierror, msg:
		print time.ctime(), msg
		return False

while not notified():
	time.sleep(5)

print time.ctime(), 'Successfully notified'
