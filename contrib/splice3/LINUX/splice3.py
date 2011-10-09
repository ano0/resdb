#!PYTHON

import os
import re
import sys
import spwd
import getpass
import os.path
import argparse
import time
from hashlib import md5


parser = argparse.ArgumentParser()

parser.add_argument('-c', '--command', action='store', dest='cmd',
                    help='Parse passwords to this command')

parser.add_argument('-d', '--dictionary', action='store', dest='dictionary',
                    help='Path to custom dictionary(wordlist)')

parser.add_argument('--rtfm', action="store_true", default=False,
                    dest='ManSwitch',
                        help='Show manual page and exit')

parser.add_argument('-r', '--restore', action='store', dest='restore',
                    help='Path to restore file')

parser.add_argument('-s', '--save', action='store', dest='save',
                    help='Directory path to create save file')

parser.add_argument('-t', '--test', action='store',  dest='test',
                    help='Test output of -c\'s command')

parser.add_argument('--time', action='store', dest='TIME',
                    help='Manipulate timed iterations')

parser.add_argument('-u', '--usernames', action='store', dest='usernames',
                    help='Path to username list')

parser.add_argument('--exh-l', action="store_true", default=False,
                    dest='ExhL', help='Use an exhaustive attack with letters only')

parser.add_argument('--exh-n', action="store_true", default=False,
                    dest='ExhN', help='Use an exhaustive attack with numbers only')

parser.add_argument('--exh-s', action="store_true", default=False,
                    dest='ExhS', help='Use an exhaustive attack with special characters only')

parser.add_argument('--exh-ln', action="store_true", default=False,
                    dest='ExhLN', help='Use an exhaustive attack with letters and numbers only')

parser.add_argument('--exh-ls', action="store_true", default=False,
                    dest='ExhLS', help='Use an exhaustive attack with letters and special characters only')

parser.add_argument('--exh-ns', action="store_true", default=False,
                    dest='ExhNS', help='Use an exhaustive attack with numbers and special characters only')

parser.add_argument('--exh-lns', action="store_true", default=False,
                    dest='ExhLNS', help='Use an exhaustive attack with all characters')

parser.add_argument('--exh-custom', action='store', dest='ExhCustom',
                    help='Use an exhaustive attack with custom characters')

parser.add_argument('--stdout', action="store_true", default=False,
                    dest='StdoutSwitch', help='Print only passwords to stdout')

parser.add_argument('-A', action="store_true", default=False,
                    dest='AlphaSwitch',
                        help='Use alphabetical mixing module')

parser.add_argument('-B', action="store_true", default=False,
                    dest='BWSwitch',
                           help='Use backwords module')

parser.add_argument('-C', action="store_true", default=False,
                    dest='CapsSwitch',
                           help='Use alternating caps module')

parser.add_argument('-L', action="store_true", default=False,
                    dest='L337Switch',
                             help='Use \"L337\" speak module')

parser.add_argument('-M', action="store_true", default=False,
                    dest='MD5Switch',
                             help='Use MD5 module')

parser.add_argument('-N', action="store_true", default=False,
                    dest='NumberSwitch',
                           help='Use numerical mixing module')

parser.add_argument('-R', action="store_true", default=False,
                    dest='RegularSwitch',
                              help='Use regular words module')

parser.add_argument('-S', action="store_true", default=False,
                    dest='SpecialSwitch',
                             help='Use special mixing module')

parser.add_argument('-U', action='store', dest='MixCustom',
                    help='Use custom mixing module')

parser.add_argument('--wep-5', action="store_true", default=False,
                    dest='wep5', help='Use 5 char WEP module')

parser.add_argument('--wep-13', action="store_true", default=False,
                    dest='wep13', help='Use 13 char WEP module')

parser.add_argument('--letters', action="store_true", default=False,
                    dest='Letters', help='Use letter characters')

parser.add_argument('--numbers', action="store_true", default=False,
                    dest='Numbers', help='Use number characters')

parser.add_argument('--specials', action="store_true", default=False,
                    dest='Specials', help='Use special characters')

parser.add_argument('--no-char', action="store_true", default=False,
                    dest='NoChar', help='Override character usage')

parser.add_argument('--custom', action='store', dest='Custom',
                    help='Use custom characters')

parser.add_argument('--deshadow', action="store_true", default=False,
                    dest='DeShadow', help='Crack shadow hash sums')

parser.add_argument('--getshadow', action='store', dest='GetShadow',
                    help='Get the shadow info for a user')

parser.add_argument('--setshadow', action='store', dest='SetShadow',
                    help='Use the shadow info from a file')

parser.add_argument('--se-create', action="store_true", default=False,
                    dest='SESwitch',
                           help='a social engineering module')

parser.add_argument('--create', action="store_true", default=False,
                    dest='Create', help='Create a dictionary')

parser.add_argument('-v', '--version', action='version', version='Splice3: Brute Force Utilities For The Linux Shell',
                    help='Show splice3\'s version number and exit')

parser.add_argument('--debug', action="store_true", default=False,
                    dest='DebugSwitch', help='Enable debugging')

option = parser.parse_args()

if option.ExhCustom is not None:
 option.dictionary = option.ExhCustom
 option.Custom = option.ExhCustom

if option.DebugSwitch is False:
 sys.tracebacklimit = 0

StdoutSwitch = option.StdoutSwitch
TIME = option.TIME

ExhL = option.ExhL
ExhN = option.ExhN
ExhS = option.ExhS
ExhLN = option.ExhLN
ExhLS = option.ExhLS
ExhNS = option.ExhNS
ExhLNS = option.ExhLNS
ExhSwitch = False
if ExhL == True:
 option.dictionary = "/etc/splice3/splice3.L"
 option.Letters = True
 option.Numbers = False
 option.Specials = False
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True
if ExhN == True:
 option.dictionary = "/etc/splice3/splice3.N"
 option.Letters = False
 option.Numbers = True
 option.Specials = False
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True
if ExhS == True:
 option.dictionary = "/etc/splice3/splice3.S"
 option.Letters = False
 option.Numbers = False
 option.Specials = True
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True
if ExhLN == True:
 option.dictionary = "/etc/splice3/splice3.LN"
 option.Letters = True
 option.Numbers = True
 option.Specials = False
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True
if ExhLS == True:
 option.dictionary = "/etc/splice3/splice3.LS"
 option.Letters = True
 option.Numbers = False
 option.Specials = True
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True
if ExhNS == True:
 option.dictionary = "/etc/splice3/splice3.NS"
 option.Letters = False
 option.Numbers = True
 option.Specials = True
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True
if ExhLNS == True:
 option.dictionary = "/etc/splice3/splice3.LNS"
 option.Letters = True
 option.Numbers = True
 option.Specials = True
 option.AlphaSwitch = False
 option.BWSwitch = False
 option.CapsSwitch = False
 option.L337Switch = False
 option.NumberSwitch = False
 option.MD5Switch = False
 option.RegularSwitch = True
 option.SpecialSwitch = False
 ExhSwitch = True

if option.Custom is not None and option.dictionary is not None:
 if option.Custom == option.dictionary:
  option.Letters = False
  option.Numbers = True
  option.Specials = True
  option.AlphaSwitch = False
  option.BWSwitch = False
  option.CapsSwitch = False
  option.L337Switch = False
  option.NumberSwitch = False
  option.MD5Switch = False
  option.RegularSwitch = True
  option.SpecialSwitch = False
  ExhSwitch = True


ShadowValue = []
GetShadow = option.GetShadow
SetShadow = option.SetShadow
if option.DeShadow is True and SetShadow is None and GetShadow is None:
 print "splice3: error: --deshadow requires --getshadow or --setshadow"
 sys.exit(1)
if SetShadow is not None and GetShadow is not None:
 print "splice3: error: --getshadow and --setshadow cannot be combined"
 sys.exit(1)
elif not os.geteuid()==0 and GetShadow is not None:
 print "splice3: error: --getshadow requires root privileges"
 sys.exit(1)
elif os.geteuid()==0 and GetShadow is not None:
 try:
     ShadowValue = spwd.getspnam(GetShadow)[1]
 except:
     print "splice3: error: --getshadow: invalid user entered"
     sys.exit(1)
elif SetShadow is not None and os.path.exists(SetShadow):
 ShadowFile = open(SetShadow, 'r')
 for line in ShadowFile:
  line = line.replace('\n', '')
  ShadowValue = line
if SetShadow is not None and not os.path.exists(SetShadow):
 print "splice3: error: --setshadow: shadow file does not exist"
 sys.exit(1)
elif SetShadow is not None or GetShadow is not None:
 ShadowSalt = ShadowValue.replace('$', '^1', 1)
 ShadowSalt = ShadowSalt.replace('$', '^2', 1)
 ShadowSalt = ShadowSalt.replace('$', '^3', 1)
 ShadowSalt=ShadowSalt[ShadowSalt.find("^1"):ShadowSalt.find("^3")]
 ShadowSalt = ShadowSalt.replace('^1', '$')
 ShadowSalt = ShadowSalt.replace('^2', '$')
 ShadowSalt = ShadowSalt + "$"
 ShadowValue = ShadowValue.replace(':', '^1', 1)
 ShadowValue = ShadowValue.replace(':', '^2', 1)
 ShadowValue=ShadowValue[ShadowValue.find("^1")+2:ShadowValue.find("^2")]
 ShadowValue = ShadowValue.replace('$', '\$')
 ShadowSalt = ShadowSalt.replace('$', '\$')


ManSwitch = option.ManSwitch
if ManSwitch is True:
 os.system("man /etc/splice3/splice3.1.gz")
 sys.exit(0)

test = option.test

restore = option.restore
if restore is not None and os.path.exists(restore) is False:
 print "splice3: error: restore file does not exist"
 sys.exit(1)
elif restore is not None and os.path.exists(restore) is True:
 RestoreSwitch = True
 State = []
 StateCount = 0
 if RestoreSwitch is True:
  RESTORE = open(restore, 'r')
  for line in RESTORE:
   line = line.replace('\n', '')
   State.append(line)
   StateCount += 1
  StateCount -= 1
else:
 RestoreSwitch = False

save = option.save
Slash = "/"
if save is not None and not os.path.isdir(save):
 print "splice3: error: ( -s ) invalid directory"
 sys.exit(1)
elif save is not None and os.path.isdir(save):
 SaveSwitch = True
 s = ""
 up = 0
 end = 0
 for let in save:
  end += 1
 for let in save:
  up += 1
  if let == Slash and end == up:
   s += ""
  else:
   s += let
 save = s
 save += Slash + "splice3.save"
else:
 SaveSwitch = False

SESwitch = option.SESwitch
dictionary = option.dictionary
if dictionary is None:
 dictionary = "/etc/splice3/splice3.list"
elif dictionary is not None and not os.path.exists(dictionary):
 print "splice3: error: dictionary does not exist"
 sys.exit(1)

usernames = option.usernames
if usernames is None:
 UserSwitch = False
 UserStatus = ""
elif usernames is not None and not os.path.exists(usernames):
 print "splice3: error: username list does not exist"
 sys.exit(1)
else:
 UserSwitch = True
 UserStatus = "TRYING: [USERNAME]:"

if RestoreSwitch is False:
 AlphaSwitch = option.AlphaSwitch
 CapsSwitch = option.CapsSwitch
 BWSwitch = option.BWSwitch
 L337Switch = option.L337Switch
 MD5Switch = option.MD5Switch
 NumberSwitch = option.NumberSwitch
 RegularSwitch = option.RegularSwitch
 SpecialSwitch = option.SpecialSwitch
 Letters = option.Letters
 Numbers = option.Numbers
 Specials = option.Specials
 MixCustom = option.MixCustom
 Custom = option.Custom
 wep5 = option.wep5
 wep13 = option.wep13
else:
 option.cmd = State[0]
 dictionary = State[1]
 MixCustom = State[2]
 Custom = State[3]
 if State[4] == "True":
  ExhSwitch = True
 else:
  ExhSwitch = False
 if State[5] == "True":
  StdoutSwitch = True
 else:
  StdoutSwitch = False
 usernames = State[6]
 if State[7] == "True":
  UserSwitch = True
 else:
  UserSwitch = False
 if State[8] == "True":
  AlphaSwitch = True
 else:
  AlphaSwitch = False
 if State[9] == "True":
  BWSwitch = True
 else:
  BWSwitch = False
 if State[10] == "True":
  CapsSwitch = True
 else:
  CapsSwitch = False
 if State[11] == "True":
  L337Switch = True
 else:
  L337Switch = False
 if State[12] == "True":
  MD5Switch = True
 else:
  MD5Switch = False
 if State[13] == "True":
  NumberSwitch = True
 else:
  NumberSwitch = False
 if State[14] == "True":
  RegularSwitch = True
 else:
  RegularSwitch = False
 if State[15] == "True":
  SpecialSwitch = True
 else:
  SpecialSwitch = False
 if State[16] == "True":
  Letters = True
 else:
  Letters = False
 if State[17] == "True":
  Numbers = True
 else:
  Numbers = False
 if State[18] == "True":
  Specials = True
 else:
  Specials = False
 if State[19] == "True":
  wep5 = True
 else:
  wep5 = False
 if State[20] == "True":
  wep13 = True
 else:
  wep13 = False
 if State[21] == "True":
  SESwitch = True
 else:
  SESwitch = False

if StdoutSwitch is True:
 option.cmd = "STDOUT PASSWORD ON"

if option.Create is False and RestoreSwitch is False:
 ShadowSwitch = option.DeShadow
 if ShadowSwitch is True:
  option.cmd = "splice3-deshadow.py PASSWORD '" + ShadowSalt + "' '" + ShadowValue + "'"
 if option.cmd is None:
  print "splice3: error: invalid usage"
  sys.exit(1)
 else:
  option.cmd = option.cmd.replace('','eval ', 1)

if option.Create is False and RestoreSwitch is False:
 if option.cmd.__contains__("PASSWORD"):
  pass
 else:
  print "splice3: error: -c does not contain regexp `PASSWORD'"
  sys.exit(1)

if option.usernames is not None and RestoreSwitch is False:
 if option.cmd.__contains__("USERNAME"):
  pass
 else:
  print "splice3: error: -c does not contain regexp `USERNAME'"
  sys.exit(1)

Create = option.Create
if Create is True:
 print "Creating dictionary and exiting"

if Create is False and option.cmd.__contains__("splice3-deshadow"):
 test = "SHADOW CRACKED"
 

if AlphaSwitch is False and BWSwitch is False and CapsSwitch is False\
and L337Switch is False and NumberSwitch is False and RegularSwitch is False\
and SpecialSwitch is False and MixCustom is None and MD5Switch is False\
and wep5 is False and wep13 is False and SESwitch is False:
 print "splice3: error: no modules selected: ( -A -B -C -L -M -N -R -S -U, --wep-*, --se-create)"
 sys.exit(1)

CharsMain = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",\
             "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",\
             "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]",\
                                                                "`", "~", "{", "}", "\\", "|", ";", ":", "\"", "'", "<", ",", ">", ".", "?", "/"]

CharSet1 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",\
           "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",\
           "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", "\\", "|", ";", ":", "\"", "'", "<", ",",\
                                                                  "`", "~", ">", ".", "?", "/", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

CharSet2 = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", "\\", "|", ";", ":", "\"", "'", "<", ",",\
                                                                  "`", "~", ">", ".", "?", "/", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

CharSet3 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",\
           "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",\
           "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", "\\", "|", ";", ":", "\"", "'", "<", ",",\
                                                                                                                   "`", "~", ">", ".", "?", "/"]

CharSet4 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",\
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",\
                                                                                               "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

CharSet5 = ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", "\\", "|", ";", ":", "\"", "'", "<", ",",\
                                                                                                                    "`", "~", ">", ".", "?", "/"]

CharSet6 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",\
               "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

CharSet7 = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]


if Letters == True and Numbers == True and Specials == True:
 Characters = CharSet1
elif Letters == False and Numbers == True and Specials == True:
 Characters = CharSet2
elif Letters == True and Numbers == False and Specials == True:
 Characters = CharSet3
elif Letters == True and Numbers == True and Specials == False:
 Characters = CharSet4
elif Letters == False and Numbers == False and Specials == True:
 Characters = CharSet5
elif Letters == True and Numbers == False and Specials == False:
 Characters = CharSet6
elif Letters == False and Numbers == True and Specials == False:
 Characters = CharSet7
else:
 Characters = CharSet1

if Custom != "None" and RestoreSwitch is True:
 if os.path.exists(Custom): 
  Characters = []
  UserCharacters = open(Custom, 'r')
  for line in UserCharacters:
   Characters.append(line.replace('\n', ''))
elif Custom is not None and RestoreSwitch is False:
 if os.path.exists(Custom): 
  Characters = []
  UserCharacters = open(Custom, 'r')
  for line in UserCharacters:
   Characters.append(line.replace('\n', ''))
 else:
  print "splice3: error: --custom list does not exist"
  sys.exit(1)

EndCount = 0
for CountChars in Characters:
 EndCount += 1

Char1 = []
for a in range(0, EndCount):
 Char1.append(Characters[a])
Char2 = []
for a in range(0, EndCount):
 Char2.append("\\\\\\" + Characters[a])

if AlphaSwitch == True and NumberSwitch == True and SpecialSwitch == True:
 MixChars = CharSet1
elif AlphaSwitch == False and NumberSwitch == True and SpecialSwitch == True:
 MixChars = CharSet2
elif AlphaSwitch == True and NumberSwitch == False and SpecialSwitch == True:
 MixChars = CharSet3
elif AlphaSwitch == True and NumberSwitch == True and SpecialSwitch == False:
 MixChars = CharSet4
elif AlphaSwitch == False and NumberSwitch == False and SpecialSwitch == True:
 MixChars = CharSet5
elif AlphaSwitch == True and NumberSwitch == False and SpecialSwitch == False:
 MixChars = CharSet6
elif AlphaSwitch == False and NumberSwitch == True and SpecialSwitch == False:
 MixChars = CharSet7
else:
 MixChars = CharSet1

if MixCustom != "None" and RestoreSwitch is True:
 if os.path.exists(MixCustom): 
  MixChars = []
  MixCharacters = open(MixCustom, 'r')
  for line in MixCharacters:
   MixChars.append(line.replace('\n', ''))
elif MixCustom is not None and RestoreSwitch is False:
 if os.path.exists(MixCustom): 
  MixChars = []
  MixCharacters = open(MixCustom, 'r')
  for line in MixCharacters:
   MixChars.append(line.replace('\n', ''))
 else:
  print "splice3: error: -U list does not exist"
  sys.exit(1)

Word = []
def REGULAR():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     Word.append(line.replace('\n', ''))

def L337():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "@", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "@")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("b", "8", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("b", "8")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("e", "3", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("e", "3")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("f", "ph", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("g", "6", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("g", "6")
     Word.append(line.replace('\n', ''))
    
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("g", "9", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("g", "9")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("h", "#", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("h", "#")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "1", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "1")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "!", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "!")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "|", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "|")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("k", "X", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("k", "X")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("l", "1", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("l", "1")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("l", "|", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("l", "|")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("o", "0", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("o", "0")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("s", "5", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("s", "5")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("s", "$", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("s", "$")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("t", "7", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("t", "7")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("t", "+", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("t", "+")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("z", "2", 1)
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "6")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "6")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "9")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "9")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "&")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "&")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "6")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "6")
     line = line.replace("h", "#")
     line = line.replace("i", "1")
     line = line.replace("l", "|")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "9")
     line = line.replace("h", "#")
     line = line.replace("i", "|")
     line = line.replace("l", "1")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "9")
     line = line.replace("h", "#")
     line = line.replace("i", "|")
     line = line.replace("l", "1")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "4")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "&")
     line = line.replace("h", "#")
     line = line.replace("i", "|")
     line = line.replace("l", "1")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "^")
     line = line.replace("b", "8")
     line = line.replace("e", "3")
     line = line.replace("f", "ph", 1)
     line = line.replace("g", "&")
     line = line.replace("h", "#")
     line = line.replace("i", "|")
     line = line.replace("l", "1")
     line = line.replace("k", "X")
     line = line.replace("o", "0")
     line = line.replace("s", "5")
     line = line.replace("t", "7")
     line = line.replace("z", "2")
     Word.append(line.replace('\n', ''))

def BW():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     Word.append(line[::-1].replace('\n', ''))

def CAPS():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
         line = line.replace('\n', '')
         up = 0
         a = ""
         for let in line:
             if up == 0:
                 a += let.upper()
             else:
                 a += let
             up ^= 1
         Word.append(a)

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
         line = line.replace('\n', '')
         up = 0
         a = ""
         for let in line:
             if up == 1:
                 a += let.upper()
             else:
                 a += let
             up ^= 1
         Word.append(a)

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
         line = line.replace('\n', '')
         up = 0
         a = ""
         for let in line:
             if up <= 1:
                 a += let.upper()
                 up = up + 1
             else:
                 a += let
             up = up + 1
         Word.append(a)

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
         line = line.replace('\n', '')
         up = 0
         a = ""
         for let in line:
             if up <= 2:
                 a += let.upper()
                 up = up + 1
             else:
                 a += let
             up = up + 1
         Word.append(a)


    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace('\n', '')
     a = 0
     b = 1
     c = ""
     for let in line:
      a = a + 1
     for let in line:
      if a != b:
       b = b + 1
       c += let
      else:
       c += let.upper()
     Word.append(c)

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace('\n', '')
     a = 0
     b = 1
     c = ""
     for let in line:
      a = a + 1
     a = a - 1
     for let in line:
      if b < a:
       b = b + 1
       c += let
      else:
       c += let.upper()
     Word.append(c)
  
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "A", 1)
     if line.__contains__("A"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("a", "A")
     if line.__contains__("A"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("b", "B", 1)
     if line.__contains__("B"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("b", "B")
     if line.__contains__("B"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("c", "C", 1)
     if line.__contains__("C"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("c", "C")
     if line.__contains__("C"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("d", "D", 1)
     if line.__contains__("D"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("d", "D")
     if line.__contains__("D"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("e", "E", 1)
     if line.__contains__("E"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("e", "E")
     if line.__contains__("E"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("f", "F", 1)
     if line.__contains__("F"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("f", "F")
     if line.__contains__("F"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("g", "G", 1)
     if line.__contains__("G"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("g", "G")
     if line.__contains__("G"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("h", "H", 1)
     if line.__contains__("H"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("h", "H")
     if line.__contains__("H"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "I", 1)
     if line.__contains__("I"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("i", "I")
     if line.__contains__("I"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("j", "J", 1)
     if line.__contains__("J"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("j", "J")
     if line.__contains__("J"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("k", "K", 1)
     if line.__contains__("K"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("k", "K")
     if line.__contains__("K"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("l", "L", 1)
     if line.__contains__("L"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("l", "L")
     if line.__contains__("L"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("m", "M", 1)
     if line.__contains__("M"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("m", "M")
     if line.__contains__("M"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("n", "N", 1)
     if line.__contains__("N"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("n", "N")
     if line.__contains__("N"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("o", "O", 1)
     if line.__contains__("O"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("o", "O")
     if line.__contains__("O"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("p", "P", 1)
     if line.__contains__("P"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("p", "P")
     if line.__contains__("P"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("q", "Q", 1)
     if line.__contains__("Q"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("q", "Q")
     if line.__contains__("Q"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("r", "R", 1)
     if line.__contains__("R"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("r", "R")
     if line.__contains__("R"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("s", "S", 1)
     if line.__contains__("S"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("s", "S")
     if line.__contains__("S"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("t", "T", 1)
     if line.__contains__("T"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("t", "T")
     if line.__contains__("T"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("u", "U", 1)
     if line.__contains__("U"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("u", "U")
     if line.__contains__("U"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("v", "V", 1)
     if line.__contains__("V"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("v", "V")
     if line.__contains__("V"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("w", "W", 1)
     if line.__contains__("W"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("w", "W")
     if line.__contains__("W"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("x", "X", 1)
     if line.__contains__("X"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("x", "X")
     if line.__contains__("X"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("y", "Y", 1)
     if line.__contains__("Y"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("y", "Y")
     if line.__contains__("Y"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("z", "Z", 1)
     if line.__contains__("Z"):
      Word.append(line.replace('\n', ''))

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     line = line.replace("z", "Z")
     if line.__contains__("Z"):
      Word.append(line.replace('\n', ''))

def MIX():
    for Input in MixChars:
     ReadDictionary = open(dictionary, 'r')
     for line in ReadDictionary:
          line = line.replace('\n', '')
          up = 0
          a = ""
          for let in line:
              if up <= 1:
                  a += let + Input
                  up = up + 1
              else:
                  a += let
              up = up + 1
          Word.append(a)

    for Input in MixChars:
     for Input2 in MixChars:
      ReadDictionary = open(dictionary, 'r')
      for line in ReadDictionary:
           line = line.replace('\n', '')
           up = 0
           a = ""
           for let in line:
               if up == 1:
                   a += Input + let + Input2
                   up = up + 1
               else:
                   a += let
               up = up + 1
           Word.append(a)

    for Input in MixChars:
     ReadDictionary = open(dictionary, 'r')
     for line in ReadDictionary:
      line = line.replace('\n', '')
      a = 0
      b = 1
      c = ""
      for let in line:
       a = a + 1
      for let in line:
       if a != b:
        b = b + 1
        c += let
       else:
        c += Input + let
      Word.append(c)

    for Input in MixChars:
     for Input2 in MixChars:
      ReadDictionary = open(dictionary, 'r')
      for line in ReadDictionary:
       line = line.replace('\n', '')
       a = 0
       b = 0
       c = ""
       for let in line:
        a = a + 1
       a = a - 2
       for let in line:
        if b == a:
         b = b + 1
         c += Input + let + Input2
        else:
         c += let
         b = b + 1
      Word.append(c)

def MD5():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     Word.append(md5(line.replace('\n', '')).hexdigest())

def WEP5():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     i = 0
     for let in line:
      i += 1
     i -= 1
     if i == 5:
      line = line.encode('hex')
      line = line.replace('\n', '')
      Word.append(line.replace('0a', ''))

def WEP13():
    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     i = 0
     for let in line:
      i += 1
     i -= 1
     if i == 13:
      line = line.encode('hex')
      line = line.replace('\n', '')
      Word.append(line.replace('0a', ''))


def SOCEN():
    socen = []
    socen_a = []
    socen_words = []

    try:
        for i in Word:
         socen_words.append(i.replace('\n', ''))
    except:
        pass

    ReadDictionary = open(dictionary, 'r')
    for line in ReadDictionary:
     socen_words.append(line.replace('\n', ''))

    for i in socen_words:
     for let in i:
      try:
          let += 1
          break
      except:
          socen_a.append(let)
          break
    
    for a in socen_a:
     socen_words.append(a)

    for a in socen_words:
     x = 0
     for let in a:
      x += 1
     if x > 1:
      Word.append(a)

    for a in socen_words:
     for b in socen_words:
      x = 0
      for let in a:
       x += 1
      n = 0
      for let in b:
       n += 1
      if x > 1 or n > 1 and a != b:
       Word.append(a + b)

    for a in socen_words:
     for b in socen_words:
      for c in socen_words:
       if a != b and a != c and b != c:
        Word.append(a + b + c)    

    
if RegularSwitch is True:
 REGULAR()
if BWSwitch is True:
 BW()
if CapsSwitch is True:
 CAPS()
if L337Switch is True:
 L337()
if MD5Switch is True:
 MD5()
if wep5 is True:
 WEP5()
if wep13 is True:
 WEP13()
if SESwitch is True:
 SOCEN()

DoMix = False
if AlphaSwitch is True:
 DoMix = True
if NumberSwitch is True:
 DoMix = True
if SpecialSwitch is True:
 DoMix = True
if MixCustom != None and MixCustom != "None":
 DoMix = True
if DoMix is True:
 MIX()

User = []
if UserSwitch == True:
 UserCount = 0
 ReadUsernames = open(usernames, 'r')
 for line in ReadUsernames:
  User.append(line.replace('\n', ''))
  UserCount += 1
else:
 User.append("")
 UserCount = 1

if not Word:
 print "splice3: error: compiled empty wordlist"
 sys.exit(1)

Word = list(set(Word)) 
WordCount = 0
ShowWord = []
PassWd = []
for Input in Word:
 ShowWord.append(Input)
 c = ""
 for let in Input:
  c += "\\\\\\" + let
 PassWd.append(c)


if TIME != None:
 try:
     TIME = TIME.split(", ")
     sleep_now = int(TIME[0])
     sleep_for = int(TIME[1])

 except:
     print "splice3: error: invalid --time arguments"
     sys.exit(1)

else:
 sleep_now = 0
 sleep_for = 0

def BF1():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for x in range(StateW, WordCount):
      if SaveSwitch is True:
       WriteSave = []
       FILE = open(save, 'w')
       WriteSave.append(str(option.cmd))
       WriteSave.append(str(dictionary))
       WriteSave.append(str(MixCustom))
       WriteSave.append(str(Custom))
       WriteSave.append(str(ExhSwitch))
       WriteSave.append(str(StdoutSwitch))
       WriteSave.append(str(usernames))
       WriteSave.append(str(UserSwitch))
       WriteSave.append(str(AlphaSwitch))
       WriteSave.append(str(BWSwitch))
       WriteSave.append(str(CapsSwitch))
       WriteSave.append(str(L337Switch))
       WriteSave.append(str(MD5Switch))
       WriteSave.append(str(NumberSwitch))
       WriteSave.append(str(RegularSwitch))
       WriteSave.append(str(SpecialSwitch))
       WriteSave.append(str(Letters))
       WriteSave.append(str(Numbers))
       WriteSave.append(str(Specials))
       WriteSave.append(str(wep5))
       WriteSave.append(str(wep13))
       WriteSave.append(str(SESwitch))
       WriteSave.append(str(u))
       WriteSave.append(str(x))
       for WriteStates in WriteSave:
        FILE.write(WriteStates + "\n")
       FILE.close()
      PassAmount += 1
      Timer = int(round(float(time.time() - StartTime)))
      Speed = PassAmount / Timer
      NewShowWord = ShowWord[x]
      NewPassWd = PassWd[x] 
      timeup += 1
      if timeup == sleep_now:
       time.sleep(sleep_for)
       timeup = 0
      print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
      cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
      output = cmd.read()
      if test == None:
       print output
      elif output.__contains__(test):
       print "[PASSWORD FOUND]: ", NewShowWord
       sys.exit(0)
      else:
       print output

def BF2():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for x in range(StateW, WordCount):
       if SaveSwitch is True:
        WriteSave = []
        FILE = open(save, 'w')
        WriteSave.append(str(option.cmd))
        WriteSave.append(str(dictionary))
        WriteSave.append(str(MixCustom))
        WriteSave.append(str(Custom))
        WriteSave.append(str(ExhSwitch))
        WriteSave.append(str(StdoutSwitch))
        WriteSave.append(str(usernames))
        WriteSave.append(str(UserSwitch))
        WriteSave.append(str(AlphaSwitch))
        WriteSave.append(str(BWSwitch))
        WriteSave.append(str(CapsSwitch))
        WriteSave.append(str(L337Switch))
        WriteSave.append(str(MD5Switch))
        WriteSave.append(str(NumberSwitch))
        WriteSave.append(str(RegularSwitch))
        WriteSave.append(str(SpecialSwitch))
        WriteSave.append(str(Letters))
        WriteSave.append(str(Numbers))
        WriteSave.append(str(Specials))
        WriteSave.append(str(wep5))
        WriteSave.append(str(wep13))
        WriteSave.append(str(SESwitch))
        WriteSave.append(str(u))
        WriteSave.append(str(x))
        WriteSave.append(str(a))
        for WriteStates in WriteSave:
         FILE.write(WriteStates + "\n")
        FILE.close()
       PassAmount += 1
       Timer = int(round(float(time.time() - StartTime)))
       Speed = PassAmount / Timer
       NewShowWord = Char1[a] + ShowWord[x]
       NewPassWd = Char2[a] + PassWd[x]
       timeup += 1
       if timeup == sleep_now:
        time.sleep(sleep_for)
        timeup = 0
       print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
       cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
       output = cmd.read()
       if test == None:
        print output
       elif output.__contains__(test):
        print "[PASSWORD FOUND]: ", NewShowWord
        sys.exit(0)
       else:
        print output

       if ExhSwitch is False:
        PassAmount += 1
        Timer = int(round(float(time.time() - StartTime)))
        Speed = PassAmount / Timer
        NewShowWord = ShowWord[x] + Char1[a]
        NewPassWd = PassWd[x] + Char2[a]
        timeup += 1
        if timeup == sleep_now:
         time.sleep(sleep_for)
         timeup = 0
        print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
        cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
        output = cmd.read()
        if test == None:
         print output
        elif output.__contains__(test):
         print "[PASSWORD FOUND]: ", NewShowWord
         sys.exit(0)
        else:
         print output

def BF3():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for x in range(StateW, WordCount):
        if SaveSwitch is True:
         WriteSave = []
         FILE = open(save, 'w')
         WriteSave.append(str(option.cmd))
         WriteSave.append(str(dictionary))
         WriteSave.append(str(MixCustom))
         WriteSave.append(str(Custom))
         WriteSave.append(str(ExhSwitch))
         WriteSave.append(str(StdoutSwitch))
         WriteSave.append(str(usernames))
         WriteSave.append(str(UserSwitch))
         WriteSave.append(str(AlphaSwitch))
         WriteSave.append(str(BWSwitch))
         WriteSave.append(str(CapsSwitch))
         WriteSave.append(str(L337Switch))
         WriteSave.append(str(MD5Switch))
         WriteSave.append(str(NumberSwitch))
         WriteSave.append(str(RegularSwitch))
         WriteSave.append(str(SpecialSwitch))
         WriteSave.append(str(Letters))
         WriteSave.append(str(Numbers))
         WriteSave.append(str(Specials))
         WriteSave.append(str(wep5))
         WriteSave.append(str(wep13))
         WriteSave.append(str(SESwitch))
         WriteSave.append(str(u))
         WriteSave.append(str(x))
         WriteSave.append(str(a))
         WriteSave.append(str(b))
         for WriteStates in WriteSave:
          FILE.write(WriteStates + "\n")
         FILE.close()
        PassAmount += 1
        Timer = int(round(float(time.time() - StartTime)))
        Speed = PassAmount / Timer
        NewShowWord = Char1[a] + ShowWord[x] + Char1[b]
        NewPassWd = Char2[a] + PassWd[x] + Char2[b]
        timeup += 1
        if timeup == sleep_now:
         time.sleep(sleep_for)
         timeup = 0
        print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
        cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
        output = cmd.read()
        if test == None:
         print output
        elif output.__contains__(test):
         print "[PASSWORD FOUND]: ", NewShowWord
         sys.exit(0)
        else:
         print output

        if ExhSwitch is False:
         PassAmount += 1
         Timer = int(round(float(time.time() - StartTime)))
         Speed = PassAmount / Timer
         NewShowWord = Char1[a] + Char1[b] + ShowWord[x]
         NewPassWd = Char2[a] + Char2[b] + PassWd[x]
         timeup += 1
         if timeup == sleep_now:
          time.sleep(sleep_for)
          timeup = 0
         print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
         cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
         output = cmd.read()
         if test == None:
          print output
         elif output.__contains__(test):
          print "[PASSWORD FOUND]: ", NewShowWord
          sys.exit(0)
         else:
          print output

         PassAmount += 1
         Timer = int(round(float(time.time() - StartTime)))
         Speed = PassAmount / Timer
         NewShowWord = ShowWord[x] + Char1[b] + Char1[a]
         NewPassWd = PassWd[x] + Char2[b] + Char2[a]
         timeup += 1
         if timeup == sleep_now:
          time.sleep(sleep_for)
          timeup = 0
         print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
         cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
         output = cmd.read()
         if test == None:
          print output
         elif output.__contains__(test):
          print "[PASSWORD FOUND]: ", NewShowWord
          sys.exit(0)
         else:
          print output

def BF4():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for x in range(StateW, WordCount):
         if SaveSwitch is True:
          WriteSave = []
          FILE = open(save, 'w')
          WriteSave.append(str(option.cmd))
          WriteSave.append(str(dictionary))
          WriteSave.append(str(MixCustom))
          WriteSave.append(str(Custom))
          WriteSave.append(str(ExhSwitch))
          WriteSave.append(str(StdoutSwitch))
          WriteSave.append(str(usernames))
          WriteSave.append(str(UserSwitch))
          WriteSave.append(str(AlphaSwitch))
          WriteSave.append(str(BWSwitch))
          WriteSave.append(str(CapsSwitch))
          WriteSave.append(str(L337Switch))
          WriteSave.append(str(MD5Switch))
          WriteSave.append(str(NumberSwitch))
          WriteSave.append(str(RegularSwitch))
          WriteSave.append(str(SpecialSwitch))
          WriteSave.append(str(Letters))
          WriteSave.append(str(Numbers))
          WriteSave.append(str(Specials))
          WriteSave.append(str(wep5))
          WriteSave.append(str(wep13))
          WriteSave.append(str(SESwitch))
          WriteSave.append(str(u))
          WriteSave.append(str(x))
          WriteSave.append(str(a))
          WriteSave.append(str(b))
          WriteSave.append(str(c))
          for WriteStates in WriteSave:
           FILE.write(WriteStates + "\n")
          FILE.close()
         PassAmount += 1
         Timer = int(round(float(time.time() - StartTime)))
         Speed = PassAmount / Timer
         NewShowWord = Char1[c] + Char1[a] + ShowWord[x] + Char1[b]
         NewPassWd = Char2[c] + Char2[a] + PassWd[x] + Char2[b]
         timeup += 1
         if timeup == sleep_now:
          time.sleep(sleep_for)
          timeup = 0
         print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
         cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
         output = cmd.read()
         if test == None:
          print output
         elif output.__contains__(test):
          print "[PASSWORD FOUND]: ", NewShowWord
          sys.exit(0)
         else:
          print output

         if ExhSwitch is False:
          PassAmount += 1
          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = Char1[b] + ShowWord[x] + Char1[a] + Char1[c]
          NewPassWd = Char2[b] + PassWd[x] + Char2[a] + Char2[c]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
          cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
          output = cmd.read()
          if test == None:
           print output
          elif output.__contains__(test):
           print "[PASSWORD FOUND]: ", NewShowWord
           sys.exit(0)
          else:
           print output

          PassAmount += 1
          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = Char1[c] + Char1[a] + Char1[b] + ShowWord[x]
          NewPassWd = Char2[c] + Char2[a] + Char2[b] + PassWd[x]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
          cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
          output = cmd.read()
          if test == None:
           print output
          elif output.__contains__(test):
           print "[PASSWORD FOUND]: ", NewShowWord
           sys.exit(0)
          else:
           print output

          PassAmount += 1
          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = ShowWord[x] + Char1[b] + Char1[a] + Char1[c]
          NewPassWd = PassWd[x] + Char2[b] + Char2[a] + Char2[c]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
          cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
          output = cmd.read()
          if test == None:
           print output
          elif output.__contains__(test):
           print "[PASSWORD FOUND]: ", NewShowWord
           sys.exit(0)
          else:
           print output

def BF5():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for x in range(StateW, WordCount):
          if SaveSwitch is True:
           WriteSave = []
           FILE = open(save, 'w')
           WriteSave.append(str(option.cmd))
           WriteSave.append(str(dictionary))
           WriteSave.append(str(MixCustom))
           WriteSave.append(str(Custom))
           WriteSave.append(str(ExhSwitch))
           WriteSave.append(str(StdoutSwitch))
           WriteSave.append(str(usernames))
           WriteSave.append(str(UserSwitch))
           WriteSave.append(str(AlphaSwitch))
           WriteSave.append(str(BWSwitch))
           WriteSave.append(str(CapsSwitch))
           WriteSave.append(str(L337Switch))
           WriteSave.append(str(MD5Switch))
           WriteSave.append(str(NumberSwitch))
           WriteSave.append(str(RegularSwitch))
           WriteSave.append(str(SpecialSwitch))
           WriteSave.append(str(Letters))
           WriteSave.append(str(Numbers))
           WriteSave.append(str(Specials))
           WriteSave.append(str(wep5))
           WriteSave.append(str(wep13))
           WriteSave.append(str(SESwitch))
           WriteSave.append(str(u))
           WriteSave.append(str(x))
           WriteSave.append(str(a))
           WriteSave.append(str(b))
           WriteSave.append(str(c))
           WriteSave.append(str(d))
           for WriteStates in WriteSave:
            FILE.write(WriteStates + "\n")
           FILE.close()
          PassAmount += 1
          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d]
          NewPassWd = Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
          cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
          output = cmd.read()
          if test == None:
           print output
          elif output.__contains__(test):
           print "[PASSWORD FOUND]: ", NewShowWord
           sys.exit(0)
          else:
           print output

          if ExhSwitch is False:
           PassAmount += 1
           Timer = int(round(float(time.time() - StartTime)))
           Speed = PassAmount / Timer
           NewShowWord = Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
           NewPassWd = Char2[c] + Char2[a] + Char2[b] + Char2[d] + PassWd[x]
           timeup += 1
           if timeup == sleep_now:
            time.sleep(sleep_for)
            timeup = 0
           print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
           cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
           output = cmd.read()
           if test == None:
            print output
           elif output.__contains__(test):
            print "[PASSWORD FOUND]: ", NewShowWord
            sys.exit(0)
           else:
            print output

           PassAmount += 1
           Timer = int(round(float(time.time() - StartTime)))
           Speed = PassAmount / Timer
           NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c]
           NewPassWd = PassWd[x] + Char2[d] + Char2[b] + Char2[a] + Char2[c]
           timeup += 1
           if timeup == sleep_now:
            time.sleep(sleep_for)
            timeup = 0
           print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
           cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
           output = cmd.read()
           if test == None:
            print output
           elif output.__contains__(test):
            print "[PASSWORD FOUND]: ", NewShowWord
            sys.exit(0)
           else:
            print output

def BF6():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for x in range(StateW, WordCount):
           if SaveSwitch is True:
            WriteSave = []
            FILE = open(save, 'w')
            WriteSave.append(str(option.cmd))
            WriteSave.append(str(dictionary))
            WriteSave.append(str(MixCustom))
            WriteSave.append(str(Custom))
            WriteSave.append(str(ExhSwitch))
            WriteSave.append(str(StdoutSwitch))
            WriteSave.append(str(usernames))
            WriteSave.append(str(UserSwitch))
            WriteSave.append(str(AlphaSwitch))
            WriteSave.append(str(BWSwitch))
            WriteSave.append(str(CapsSwitch))
            WriteSave.append(str(L337Switch))
            WriteSave.append(str(MD5Switch))
            WriteSave.append(str(NumberSwitch))
            WriteSave.append(str(RegularSwitch))
            WriteSave.append(str(SpecialSwitch))
            WriteSave.append(str(Letters))
            WriteSave.append(str(Numbers))
            WriteSave.append(str(Specials))
            WriteSave.append(str(wep5))
            WriteSave.append(str(wep13))
            WriteSave.append(str(SESwitch))
            WriteSave.append(str(u))
            WriteSave.append(str(x))
            WriteSave.append(str(a))
            WriteSave.append(str(b))
            WriteSave.append(str(c))
            WriteSave.append(str(d))
            WriteSave.append(str(e))
            for WriteStates in WriteSave:
             FILE.write(WriteStates + "\n")
            FILE.close()
           PassAmount += 1
           Timer = int(round(float(time.time() - StartTime)))
           Speed = PassAmount / Timer
           NewShowWord = Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d]
           NewPassWd = Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d]
           timeup += 1
           if timeup == sleep_now:
            time.sleep(sleep_for)
            timeup = 0
           print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
           cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
           output = cmd.read()
           if test == None:
            print output
           elif output.__contains__(test):
            print "[PASSWORD FOUND]: ", NewShowWord
            sys.exit(0)
           else:
            print output

           if ExhSwitch is False:
            PassAmount += 1
            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e]
            NewPassWd = Char2[d] + Char2[b] + PassWd[x] + Char2[a] + Char2[c] + Char2[e]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
            cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
            output = cmd.read()
            if test == None:
             print output
            elif output.__contains__(test):
             print "[PASSWORD FOUND]: ", NewShowWord
             sys.exit(0)
            else:
             print output

            PassAmount += 1
            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
            NewPassWd = Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + PassWd[x]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
            cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
            output = cmd.read()
            if test == None:
             print output
            elif output.__contains__(test):
             print "[PASSWORD FOUND]: ", NewShowWord
             sys.exit(0)
            else:
             print output

            PassAmount += 1
            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
            NewPassWd = PassWd[x] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
            cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
            output = cmd.read()
            if test == None:
             print output
            elif output.__contains__(test):
             print "[PASSWORD FOUND]: ", NewShowWord
             sys.exit(0)
            else:
             print output

def BF7():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for x in range(StateW, WordCount):
            if SaveSwitch is True:
             WriteSave = []
             FILE = open(save, 'w')
             WriteSave.append(str(option.cmd))
             WriteSave.append(str(dictionary))
             WriteSave.append(str(MixCustom))
             WriteSave.append(str(Custom))
             WriteSave.append(str(ExhSwitch))
             WriteSave.append(str(StdoutSwitch))
             WriteSave.append(str(usernames))
             WriteSave.append(str(UserSwitch))
             WriteSave.append(str(AlphaSwitch))
             WriteSave.append(str(BWSwitch))
             WriteSave.append(str(CapsSwitch))
             WriteSave.append(str(L337Switch))
             WriteSave.append(str(MD5Switch))
             WriteSave.append(str(NumberSwitch))
             WriteSave.append(str(RegularSwitch))
             WriteSave.append(str(SpecialSwitch))
             WriteSave.append(str(Letters))
             WriteSave.append(str(Numbers))
             WriteSave.append(str(Specials))
             WriteSave.append(str(wep5))
             WriteSave.append(str(wep13))
             WriteSave.append(str(SESwitch))
             WriteSave.append(str(u))
             WriteSave.append(str(x))
             WriteSave.append(str(a))
             WriteSave.append(str(b))
             WriteSave.append(str(c))
             WriteSave.append(str(d))
             WriteSave.append(str(e))
             WriteSave.append(str(f))
             for WriteStates in WriteSave:
              FILE.write(WriteStates + "\n")
             FILE.close()
            PassAmount += 1
            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f]
            NewPassWd = Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
            cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
            output = cmd.read()
            if test == None:
             print output
            elif output.__contains__(test):
             print "[PASSWORD FOUND]: ", NewShowWord
             sys.exit(0)
            else:
             print output

            if ExhSwitch is False:
             PassAmount += 1
             Timer = int(round(float(time.time() - StartTime)))
             Speed = PassAmount / Timer
             NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
             NewPassWd = Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + PassWd[x]
             timeup += 1
             if timeup == sleep_now:
              time.sleep(sleep_for)
              timeup = 0
             print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
             cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
             output = cmd.read()
             if test == None:
              print output
             elif output.__contains__(test):
              print "[PASSWORD FOUND]: ", NewShowWord
              sys.exit(0)
             else:
              print output

             PassAmount += 1
             Timer = int(round(float(time.time() - StartTime)))
             Speed = PassAmount / Timer
             NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
             NewPassWd = PassWd[x] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e]
             timeup += 1
             if timeup == sleep_now:
              time.sleep(sleep_for)
              timeup = 0
             print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
             cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
             output = cmd.read()
             if test == None:
              print output
             elif output.__contains__(test):
              print "[PASSWORD FOUND]: ", NewShowWord
              sys.exit(0)
             else:
              print output

def BF8():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for x in range(StateW, WordCount):
             if SaveSwitch is True:
              WriteSave = []
              FILE = open(save, 'w')
              WriteSave.append(str(option.cmd))
              WriteSave.append(str(dictionary))
              WriteSave.append(str(MixCustom))
              WriteSave.append(str(Custom))
              WriteSave.append(str(ExhSwitch))
              WriteSave.append(str(StdoutSwitch))
              WriteSave.append(str(usernames))
              WriteSave.append(str(UserSwitch))
              WriteSave.append(str(AlphaSwitch))
              WriteSave.append(str(BWSwitch))
              WriteSave.append(str(CapsSwitch))
              WriteSave.append(str(L337Switch))
              WriteSave.append(str(MD5Switch))
              WriteSave.append(str(NumberSwitch))
              WriteSave.append(str(RegularSwitch))
              WriteSave.append(str(SpecialSwitch))
              WriteSave.append(str(Letters))
              WriteSave.append(str(Numbers))
              WriteSave.append(str(Specials))
              WriteSave.append(str(wep5))
              WriteSave.append(str(wep13))
              WriteSave.append(str(SESwitch))
              WriteSave.append(str(u))
              WriteSave.append(str(x))
              WriteSave.append(str(a))
              WriteSave.append(str(b))
              WriteSave.append(str(c))
              WriteSave.append(str(d))
              WriteSave.append(str(e))
              WriteSave.append(str(f))
              WriteSave.append(str(g))
              for WriteStates in WriteSave:
               FILE.write(WriteStates + "\n")
              FILE.close()
             PassAmount += 1
             Timer = int(round(float(time.time() - StartTime)))
             Speed = PassAmount / Timer
             NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f]
             NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f]
             timeup += 1
             if timeup == sleep_now:
              time.sleep(sleep_for)
              timeup = 0
             print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
             cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
             output = cmd.read()
             if test == None:
              print output
             elif output.__contains__(test):
              print "[PASSWORD FOUND]: ", NewShowWord
              sys.exit(0)
             else:
              print output

             if ExhSwitch is False:
              PassAmount += 1
              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              NewPassWd = Char2[f] + Char2[d] + Char2[b] + PassWd[x] + Char2[a] + Char2[c] + Char2[e] + Char2[g]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
              cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
              output = cmd.read()
              if test == None:
               print output
              elif output.__contains__(test):
               print "[PASSWORD FOUND]: ", NewShowWord
               sys.exit(0)
              else:
               print output

              PassAmount += 1
              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
              NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + PassWd[x]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
              cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
              output = cmd.read()
              if test == None:
               print output
              elif output.__contains__(test):
               print "[PASSWORD FOUND]: ", NewShowWord
               sys.exit(0)
              else:
               print output

              PassAmount += 1
              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              NewPassWd = PassWd[x] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
              cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
              output = cmd.read()
              if test == None:
               print output
              elif output.__contains__(test):
               print "[PASSWORD FOUND]: ", NewShowWord
               sys.exit(0)
              else:
               print output

def BF9():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for h in range(StateH, EndCount):
             for x in range(StateW, WordCount):
              if SaveSwitch is True:
               WriteSave = []
               FILE = open(save, 'w')
               WriteSave.append(str(option.cmd))
               WriteSave.append(str(dictionary))
               WriteSave.append(str(MixCustom))
               WriteSave.append(str(Custom))
               WriteSave.append(str(ExhSwitch))
               WriteSave.append(str(StdoutSwitch))
               WriteSave.append(str(usernames))
               WriteSave.append(str(UserSwitch))
               WriteSave.append(str(AlphaSwitch))
               WriteSave.append(str(BWSwitch))
               WriteSave.append(str(CapsSwitch))
               WriteSave.append(str(L337Switch))
               WriteSave.append(str(MD5Switch))
               WriteSave.append(str(NumberSwitch))
               WriteSave.append(str(RegularSwitch))
               WriteSave.append(str(SpecialSwitch))
               WriteSave.append(str(Letters))
               WriteSave.append(str(Numbers))
               WriteSave.append(str(Specials))
               WriteSave.append(str(wep5))
               WriteSave.append(str(wep13))
               WriteSave.append(str(SESwitch))
               WriteSave.append(str(u))
               WriteSave.append(str(x))
               WriteSave.append(str(a))
               WriteSave.append(str(b))
               WriteSave.append(str(c))
               WriteSave.append(str(d))
               WriteSave.append(str(e))
               WriteSave.append(str(f))
               WriteSave.append(str(g))
               WriteSave.append(str(h))
               for WriteStates in WriteSave:
                FILE.write(WriteStates + "\n")
               FILE.close()
              PassAmount += 1
              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h]
              NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
              cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
              output = cmd.read()
              if test == None:
               print output
              elif output.__contains__(test):
               print "[PASSWORD FOUND]: ", NewShowWord
               sys.exit(0)
              else:
               print output

              if ExhSwitch is False:
               PassAmount += 1
               Timer = int(round(float(time.time() - StartTime)))
               Speed = PassAmount / Timer
               NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] +Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
               NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + PassWd[x]
               timeup += 1
               if timeup == sleep_now:
                time.sleep(sleep_for)
                timeup = 0
               print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
               cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
               output = cmd.read()
               if test == None:
                print output
               elif output.__contains__(test):
                print "[PASSWORD FOUND]: ", NewShowWord
                sys.exit(0)
               else:
                print output

               PassAmount += 1
               Timer = int(round(float(time.time() - StartTime)))
               Speed = PassAmount / Timer
               NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
               NewPassWd = PassWd[x] + Char2[h] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g]
               timeup += 1
               if timeup == sleep_now:
                time.sleep(sleep_for)
                timeup = 0
               print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
               cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
               output = cmd.read()
               if test == None:
                print output
               elif output.__contains__(test):
                print "[PASSWORD FOUND]: ", NewShowWord
                sys.exit(0)
               else:
                print output

def BF10():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for h in range(StateH, EndCount):
             for i in range(StateI, EndCount):
              for x in range(StateW, WordCount):
               if SaveSwitch is True:
                WriteSave = []
                FILE = open(save, 'w')
                WriteSave.append(str(option.cmd))
                WriteSave.append(str(dictionary))
                WriteSave.append(str(MixCustom))
                WriteSave.append(str(Custom))
                WriteSave.append(str(ExhSwitch))
                WriteSave.append(str(StdoutSwitch))
                WriteSave.append(str(usernames))
                WriteSave.append(str(UserSwitch))
                WriteSave.append(str(AlphaSwitch))
                WriteSave.append(str(BWSwitch))
                WriteSave.append(str(CapsSwitch))
                WriteSave.append(str(L337Switch))
                WriteSave.append(str(MD5Switch))
                WriteSave.append(str(NumberSwitch))
                WriteSave.append(str(RegularSwitch))
                WriteSave.append(str(SpecialSwitch))
                WriteSave.append(str(Letters))
                WriteSave.append(str(Numbers))
                WriteSave.append(str(Specials))
                WriteSave.append(str(wep5))
                WriteSave.append(str(wep13))
                WriteSave.append(str(SESwitch))
                WriteSave.append(str(u))
                WriteSave.append(str(x))
                WriteSave.append(str(a))
                WriteSave.append(str(b))
                WriteSave.append(str(c))
                WriteSave.append(str(d))
                WriteSave.append(str(e))
                WriteSave.append(str(f))
                WriteSave.append(str(g))
                WriteSave.append(str(h))
                WriteSave.append(str(i))
                for WriteStates in WriteSave:
                 FILE.write(WriteStates + "\n")
                FILE.close()
               PassAmount += 1
               Timer = int(round(float(time.time() - StartTime)))
               Speed = PassAmount / Timer
               NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h]
               NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h]
               timeup += 1
               if timeup == sleep_now:
                time.sleep(sleep_for)
                timeup = 0
               print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
               cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
               output = cmd.read()
               if test == None:
                print output
               elif output.__contains__(test):
                print "[PASSWORD FOUND]: ", NewShowWord
                sys.exit(0)
               else:
                print output

               if ExhSwitch is False:
                PassAmount += 1
                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = Char1[h] + Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                NewPassWd = Char2[h] + Char2[f] + Char2[d] + Char2[b] + PassWd[x] + Char2[a] + Char2[c] + Char2[e] + Char2[g] + Char2[i]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
                cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
                output = cmd.read()
                if test == None:
                 print output
                elif output.__contains__(test):
                 print "[PASSWORD FOUND]: ", NewShowWord
                 sys.exit(0)
                else:
                 print output

                PassAmount += 1
                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
                NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + PassWd[x]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
                cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
                output = cmd.read()
                if test == None:
                 print output
                elif output.__contains__(test):
                 print "[PASSWORD FOUND]: ", NewShowWord
                 sys.exit(0)
                else:
                 print output

                PassAmount += 1
                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                NewPassWd = PassWd[x] + Char2[h] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g] + Char2[i]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
                cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
                output = cmd.read()
                if test == None:
                 print output
                elif output.__contains__(test):
                 print "[PASSWORD FOUND]: ", NewShowWord
                 sys.exit(0)
                else:
                 print output

def BF11():
    if option.NoChar is True:
     sys.exit('splice3: unable to find password')
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    StartTime = time.time()
    StartTime = StartTime - 1
    PassAmount = 0
    timeup = 0
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for h in range(StateH, EndCount):
             for i in range(StateI, EndCount):
              for j in range(StateJ, EndCount):
               for x in range(StateW, WordCount):
                if SaveSwitch is True:
                 WriteSave = []
                 FILE = open(save, 'w')
                 WriteSave.append(str(option.cmd))
                 WriteSave.append(str(dictionary))
                 WriteSave.append(str(MixCustom))
                 WriteSave.append(str(Custom))
                 WriteSave.append(str(ExhSwitch))
                 WriteSave.append(str(StdoutSwitch))
                 WriteSave.append(str(usernames))
                 WriteSave.append(str(UserSwitch))
                 WriteSave.append(str(AlphaSwitch))
                 WriteSave.append(str(BWSwitch))
                 WriteSave.append(str(CapsSwitch))
                 WriteSave.append(str(L337Switch))
                 WriteSave.append(str(MD5Switch))
                 WriteSave.append(str(NumberSwitch))
                 WriteSave.append(str(RegularSwitch))
                 WriteSave.append(str(SpecialSwitch))
                 WriteSave.append(str(Letters))
                 WriteSave.append(str(Numbers))
                 WriteSave.append(str(Specials))
                 WriteSave.append(str(wep5))
                 WriteSave.append(str(wep13))
                 WriteSave.append(str(SESwitch))              
                 WriteSave.append(str(u))
                 WriteSave.append(str(x))
                 WriteSave.append(str(a))
                 WriteSave.append(str(b))
                 WriteSave.append(str(c))
                 WriteSave.append(str(d))
                 WriteSave.append(str(e))
                 WriteSave.append(str(f))
                 WriteSave.append(str(g))
                 WriteSave.append(str(h))
                 WriteSave.append(str(i))
                 WriteSave.append(str(j))
                 for WriteStates in WriteSave:
                  FILE.write(WriteStates + "\n")
                 FILE.close()
                PassAmount += 1
                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j]
                NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + Char2[j]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
                cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
                output = cmd.read()
                if test == None:
                 print output
                elif output.__contains__(test):
                 print "[PASSWORD FOUND]: ", NewShowWord
                 sys.exit(0)
                else:
                 print output

                if ExhSwitch is False:
                 PassAmount += 1
                 Timer = int(round(float(time.time() - StartTime)))
                 Speed = PassAmount / Timer
                 NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j] + ShowWord[x] 
                 NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + Char2[j] + PassWd[x]
                 timeup += 1
                 if timeup == sleep_now:
                  time.sleep(sleep_for)
                  timeup = 0
                 print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
                 cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
                 output = cmd.read()
                 if test == None:
                  print output
                 elif output.__contains__(test):
                  print "[PASSWORD FOUND]: ", NewShowWord
                  sys.exit(0)
                 else:
                  print output

                 PassAmount += 1
                 Timer = int(round(float(time.time() - StartTime)))
                 Speed = PassAmount / Timer
                 NewShowWord = ShowWord[x] + Char1[j] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                 NewPassWd = PassWd[x] + Char2[j] + Char2[h] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g] + Char2[i]
                 timeup += 1
                 if timeup == sleep_now:
                  time.sleep(sleep_for)
                  timeup = 0
                 print "[splice3]:", Speed,"/s", User[u].replace(" ", ""), NewShowWord.replace(" ", "")
                 cmd = os.popen(option.cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", "")))
                 output = cmd.read()
                 if test == None:
                  print output
                 elif output.__contains__(test):
                  print "[PASSWORD FOUND]: ", NewShowWord
                  sys.exit(0)
                 else:
                  print output

def SBF1():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    for u in range(StateU, UserCount):
     for x in range(StateW, WordCount):
      if SaveSwitch is True:
       WriteSave = []
       FILE = open(save, 'w')
       WriteSave.append(str(option.cmd))
       WriteSave.append(str(dictionary))
       WriteSave.append(str(MixCustom))
       WriteSave.append(str(Custom))
       WriteSave.append(str(ExhSwitch))
       WriteSave.append(str(StdoutSwitch))
       WriteSave.append(str(usernames))
       WriteSave.append(str(UserSwitch))
       WriteSave.append(str(AlphaSwitch))
       WriteSave.append(str(BWSwitch))
       WriteSave.append(str(CapsSwitch))
       WriteSave.append(str(L337Switch))
       WriteSave.append(str(MD5Switch))
       WriteSave.append(str(NumberSwitch))
       WriteSave.append(str(RegularSwitch))
       WriteSave.append(str(SpecialSwitch))
       WriteSave.append(str(Letters))
       WriteSave.append(str(Numbers))
       WriteSave.append(str(Specials))
       WriteSave.append(str(wep5))
       WriteSave.append(str(wep13))
       WriteSave.append(str(SESwitch))
       WriteSave.append(str(u))
       WriteSave.append(str(x))
       for WriteStates in WriteSave:
        FILE.write(WriteStates + "\n")
       FILE.close()
      NewShowWord = ShowWord[x]
      print NewShowWord.replace(" ", "")

def SBF2():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for x in range(StateW, WordCount):
       if SaveSwitch is True:
        WriteSave = []
        FILE = open(save, 'w')
        WriteSave.append(str(option.cmd))
        WriteSave.append(str(dictionary))
        WriteSave.append(str(MixCustom))
        WriteSave.append(str(Custom))
        WriteSave.append(str(ExhSwitch))
        WriteSave.append(str(StdoutSwitch))
        WriteSave.append(str(usernames))
        WriteSave.append(str(UserSwitch))
        WriteSave.append(str(AlphaSwitch))
        WriteSave.append(str(BWSwitch))
        WriteSave.append(str(CapsSwitch))
        WriteSave.append(str(L337Switch))
        WriteSave.append(str(MD5Switch))
        WriteSave.append(str(NumberSwitch))
        WriteSave.append(str(RegularSwitch))
        WriteSave.append(str(SpecialSwitch))
        WriteSave.append(str(Letters))
        WriteSave.append(str(Numbers))
        WriteSave.append(str(Specials))
        WriteSave.append(str(wep5))
        WriteSave.append(str(wep13))
        WriteSave.append(str(SESwitch))
        WriteSave.append(str(u))
        WriteSave.append(str(x))
        WriteSave.append(str(a))
        for WriteStates in WriteSave:
         FILE.write(WriteStates + "\n")
        FILE.close()
       NewShowWord = Char1[a] + ShowWord[x]
       print NewShowWord.replace(" ", "")

       if ExhSwitch is False:
        NewShowWord = ShowWord[x] + Char1[a]
        print NewShowWord.replace(" ", "")

def SBF3():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for x in range(StateW, WordCount):
        if SaveSwitch is True:
         WriteSave = []
         FILE = open(save, 'w')
         WriteSave.append(str(option.cmd))
         WriteSave.append(str(dictionary))
         WriteSave.append(str(MixCustom))
         WriteSave.append(str(Custom))
         WriteSave.append(str(ExhSwitch))
         WriteSave.append(str(StdoutSwitch))
         WriteSave.append(str(usernames))
         WriteSave.append(str(UserSwitch))
         WriteSave.append(str(AlphaSwitch))
         WriteSave.append(str(BWSwitch))
         WriteSave.append(str(CapsSwitch))
         WriteSave.append(str(L337Switch))
         WriteSave.append(str(MD5Switch))
         WriteSave.append(str(NumberSwitch))
         WriteSave.append(str(RegularSwitch))
         WriteSave.append(str(SpecialSwitch))
         WriteSave.append(str(Letters))
         WriteSave.append(str(Numbers))
         WriteSave.append(str(Specials))
         WriteSave.append(str(wep5))
         WriteSave.append(str(wep13))
         WriteSave.append(str(SESwitch))
         WriteSave.append(str(u))
         WriteSave.append(str(x))
         WriteSave.append(str(a))
         WriteSave.append(str(b))
         for WriteStates in WriteSave:
          FILE.write(WriteStates + "\n")
         FILE.close()
        NewShowWord = Char1[a] + ShowWord[x] + Char1[b]
        print NewShowWord.replace(" ", "")

        if ExhSwitch is False:
         NewShowWord = Char1[a] + Char1[b] + ShowWord[x]
         print NewShowWord.replace(" ", "")

         NewShowWord = ShowWord[x] + Char1[b] + Char1[a]
         print NewShowWord.replace(" ", "")

def SBF4():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for x in range(StateW, WordCount):
         if SaveSwitch is True:
          WriteSave = []
          FILE = open(save, 'w')
          WriteSave.append(str(option.cmd))
          WriteSave.append(str(dictionary))
          WriteSave.append(str(MixCustom))
          WriteSave.append(str(Custom))
          WriteSave.append(str(ExhSwitch))
          WriteSave.append(str(StdoutSwitch))
          WriteSave.append(str(usernames))
          WriteSave.append(str(UserSwitch))
          WriteSave.append(str(AlphaSwitch))
          WriteSave.append(str(BWSwitch))
          WriteSave.append(str(CapsSwitch))
          WriteSave.append(str(L337Switch))
          WriteSave.append(str(MD5Switch))
          WriteSave.append(str(NumberSwitch))
          WriteSave.append(str(RegularSwitch))
          WriteSave.append(str(SpecialSwitch))
          WriteSave.append(str(Letters))
          WriteSave.append(str(Numbers))
          WriteSave.append(str(Specials))
          WriteSave.append(str(wep5))
          WriteSave.append(str(wep13))
          WriteSave.append(str(SESwitch))
          WriteSave.append(str(u))
          WriteSave.append(str(x))
          WriteSave.append(str(a))
          WriteSave.append(str(b))
          WriteSave.append(str(c))
          for WriteStates in WriteSave:
           FILE.write(WriteStates + "\n")
          FILE.close()
         NewShowWord = Char1[c] + Char1[a] + ShowWord[x] + Char1[b]
         print NewShowWord.replace(" ", "")

         if ExhSwitch is False:
          NewShowWord = Char1[b] + ShowWord[x] + Char1[a] + Char1[c]
          print NewShowWord.replace(" ", "")

          NewShowWord = Char1[c] + Char1[a] + Char1[b] + ShowWord[x]
          print NewShowWord.replace(" ", "")

          NewShowWord = ShowWord[x] + Char1[b] + Char1[a] + Char1[c]
          print NewShowWord.replace(" ", "")

def SBF5():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for x in range(StateW, WordCount):
          if SaveSwitch is True:
           WriteSave = []
           FILE = open(save, 'w')
           WriteSave.append(str(option.cmd))
           WriteSave.append(str(dictionary))
           WriteSave.append(str(MixCustom))
           WriteSave.append(str(Custom))
           WriteSave.append(str(ExhSwitch))
           WriteSave.append(str(StdoutSwitch))
           WriteSave.append(str(usernames))
           WriteSave.append(str(UserSwitch))
           WriteSave.append(str(AlphaSwitch))
           WriteSave.append(str(BWSwitch))
           WriteSave.append(str(CapsSwitch))
           WriteSave.append(str(L337Switch))
           WriteSave.append(str(MD5Switch))
           WriteSave.append(str(NumberSwitch))
           WriteSave.append(str(RegularSwitch))
           WriteSave.append(str(SpecialSwitch))
           WriteSave.append(str(Letters))
           WriteSave.append(str(Numbers))
           WriteSave.append(str(Specials))
           WriteSave.append(str(wep5))
           WriteSave.append(str(wep13))
           WriteSave.append(str(SESwitch))
           WriteSave.append(str(u))
           WriteSave.append(str(x))
           WriteSave.append(str(a))
           WriteSave.append(str(b))
           WriteSave.append(str(c))
           WriteSave.append(str(d))
           for WriteStates in WriteSave:
            FILE.write(WriteStates + "\n")
           FILE.close()
          NewShowWord = Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d]
          print NewShowWord.replace(" ", "")

          if ExhSwitch is False:
           NewShowWord = Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
           print NewShowWord.replace(" ", "")

           NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c]
           print NewShowWord.replace(" ", "")

def SBF6():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for x in range(StateW, WordCount):
           if SaveSwitch is True:
            WriteSave = []
            FILE = open(save, 'w')
            WriteSave.append(str(option.cmd))
            WriteSave.append(str(dictionary))
            WriteSave.append(str(MixCustom))
            WriteSave.append(str(Custom))
            WriteSave.append(str(ExhSwitch))
            WriteSave.append(str(StdoutSwitch))
            WriteSave.append(str(usernames))
            WriteSave.append(str(UserSwitch))
            WriteSave.append(str(AlphaSwitch))
            WriteSave.append(str(BWSwitch))
            WriteSave.append(str(CapsSwitch))
            WriteSave.append(str(L337Switch))
            WriteSave.append(str(MD5Switch))
            WriteSave.append(str(NumberSwitch))
            WriteSave.append(str(RegularSwitch))
            WriteSave.append(str(SpecialSwitch))
            WriteSave.append(str(Letters))
            WriteSave.append(str(Numbers))
            WriteSave.append(str(Specials))
            WriteSave.append(str(wep5))
            WriteSave.append(str(wep13))
            WriteSave.append(str(SESwitch))
            WriteSave.append(str(u))
            WriteSave.append(str(x))
            WriteSave.append(str(a))
            WriteSave.append(str(b))
            WriteSave.append(str(c))
            WriteSave.append(str(d))
            WriteSave.append(str(e))
            for WriteStates in WriteSave:
             FILE.write(WriteStates + "\n")
            FILE.close()
           NewShowWord = Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d]
           print NewShowWord.replace(" ", "")

           if ExhSwitch is False:
            NewShowWord = Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e]
            print NewShowWord.replace(" ", "")

            NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
            print NewShowWord.replace(" ", "")

            NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
            print NewShowWord.replace(" ", "")

def SBF7():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for x in range(StateW, WordCount):
            if SaveSwitch is True:
             WriteSave = []
             FILE = open(save, 'w')
             WriteSave.append(str(option.cmd))
             WriteSave.append(str(dictionary))
             WriteSave.append(str(MixCustom))
             WriteSave.append(str(Custom))
             WriteSave.append(str(ExhSwitch))
             WriteSave.append(str(StdoutSwitch))
             WriteSave.append(str(usernames))
             WriteSave.append(str(UserSwitch))
             WriteSave.append(str(AlphaSwitch))
             WriteSave.append(str(BWSwitch))
             WriteSave.append(str(CapsSwitch))
             WriteSave.append(str(L337Switch))
             WriteSave.append(str(MD5Switch))
             WriteSave.append(str(NumberSwitch))
             WriteSave.append(str(RegularSwitch))
             WriteSave.append(str(SpecialSwitch))
             WriteSave.append(str(Letters))
             WriteSave.append(str(Numbers))
             WriteSave.append(str(Specials))
             WriteSave.append(str(wep5))
             WriteSave.append(str(wep13))
             WriteSave.append(str(SESwitch))
             WriteSave.append(str(u))
             WriteSave.append(str(x))
             WriteSave.append(str(a))
             WriteSave.append(str(b))
             WriteSave.append(str(c))
             WriteSave.append(str(d))
             WriteSave.append(str(e))
             WriteSave.append(str(f))
             for WriteStates in WriteSave:
              FILE.write(WriteStates + "\n")
             FILE.close()
            NewShowWord = Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f]
            print NewShowWord.replace(" ", "")

            if ExhSwitch is False:
             NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
             print NewShowWord.replace(" ", "")

             NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
             print NewShowWord.replace(" ", "")

def SBF8():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for x in range(StateW, WordCount):
             if SaveSwitch is True:
              WriteSave = []
              FILE = open(save, 'w')
              WriteSave.append(str(option.cmd))
              WriteSave.append(str(dictionary))
              WriteSave.append(str(MixCustom))
              WriteSave.append(str(Custom))
              WriteSave.append(str(ExhSwitch))
              WriteSave.append(str(StdoutSwitch))
              WriteSave.append(str(usernames))
              WriteSave.append(str(UserSwitch))
              WriteSave.append(str(AlphaSwitch))
              WriteSave.append(str(BWSwitch))
              WriteSave.append(str(CapsSwitch))
              WriteSave.append(str(L337Switch))
              WriteSave.append(str(MD5Switch))
              WriteSave.append(str(NumberSwitch))
              WriteSave.append(str(RegularSwitch))
              WriteSave.append(str(SpecialSwitch))
              WriteSave.append(str(Letters))
              WriteSave.append(str(Numbers))
              WriteSave.append(str(Specials))
              WriteSave.append(str(wep5))
              WriteSave.append(str(wep13))
              WriteSave.append(str(SESwitch))
              WriteSave.append(str(u))
              WriteSave.append(str(x))
              WriteSave.append(str(a))
              WriteSave.append(str(b))
              WriteSave.append(str(c))
              WriteSave.append(str(d))
              WriteSave.append(str(e))
              WriteSave.append(str(f))
              WriteSave.append(str(g))
              for WriteStates in WriteSave:
               FILE.write(WriteStates + "\n")
              FILE.close()
             NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f]
             print NewShowWord.replace(" ", "")

             if ExhSwitch is False:
              NewShowWord = Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              print NewShowWord.replace(" ", "")

              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
              print NewShowWord.replace(" ", "")

              NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              print NewShowWord.replace(" ", "")

def SBF9():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for h in range(StateH, EndCount):
             for x in range(StateW, WordCount):
              if SaveSwitch is True:
               WriteSave = []
               FILE = open(save, 'w')
               WriteSave.append(str(option.cmd))
               WriteSave.append(str(dictionary))
               WriteSave.append(str(MixCustom))
               WriteSave.append(str(Custom))
               WriteSave.append(str(ExhSwitch))
               WriteSave.append(str(StdoutSwitch))
               WriteSave.append(str(usernames))
               WriteSave.append(str(UserSwitch))
               WriteSave.append(str(AlphaSwitch))
               WriteSave.append(str(BWSwitch))
               WriteSave.append(str(CapsSwitch))
               WriteSave.append(str(L337Switch))
               WriteSave.append(str(MD5Switch))
               WriteSave.append(str(NumberSwitch))
               WriteSave.append(str(RegularSwitch))
               WriteSave.append(str(SpecialSwitch))
               WriteSave.append(str(Letters))
               WriteSave.append(str(Numbers))
               WriteSave.append(str(Specials))
               WriteSave.append(str(wep5))
               WriteSave.append(str(wep13))
               WriteSave.append(str(SESwitch))
               WriteSave.append(str(u))
               WriteSave.append(str(x))
               WriteSave.append(str(a))
               WriteSave.append(str(b))
               WriteSave.append(str(c))
               WriteSave.append(str(d))
               WriteSave.append(str(e))
               WriteSave.append(str(f))
               WriteSave.append(str(g))
               WriteSave.append(str(h))
               for WriteStates in WriteSave:
                FILE.write(WriteStates + "\n")
               FILE.close()
              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h]
              print NewShowWord.replace(" ", "")

              if ExhSwitch is False:
               NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] +Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
               print NewShowWord.replace(" ", "")

               NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
               print NewShowWord.replace(" ", "")

def SBF10():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for h in range(StateH, EndCount):
             for i in range(StateI, EndCount):
              for x in range(StateW, WordCount):
               if SaveSwitch is True:
                WriteSave = []
                FILE = open(save, 'w')
                WriteSave.append(str(option.cmd))
                WriteSave.append(str(dictionary))
                WriteSave.append(str(MixCustom))
                WriteSave.append(str(Custom))
                WriteSave.append(str(ExhSwitch))
                WriteSave.append(str(StdoutSwitch))
                WriteSave.append(str(usernames))
                WriteSave.append(str(UserSwitch))
                WriteSave.append(str(AlphaSwitch))
                WriteSave.append(str(BWSwitch))
                WriteSave.append(str(CapsSwitch))
                WriteSave.append(str(L337Switch))
                WriteSave.append(str(MD5Switch))
                WriteSave.append(str(NumberSwitch))
                WriteSave.append(str(RegularSwitch))
                WriteSave.append(str(SpecialSwitch))
                WriteSave.append(str(Letters))
                WriteSave.append(str(Numbers))
                WriteSave.append(str(Specials))
                WriteSave.append(str(wep5))
                WriteSave.append(str(wep13))
                WriteSave.append(str(SESwitch))
                WriteSave.append(str(u))
                WriteSave.append(str(x))
                WriteSave.append(str(a))
                WriteSave.append(str(b))
                WriteSave.append(str(c))
                WriteSave.append(str(d))
                WriteSave.append(str(e))
                WriteSave.append(str(f))
                WriteSave.append(str(g))
                WriteSave.append(str(h))
                WriteSave.append(str(i))
                for WriteStates in WriteSave:
                 FILE.write(WriteStates + "\n")
                FILE.close()
               NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h]
               print NewShowWord.replace(" ", "")

               if ExhSwitch is False:
                NewShowWord = Char1[h] + Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                print NewShowWord.replace(" ", "")

                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
                print NewShowWord.replace(" ", "")

                NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                print NewShowWord.replace(" ", "")

def SBF11():
    WordCount = 0
    for CountWords in ShowWord:
     WordCount += 1
    if option.NoChar is True:
     sys.exit(0)
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for e in range(StateE, EndCount):
          for f in range(StateF, EndCount):
           for g in range(StateG, EndCount):
            for h in range(StateH, EndCount):
             for i in range(StateI, EndCount):
              for j in range(StateJ, EndCount):
               for x in range(StateW, WordCount):
                if SaveSwitch is True:
                 WriteSave = []
                 FILE = open(save, 'w')
                 WriteSave.append(str(option.cmd))
                 WriteSave.append(str(dictionary))
                 WriteSave.append(str(MixCustom))
                 WriteSave.append(str(Custom))
                 WriteSave.append(str(ExhSwitch))
                 WriteSave.append(str(StdoutSwitch))
                 WriteSave.append(str(usernames))
                 WriteSave.append(str(UserSwitch))
                 WriteSave.append(str(AlphaSwitch))
                 WriteSave.append(str(BWSwitch))
                 WriteSave.append(str(CapsSwitch))
                 WriteSave.append(str(L337Switch))
                 WriteSave.append(str(MD5Switch))
                 WriteSave.append(str(NumberSwitch))
                 WriteSave.append(str(RegularSwitch))
                 WriteSave.append(str(SpecialSwitch))
                 WriteSave.append(str(Letters))
                 WriteSave.append(str(Numbers))
                 WriteSave.append(str(Specials))
                 WriteSave.append(str(wep5))
                 WriteSave.append(str(wep13))
                 WriteSave.append(str(SESwitch))
                 WriteSave.append(str(u))
                 WriteSave.append(str(x))
                 WriteSave.append(str(a))
                 WriteSave.append(str(b))
                 WriteSave.append(str(c))
                 WriteSave.append(str(d))
                 WriteSave.append(str(e))
                 WriteSave.append(str(f))
                 WriteSave.append(str(g))
                 WriteSave.append(str(h))
                 WriteSave.append(str(i))
                 WriteSave.append(str(j))
                 for WriteStates in WriteSave:
                  FILE.write(WriteStates + "\n")
                 FILE.close()
                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j]
                print NewShowWord.replace(" ", "")

                if ExhSwitch is False:
                 NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j] + ShowWord[x] 
                 print NewShowWord.replace(" ", "")

                 NewShowWord = ShowWord[x] + Char1[j] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                 print NewShowWord.replace(" ", "")

if Create is True:
 CFILE = open("splice3.create", 'w')
 for WCreate in ShowWord:
  CFILE.write(WCreate + "\n")
 CFILE.close()
 sys.exit(0)

if RestoreSwitch is False:
 StateCount = 0
if RestoreSwitch is False and StdoutSwitch is False:
 StateU = 0
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF1()
 BF2()
 BF3()
 BF4()
 BF5()
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)

if StateCount == 22 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF1()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF2()
 BF3()
 BF4()
 BF5()
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
if StateCount == 21 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF1()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF2()
 BF3()
 BF4()
 BF5()
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 24 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF2()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF3()
 BF4()
 BF5()
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 25 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF3()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF4()
 BF5()
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 26 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF4()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF5()
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 27 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF5()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF6()
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 28 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF6()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF7()
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 29 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF7()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF8()
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 30 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = 0
 StateI = 0
 StateJ = 0
 BF8()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF9()
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 30 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = int(State[31])
 StateI = 0
 StateJ = 0
 BF9()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF10()
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 32 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = int(State[31])
 StateI = int(State[32])
 StateJ = 0
 BF10()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)
elif StateCount == 33 and RestoreSwitch is True and StdoutSwitch is False:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = int(State[31])
 StateI = int(State[32])
 StateJ = int(State[33])
 BF11()
 print "splice3: unable to find password"
 sys.exit(0)

if RestoreSwitch is False and StdoutSwitch is True:
 StateU = 0
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF1()
 SBF2()
 SBF3()
 SBF4()
 SBF5()
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)

if StateCount == 22 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF1()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF2()
 SBF3()
 SBF4()
 SBF5()
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
if StateCount == 23 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF1()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF2()
 SBF3()
 SBF4()
 SBF5()
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 24 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF2()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF3()
 SBF4()
 SBF5()
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 25 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF3()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF4()
 SBF5()
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 25 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF4()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF5()
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 27 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF5()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF6()
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 28 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF6()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF7()
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 29 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF7()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF8()
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 30 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF8()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF9()
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 31 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = int(State[31])
 StateI = 0
 StateJ = 0
 SBF9()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF10()
 SBF11()
 sys.exit(0)
elif StateCount == 32 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = int(State[31])
 StateI = int(State[32])
 StateJ = 0
 SBF10()
 StateW = 0
 StateA = 0
 StateB = 0
 StateC = 0
 StateD = 0
 StateE = 0
 StateF = 0
 StateG = 0
 StateH = 0
 StateI = 0
 StateJ = 0
 SBF11()
 sys.exit(0)
elif StateCount == 33 and RestoreSwitch is True and StdoutSwitch is True:
 StateU = int(State[22])
 StateW = int(State[23])
 StateA = int(State[24])
 StateB = int(State[25])
 StateC = int(State[26])
 StateD = int(State[27])
 StateE = int(State[28])
 StateF = int(State[29])
 StateG = int(State[30])
 StateH = int(State[31])
 StateI = int(State[32])
 StateJ = int(State[33])
 SBF11()
 sys.exit(0)

print "splice3: unknown error: please report bug to author"
sys.exit(1)
