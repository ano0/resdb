#!/usr/bin/python2.7
import sys; sys.tracebacklimit = 0
from crypt import crypt
TestHash = crypt(sys.argv[1], sys.argv[2])
HashValue = sys.argv[3]
if TestHash.__contains__(HashValue):
 print "SHADOW CRACKED"
