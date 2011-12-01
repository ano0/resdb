#!PYTHON

Red = '\033[1;31m'
Green = '\033[1;32m'
Yellow = '\033[1;33m'
DefColour = '\033[0;0m'
CLEAR_LINE = chr(27) + '[2K'
SpliceX = Red + '[Splice' + Yellow + 'X' + Red + ']: ' + DefColour

def HELP(): 
    print('')
    print(Red + '                __________        _ _         ' + Yellow + '__  __' + Red + '    ______  ' + DefColour)
    print(Red + '               / / / / ___| _ __ | (_) ___ ___' + Yellow + '\ \/ /' + Red + '   / / / /  ' + DefColour)
    print(Red + '              / / / /\___ \| \'_ \| | |/ __/ _ \\' + Yellow + '\\  /' + Red + '   / / / /' + DefColour)
    print(Red + '             / / / /  ___) | |_) | | | (_|  __/' + Yellow + '/  \\' + Red + '  / / / /   ' + DefColour)
    print(Red + '            /_/_/_/  |____/| .__/|_|_|\___\___' + Yellow + '/_/\_\\' + Red + '/_/_/_/    ' + DefColour)
    print(Red + '                           |_|                                                           ' + DefColour)
    print('                                                                                               ' + DefColour)
    print('                                                                                               ' + DefColour)
    print('                                                                                               ' + DefColour)
    print(Yellow + '                 .:Brute Force Utilities For GNU/Linux:.                              ' + DefColour)
    print('')
    print('')
    print('')
    print(Red + '   --help                ' + DefColour + 'Show help display and exit')
    print('')
    print(Red + '   --command             ' + DefColour + 'Parse passwords to this command')
    print('                         '       + Yellow +    'splicex --command=\'<command> PASSWORD\'' + DefColour)
    print('')
    print(Red + '   --dictionary          ' + DefColour + 'Path to custom dictionary(wordlist)')
    print('                         '       + Yellow +    'splicex --dictionary=\'WordList.txt\'' + DefColour)
    print('')
    print(Red + '   --rtfm                ' + DefColour + 'Show manual page and exit')
    print('')
    print(Red + '   --restore             ' + DefColour + 'Path to restore file')
    print('                         '       + Yellow +    'splicex --restore=\'splicex.save\'' + DefColour)
    print('')
    print(Red + '   --save                ' + DefColour + 'Directory path to create save file')
    print('                         '       + Yellow +    'splicex --save=/home/$USER/' + DefColour)
    print('')
    print(Red + '   --test                ' + DefColour + 'Test output of command')
    print('                         '       + Yellow +    'splicex --test=\'Password Ok\'' + DefColour)
    print('')
    print(Red + '   --time                ' + DefColour + 'Manipulate timed iterations')
    print('                         '       + Yellow +    'splicex --time=\'12, 3\'' + DefColour)
    print('')
    print(Red + '   --usernames           ' + DefColour + 'Path to username list')
    print('                         '       + Yellow +    'splicex --usernames=\'UserList.txt\'' + DefColour)
    print('')
    print(Red + '   --exh-l               ' + DefColour + 'Use an exhaustive attack with letters only')
    print('')
    print(Red + '   --exh-n               ' + DefColour + 'Use an exhaustive attack with numbers only')
    print('')
    print(Red + '   --exh-s               ' + DefColour + 'Use an exhaustive attack with special characters only')
    print('')
    print(Red + '   --exh-ln              ' + DefColour + 'Use an exhaustive attack with letters and numbers only')
    print('')
    print(Red + '   --exh-ls              ' + DefColour + 'Use an exhaustive attack with letters and special')
    print('                         characters only')
    print('')
    print(Red + '   --exh-ns              ' + DefColour + 'Use an exhaustive attack with numbers and special')
    print('                         characters only')
    print('')
    print(Red + '   --exh-all             ' + DefColour + 'Use an exhaustive attack with all characters')
    print('')
    print(Red + '   --exh-custom          ' + DefColour + 'Use an exhaustive attack with custom characters')
    print('                         '       + Yellow +    'splicex --exh-custom=\'CharsList.txt\'' + DefColour)
    print('')
    print(Red + '   --stdout              ' + DefColour + 'Print only passwords to stdout')
    print('')
    print(Red + '   -A                    ' + DefColour + 'Use alphabetical mixing module')
    print('')
    print(Red + '   -B                    ' + DefColour + 'Use backwords module')
    print('')
    print(Red + '   -C                    ' + DefColour + 'Use alternating caps module')
    print('')
    print(Red + '   -L                    ' + DefColour + 'Use "L337" speak module')
    print('')
    print(Red + '   -M                    ' + DefColour + 'Use MD5 module')
    print('')
    print(Red + '   -N                    ' + DefColour + 'Use numerical mixing module')
    print('')
    print(Red + '   -R                    ' + DefColour + 'Use regular words module')
    print('')
    print(Red + '   -S                    ' + DefColour + 'Use special mixing module')
    print('')
    print(Red + '   --mix-custom          ' + DefColour + 'Use custom mixing module')
    print('                         '       + Yellow +    'splicex --mix-custom=\'CharsList.txt\'' + DefColour)
    print('')
    print(Red + '   --wep-5               ' + DefColour + 'Use 5 character WEP module')
    print('')
    print(Red + '   --wep-13              ' + DefColour + 'Use 13 character WEP module')
    print('')
    print(Red + '   --wep-*               ' + DefColour + 'Use 5 and 13 character WEP module')
    print('')
    print(Red + '   --letters             ' + DefColour + 'Use letter characters')
    print('')
    print(Red + '   --numbers             ' + DefColour + 'Use number characters')
    print('')
    print(Red + '   --specials            ' + DefColour + 'Use special characters')
    print('')
    print(Red + '   --char-all            ' + DefColour + 'Use all characters')
    print('')
    print(Red + '   --no-char             ' + DefColour + 'Override character usage')
    print('')
    print(Red + '   --char-length         ' + DefColour + 'Start and end with set character lengths')
    print('')
    print(Red + '   --custom              ' + DefColour + 'Use custom characters')
    print('                         '       + Yellow +    'splicex --custom=\'CharsList.txt\'' + DefColour)
    print('')
    print(Red + '   --deshadow            ' + DefColour + 'Crack shadow hash sums')
    print('')
    print(Red + '   --get-shadow          ' + DefColour + 'Get the shadow info for a user')
    print('                         '       + Yellow +    'splicex --get-shadow=$USER' + DefColour)
    print('')
    print(Red + '   --set-shadow          ' + DefColour + 'Use the shadow info from a file')
    print('                         '       + Yellow +    'splicex --set-shadow=\'UserShadow.txt\'' + DefColour)
    print('')
    print(Red + '   --se-module           ' + DefColour + 'Use the social engineering module')
    print('')
    print(Red + '   --create              ' + DefColour + 'Create a dictionary')
    print('')
    print(Red + '   --debug               ' + DefColour + 'Enable debugging')

import os
import re
import sys
import spwd
import getpass
import os.path
import getopt
import time
from hashlib import md5

cmd = None
dictionary = None
save = None
restore = None
test = None
TIME = None
LENGTH = None
usernames = None
MixCustom = None
ExhCustom = None
Custom = None
GetShadow = None
SetShadow = None
ExhL = False
ExhN = False
ExhS = False
ExhLN = False
ExhLS = False
ExhNS = False
ExhALL = False
StdoutSwitch = False
AlphaSwitch = False
BWSwitch = False
CapsSwitch = False
L337Switch = False
MD5Switch = False
NumberSwitch = False
RegularSwitch = False
SpecialSwitch = False
wep5 = False
wep13 = False
NoChar = False
Letters = False
Numbers = False
Specials = False
DeShadow = False
SESwitch = False
Create = False
DebugSwitch = False

for arg in sys.argv:
 if '--command=' in arg:
  cmd = arg.replace('--command=', '', 1)
 elif '--dictionary=' in arg:
  dictionary = arg.replace('--dictionary=', '', 1)
 elif '--save=' in arg:
  save = arg.replace('--save=', '', 1)
 elif '--restore=' in arg:
  restore = arg.replace('--restore=', '', 1)
 elif '--test=' in arg:
  test = arg.replace('--test=', '', 1)
 elif '--time=' in arg:
  TIME = arg.replace('--time=', '', 1)
 elif '--char-length=' in arg:
  LENGTH = arg.replace('--char-length=', '', 1)
 elif '--usernames=' in arg:
  usernames = arg.replace('--usernames=', '', 1)
 elif '--mix-custom=' in arg:
  MixCustom = arg.replace('--mix-custom=', '', 1)
 elif '--exh-custom=' in arg:
  ExhCustom = arg.replace('--exh-custom=', '', 1)
 elif '--custom=' in arg:
  Custom = arg.replace('--custom=', '', 1)
 elif '--get-shadow=' in arg:
  GetShadow = arg.replace('--get-shadow=', '', 1)
 elif '--set-shadow=' in arg:
  SetShadow = arg.replace('--set-shadow=', '', 1)
 elif '--rtfm' in arg:
  os.system("man /etc/splicex/splicex.1.gz")
  sys.exit(0)
 elif '--exh-l' in arg:
  ExhL = True
 elif '--exh-n' in arg:
  ExhN = True
 elif '--exh-s' in arg:
  ExhS = True
 elif '--exh-ln' in arg:
  ExhLN = True
 elif '--exh-ls' in arg:
  ExhLS = True
 elif '--exh-ns' in arg:
  ExhNS = True
 elif '--exh-all' in arg:
  ExhALL = True
 elif '--stdout' in arg:
  StdoutSwitch = True
 elif '-A' in arg:
  AlphaSwitch = True
 elif '-B' in arg:
  BWSwitch = True
 elif '-C' in arg:
  CapsSwitch = True
 elif '-L' in arg:
  L337Switch = True
 elif '-M' in arg:
  MD5Switch = True
 elif '-N' in arg:
  NumberSwitch = True
 elif '-R' in arg:
  RegularSwitch = True
 elif '-S' in arg:
  SpecialSwitch = True
 elif '--wep-5' in arg:
  wep5 = True
 elif '--no-13' in arg:
  wep13 = True
 elif '--wep-*' in arg:
  wep5 = True
  wep13 = True
 elif '--no-char' in arg:
  NoChar = True
 elif '--letters' in arg:
  Letters = True
 elif '--numbers' in arg:
  Numbers = True
 elif '--specials' in arg:
  Specials = True
 elif '--char-all' in arg:
  Letters = True
  Numbers = True
  Specials = True
 elif '--deshadow' in arg:
  DeShadow = True
 elif '--se-module' in arg:
  SESwitch = True
 elif '--create' in arg:
  Create = True
 elif '--debug' in arg:
  DebugSwitch = True
 elif '--help' in arg:
  sys.exit(HELP())
 elif arg != sys.argv[0]:
  sys.exit(SpliceX + 'error: invalid argument: ' + arg)

if DebugSwitch is False:
 sys.tracebacklimit = 0

if ExhCustom is not None:
 dictionary = ExhCustom
 Custom = ExhCustom



ExhSwitch = False
if ExhL == True:
 dictionary = "/etc/splicex/splicex.L"
 Letters = True
 Numbers = False
 Specials = False
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True
if ExhN == True:
 dictionary = "/etc/splicex/splicex.N"
 Letters = False
 Numbers = True
 Specials = False
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True
if ExhS == True:
 dictionary = "/etc/splicex/splicex.S"
 Letters = False
 Numbers = False
 Specials = True
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True
if ExhLN == True:
 dictionary = "/etc/splicex/splicex.LN"
 Letters = True
 Numbers = True
 Specials = False
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True
if ExhLS == True:
 dictionary = "/etc/splicex/splicex.LS"
 Letters = True
 Numbers = False
 Specials = True
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True
if ExhNS == True:
 dictionary = "/etc/splicex/splicex.NS"
 Letters = False
 Numbers = True
 Specials = True
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True
if ExhALL == True:
 dictionary = "/etc/splicex/splicex.ALL"
 Letters = True
 Numbers = True
 Specials = True
 AlphaSwitch = False
 BWSwitch = False
 CapsSwitch = False
 L337Switch = False
 NumberSwitch = False
 MD5Switch = False
 RegularSwitch = True
 SpecialSwitch = False
 ExhSwitch = True

if Custom is not None and dictionary is not None:
 if Custom == dictionary:
  Letters = False
  Numbers = True
  Specials = True
  AlphaSwitch = False
  BWSwitch = False
  CapsSwitch = False
  L337Switch = False
  NumberSwitch = False
  MD5Switch = False
  RegularSwitch = True
  SpecialSwitch = False
  ExhSwitch = True


ShadowValue = []
if DeShadow is True and SetShadow is None and GetShadow is None:
 sys.exit(SpliceX + "error: --deshadow requires --getshadow or --setshadow")
if SetShadow is not None and GetShadow is not None:
 sys.exit(SpliceX + "error: --getshadow and --setshadow cannot be combined")
elif not os.geteuid()==0 and GetShadow is not None:
 sys.exit(SpliceX + "error: --getshadow requires root privileges")
elif os.geteuid()==0 and GetShadow is not None:
 try:
     ShadowValue = spwd.getspnam(GetShadow)[1]
 except:
     sys.exit(SpliceX + "error: --getshadow: invalid user entered")
elif SetShadow is not None and os.path.exists(SetShadow):
 ShadowFile = open(SetShadow, 'r')
 for line in ShadowFile:
  line = line.replace('\n', '')
  ShadowValue = line
if SetShadow is not None and not os.path.exists(SetShadow):
 sys.exit(SpliceX + "error: --setshadow: shadow file does not exist")
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

if restore is not None and os.path.exists(restore) is False:
 sys.exit(SpliceX + "error: restore file does not exist")
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

Slash = "/"
if save is not None and not os.path.isdir(save):
 sys.exit(SpliceX + "error: ( -s ) invalid directory")
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
 save += Slash + "splicex.save"
else:
 SaveSwitch = False

if dictionary is None:
 dictionary = "/etc/splicex/splicex.list"
elif dictionary is not None and not os.path.exists(dictionary):
 sys.exit(SpliceX + "error: dictionary does not exist")

if usernames is None:
 UserSwitch = False
elif usernames is not None and not os.path.exists(usernames):
 sys.exit(SpliceX + "error: username list does not exist")
else:
 UserSwitch = True

if RestoreSwitch is False:
 AlphaSwitch = AlphaSwitch
 CapsSwitch = CapsSwitch
 BWSwitch = BWSwitch
 L337Switch = L337Switch
 MD5Switch = MD5Switch
 NumberSwitch = NumberSwitch
 RegularSwitch = RegularSwitch
 SpecialSwitch = SpecialSwitch
 Letters = Letters
 Numbers = Numbers
 Specials = Specials
 MixCustom = MixCustom
 Custom = Custom
 wep5 = wep5
 wep13 = wep13
else:
 cmd = State[0]
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
 cmd = "STDOUT PASSWORD ON"

if Create is False and RestoreSwitch is False:
 ShadowSwitch = DeShadow
 if ShadowSwitch is True:
  cmd = "splicex-deshadow PASSWORD '" + ShadowSalt + "' '" + ShadowValue + "'"
 if cmd is None:
  sys.exit(SpliceX + "error: invalid usage")
 else:
  cmd = cmd.replace('','eval ', 1)

if Create is False and RestoreSwitch is False:
 if cmd.__contains__("PASSWORD"):
  pass
 else:
  sys.exit(SpliceX + "error: -c does not contain regexp `PASSWORD'")

if usernames is not None and RestoreSwitch is False:
 if cmd.__contains__("USERNAME"):
  pass
 else:
  sys.exit(SpliceX + "error: -c does not contain regexp `USERNAME'")

if Create is False and cmd.__contains__("splicex-deshadow"):
 test = "SHADOW CRACKED"
 

if AlphaSwitch is False and BWSwitch is False and CapsSwitch is False\
and L337Switch is False and NumberSwitch is False and RegularSwitch is False\
and SpecialSwitch is False and MixCustom is None and MD5Switch is False\
and wep5 is False and wep13 is False and SESwitch is False:
 sys.exit(SpliceX + "error: no modules selected: ( -A -B -C -L -M -N -R -S --mix-custom --wep-5 --wep-13 --wep-* --se-module)")

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
  sys.exit(SpliceX + "error: --custom list does not exist")

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
  sys.exit(SpliceX + "error: -U list does not exist")

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
    socen_words = list(set(socen_words))

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
 sys.exit(SpliceX + "error: compiled empty wordlist")

Word = list(set(Word))
ShowWord = []
PassWd = []
for Input in Word:
 ShowWord.append(Input)
 c = ""
 for let in Input:
  c += "\\\\\\" + let
 PassWd.append(c)

timeup = 0
PassAmount = 0
StartTime = time.time() - 1
if TIME != None:
 try:
     TIME = TIME.split(", ")
     sleep_now = int(TIME[0])
     sleep_for = int(TIME[1])

 except:
     sys.exit(SpliceX + "error: invalid --time arguments")

else:
 sleep_now = 0
 sleep_for = 0

if LENGTH != None:
 try:
     LENGTH = LENGTH.split(", ")
     length_start = int(LENGTH[0])
     length_end = int(LENGTH[1])
     if length_end > 10:
      length_end = 10
     if ExhSwitch is True:
      length_start -= 1
      length_end -= 1

 except:
     sys.exit(SpliceX + " error: invalid --char-length arguments")

else:
 length_start = 0
 length_end = 10

WordCount = 0
for CountWords in ShowWord:
 WordCount += 1
    
def BF1():
    global timeup, PassAmount
    for u in range(StateU, UserCount):
     for x in range(StateW, WordCount):
      if SaveSwitch is True:
       WriteSave = []
       FILE = open(save, 'w')
       WriteSave.append(str(cmd))
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
      Timer = int(round(float(time.time() - StartTime)))
      Speed = PassAmount / Timer
      NewShowWord = ShowWord[x]
      NewPassWd = PassWd[x] 
      timeup += 1
      if timeup == sleep_now:
       time.sleep(sleep_for)
       timeup = 0
      print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
      output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
      if test == None:
       print(output)
      elif output.__contains__(test):
       sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
      else:
       print(output)
      PassAmount += 1

def BF2():
    global timeup, PassAmount
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for x in range(StateW, WordCount):
       if SaveSwitch is True:
        WriteSave = []
        FILE = open(save, 'w')
        WriteSave.append(str(cmd))
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
       Timer = int(round(float(time.time() - StartTime)))
       Speed = PassAmount / Timer
       NewShowWord = Char1[a] + ShowWord[x]
       NewPassWd = Char2[a] + PassWd[x]
       timeup += 1
       if timeup == sleep_now:
        time.sleep(sleep_for)
        timeup = 0
       print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
       output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
       if test == None:
        print(output)
       elif output.__contains__(test):
        sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
       else:
        print(output)
       PassAmount += 1

       if ExhSwitch is False:
        Timer = int(round(float(time.time() - StartTime)))
        Speed = PassAmount / Timer
        NewShowWord = ShowWord[x] + Char1[a]
        NewPassWd = PassWd[x] + Char2[a]
        timeup += 1
        if timeup == sleep_now:
         time.sleep(sleep_for)
         timeup = 0
        print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
        output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
        if test == None:
         print(output)
        elif output.__contains__(test):
         sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
        else:
         print(output)
        PassAmount += 1

def BF3():
    global timeup, PassAmount
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for x in range(StateW, WordCount):
        if SaveSwitch is True:
         WriteSave = []
         FILE = open(save, 'w')
         WriteSave.append(str(cmd))
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
        Timer = int(round(float(time.time() - StartTime)))
        Speed = PassAmount / Timer
        NewShowWord = Char1[a] + ShowWord[x] + Char1[b]
        NewPassWd = Char2[a] + PassWd[x] + Char2[b]
        timeup += 1
        if timeup == sleep_now:
         time.sleep(sleep_for)
         timeup = 0
        print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
        output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
        if test == None:
         print(output)
        elif output.__contains__(test):
         sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
        else:
         print(output)
        PassAmount += 1

        if ExhSwitch is False:
         Timer = int(round(float(time.time() - StartTime)))
         Speed = PassAmount / Timer
         NewShowWord = Char1[a] + Char1[b] + ShowWord[x]
         NewPassWd = Char2[a] + Char2[b] + PassWd[x]
         timeup += 1
         if timeup == sleep_now:
          time.sleep(sleep_for)
          timeup = 0
         print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
         output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
         if test == None:
          print(output)
         elif output.__contains__(test):
          sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
         else:
          print(output)
         PassAmount += 1

         Timer = int(round(float(time.time() - StartTime)))
         Speed = PassAmount / Timer
         NewShowWord = ShowWord[x] + Char1[b] + Char1[a]
         NewPassWd = PassWd[x] + Char2[b] + Char2[a]
         timeup += 1
         if timeup == sleep_now:
          time.sleep(sleep_for)
          timeup = 0
         print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
         output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
         if test == None:
          print(output)
         elif output.__contains__(test):
          sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
         else:
          print(output)
         PassAmount += 1

def BF4():
    global timeup, PassAmount
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for x in range(StateW, WordCount):
         if SaveSwitch is True:
          WriteSave = []
          FILE = open(save, 'w')
          WriteSave.append(str(cmd))
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
         Timer = int(round(float(time.time() - StartTime)))
         Speed = PassAmount / Timer
         NewShowWord = Char1[c] + Char1[a] + ShowWord[x] + Char1[b]
         NewPassWd = Char2[c] + Char2[a] + PassWd[x] + Char2[b]
         timeup += 1
         if timeup == sleep_now:
          time.sleep(sleep_for)
          timeup = 0
         print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
         output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
         if test == None:
          print(output)
         elif output.__contains__(test):
          sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
         else:
          print(output)
         PassAmount += 1

         if ExhSwitch is False:
          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = Char1[b] + ShowWord[x] + Char1[a] + Char1[c]
          NewPassWd = Char2[b] + PassWd[x] + Char2[a] + Char2[c]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
          output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
          if test == None:
           print(output)
          elif output.__contains__(test):
           sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
          else:
           print(output)
          PassAmount += 1

          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = Char1[c] + Char1[a] + Char1[b] + ShowWord[x]
          NewPassWd = Char2[c] + Char2[a] + Char2[b] + PassWd[x]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
          output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
          if test == None:
           print(output)
          elif output.__contains__(test):
           sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
          else:
           print(output)
          PassAmount += 1

          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = ShowWord[x] + Char1[b] + Char1[a] + Char1[c]
          NewPassWd = PassWd[x] + Char2[b] + Char2[a] + Char2[c]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
          output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
          if test == None:
           print(output)
          elif output.__contains__(test):
           sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
          else:
           print(output)
          PassAmount += 1

def BF5():
    global timeup, PassAmount
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for x in range(StateW, WordCount):
          if SaveSwitch is True:
           WriteSave = []
           FILE = open(save, 'w')
           WriteSave.append(str(cmd))
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
          Timer = int(round(float(time.time() - StartTime)))
          Speed = PassAmount / Timer
          NewShowWord = Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d]
          NewPassWd = Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d]
          timeup += 1
          if timeup == sleep_now:
           time.sleep(sleep_for)
           timeup = 0
          print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
          output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
          if test == None:
           print(output)
          elif output.__contains__(test):
           sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
          else:
           print(output)
          PassAmount += 1

          if ExhSwitch is False:
           Timer = int(round(float(time.time() - StartTime)))
           Speed = PassAmount / Timer
           NewShowWord = Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
           NewPassWd = Char2[c] + Char2[a] + Char2[b] + Char2[d] + PassWd[x]
           timeup += 1
           if timeup == sleep_now:
            time.sleep(sleep_for)
            timeup = 0
           print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
           output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
           if test == None:
            print(output)
           elif output.__contains__(test):
            sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
           else:
            print(output)
           PassAmount += 1

           Timer = int(round(float(time.time() - StartTime)))
           Speed = PassAmount / Timer
           NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c]
           NewPassWd = PassWd[x] + Char2[d] + Char2[b] + Char2[a] + Char2[c]
           timeup += 1
           if timeup == sleep_now:
            time.sleep(sleep_for)
            timeup = 0
           print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
           output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
           if test == None:
            print(output)
           elif output.__contains__(test):
            sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
           else:
            print(output)
           PassAmount += 1

def BF6():
    global timeup, PassAmount
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
            WriteSave.append(str(cmd))
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
           Timer = int(round(float(time.time() - StartTime)))
           Speed = PassAmount / Timer
           NewShowWord = Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d]
           NewPassWd = Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d]
           timeup += 1
           if timeup == sleep_now:
            time.sleep(sleep_for)
            timeup = 0
           print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
           output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
           if test == None:
            print(output)
           elif output.__contains__(test):
            sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
           else:
            print(output)
           PassAmount += 1

           if ExhSwitch is False:
            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e]
            NewPassWd = Char2[d] + Char2[b] + PassWd[x] + Char2[a] + Char2[c] + Char2[e]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
            output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
            if test == None:
             print(output)
            elif output.__contains__(test):
             sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
            else:
             print(output)
            PassAmount += 1

            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
            NewPassWd = Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + PassWd[x]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
            output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
            if test == None:
             print(output)
            elif output.__contains__(test):
             sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
            else:
             print(output)
            PassAmount += 1

            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
            NewPassWd = PassWd[x] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
            output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
            if test == None:
             print(output)
            elif output.__contains__(test):
             sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
            else:
             print(output)
            PassAmount += 1

def BF7():
    global timeup, PassAmount
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
             WriteSave.append(str(cmd))
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
            Timer = int(round(float(time.time() - StartTime)))
            Speed = PassAmount / Timer
            NewShowWord = Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f]
            NewPassWd = Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f]
            timeup += 1
            if timeup == sleep_now:
             time.sleep(sleep_for)
             timeup = 0
            print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
            output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
            if test == None:
             print(output)
            elif output.__contains__(test):
             sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
            else:
             print(output)
            PassAmount += 1

            if ExhSwitch is False:
             Timer = int(round(float(time.time() - StartTime)))
             Speed = PassAmount / Timer
             NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
             NewPassWd = Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + PassWd[x]
             timeup += 1
             if timeup == sleep_now:
              time.sleep(sleep_for)
              timeup = 0
             print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
             output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
             if test == None:
              print(output)
             elif output.__contains__(test):
              sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
             else:
              print(output)
             PassAmount += 1

             Timer = int(round(float(time.time() - StartTime)))
             Speed = PassAmount / Timer
             NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
             NewPassWd = PassWd[x] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e]
             timeup += 1
             if timeup == sleep_now:
              time.sleep(sleep_for)
              timeup = 0
             print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
             output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
             if test == None:
              print(output)
             elif output.__contains__(test):
              sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
             else:
              print(output)
             PassAmount += 1

def BF8():
    global timeup, PassAmount
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
              WriteSave.append(str(cmd))
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
             Timer = int(round(float(time.time() - StartTime)))
             Speed = PassAmount / Timer
             NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f]
             NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f]
             timeup += 1
             if timeup == sleep_now:
              time.sleep(sleep_for)
              timeup = 0
             print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
             output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
             if test == None:
              print(output)
             elif output.__contains__(test):
              sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
             else:
              print(output)
             PassAmount += 1

             if ExhSwitch is False:
              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              NewPassWd = Char2[f] + Char2[d] + Char2[b] + PassWd[x] + Char2[a] + Char2[c] + Char2[e] + Char2[g]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
              output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
              if test == None:
               print(output)
              elif output.__contains__(test):
               sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
              else:
               print(output)
              PassAmount += 1

              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
              NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + PassWd[x]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
              output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
              if test == None:
               print(output)
              elif output.__contains__(test):
               sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
              else:
               print(output)
              PassAmount += 1

              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              NewPassWd = PassWd[x] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
              output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
              if test == None:
               print(output)
              elif output.__contains__(test):
               sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
              else:
               print(output)
              PassAmount += 1

def BF9():
    global timeup, PassAmount
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
               WriteSave.append(str(cmd))
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
              Timer = int(round(float(time.time() - StartTime)))
              Speed = PassAmount / Timer
              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h]
              NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h]
              timeup += 1
              if timeup == sleep_now:
               time.sleep(sleep_for)
               timeup = 0
              print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
              output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
              if test == None:
               print(output)
              elif output.__contains__(test):
               sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
              else:
               print(output)
              PassAmount += 1

              if ExhSwitch is False:
               Timer = int(round(float(time.time() - StartTime)))
               Speed = PassAmount / Timer
               NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] +Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
               NewPassWd = Char2[g] + Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + PassWd[x]
               timeup += 1
               if timeup == sleep_now:
                time.sleep(sleep_for)
                timeup = 0
               print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
               output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
               if test == None:
                print(output)
               elif output.__contains__(test):
                sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
               else:
                print(output)
               PassAmount += 1

               Timer = int(round(float(time.time() - StartTime)))
               Speed = PassAmount / Timer
               NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
               NewPassWd = PassWd[x] + Char2[h] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g]
               timeup += 1
               if timeup == sleep_now:
                time.sleep(sleep_for)
                timeup = 0
               print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
               output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
               if test == None:
                print(output)
               elif output.__contains__(test):
                sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
               else:
                print(output)
               PassAmount += 1

def BF10():
    global timeup, PassAmount
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
                WriteSave.append(str(cmd))
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
               Timer = int(round(float(time.time() - StartTime)))
               Speed = PassAmount / Timer
               NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h]
               NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h]
               timeup += 1
               if timeup == sleep_now:
                time.sleep(sleep_for)
                timeup = 0
               print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
               output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
               if test == None:
                print(output)
               elif output.__contains__(test):
                sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
               else:
                print(output)
               PassAmount += 1

               if ExhSwitch is False:
                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = Char1[h] + Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                NewPassWd = Char2[h] + Char2[f] + Char2[d] + Char2[b] + PassWd[x] + Char2[a] + Char2[c] + Char2[e] + Char2[g] + Char2[i]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
                output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
                if test == None:
                 print(output)
                elif output.__contains__(test):
                 sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
                else:
                 print(output)
                PassAmount += 1

                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
                NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + PassWd[x]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
                output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
                if test == None:
                 print(output)
                elif output.__contains__(test):
                 sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
                else:
                 print(output)
                PassAmount += 1

                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                NewPassWd = PassWd[x] + Char2[h] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g] + Char2[i]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
                output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
                if test == None:
                 print(output)
                elif output.__contains__(test):
                 sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
                else:
                 print(output)
                PassAmount += 1

def BF11():
    global timeup, PassAmount
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
                 WriteSave.append(str(cmd))
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
                Timer = int(round(float(time.time() - StartTime)))
                Speed = PassAmount / Timer
                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j]
                NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + PassWd[x] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + Char2[j]
                timeup += 1
                if timeup == sleep_now:
                 time.sleep(sleep_for)
                 timeup = 0
                print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
                cmd = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace('USERNAME', User[u].replace(" ", "")))
                if test == None:
                 print(output)
                elif output.__contains__(test):
                 sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
                else:
                 print(output)
                PassAmount += 1

                if ExhSwitch is False:
                 Timer = int(round(float(time.time() - StartTime)))
                 Speed = PassAmount / Timer
                 NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j] + ShowWord[x] 
                 NewPassWd = Char2[i] + Char2[g] + Char2[e] + Char2[c] + Char2[a] + Char2[b] + Char2[d] + Char2[f] + Char2[h] + Char2[j] + PassWd[x]
                 timeup += 1
                 if timeup == sleep_now:
                  time.sleep(sleep_for)
                  timeup = 0
                 print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
                 output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
                 if test == None:
                  print(output)
                 elif output.__contains__(test):
                  sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
                 else:
                  print(output)
                 PassAmount += 1

                 Timer = int(round(float(time.time() - StartTime)))
                 Speed = PassAmount / Timer
                 NewShowWord = ShowWord[x] + Char1[j] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                 NewPassWd = PassWd[x] + Char2[j] + Char2[h] + Char2[f] + Char2[d] + Char2[b] + Char2[a] + Char2[c] + Char2[e] + Char2[g] + Char2[i]
                 timeup += 1
                 if timeup == sleep_now:
                  time.sleep(sleep_for)
                  timeup = 0
                 print(SpliceX + str(int(round(float(Speed)))) + "/s " + User[u].replace(" ", "") + " " + NewShowWord.replace(" ", ""))
                 output = os.popen(cmd.replace("PASSWORD", NewPassWd.replace(" ", "")).replace("USERNAME", User[u].replace(" ", ""))).read()
                 if test == None:
                  print(output)
                 elif output.__contains__(test):
                  sys.exit(Red + "[PASSWORD FOUND]: " + Green + NewShowWord + DefColour)
                 else:
                  print(output)
                 PassAmount += 1

def SBF1():
    for u in range(StateU, UserCount):
     for x in range(StateW, WordCount):
      if SaveSwitch is True:
       WriteSave = []
       FILE = open(save, 'w')
       WriteSave.append(str(cmd))
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
      print(NewShowWord.replace(" ", ""))

def SBF2():
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for x in range(StateW, WordCount):
       if SaveSwitch is True:
        WriteSave = []
        FILE = open(save, 'w')
        WriteSave.append(str(cmd))
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
       print(NewShowWord.replace(" ", ""))

       if ExhSwitch is False:
        NewShowWord = ShowWord[x] + Char1[a]
        print(NewShowWord.replace(" ", ""))

def SBF3():
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for x in range(StateW, WordCount):
        if SaveSwitch is True:
         WriteSave = []
         FILE = open(save, 'w')
         WriteSave.append(str(cmd))
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
        print(NewShowWord.replace(" ", ""))

        if ExhSwitch is False:
         NewShowWord = Char1[a] + Char1[b] + ShowWord[x]
         print(NewShowWord.replace(" ", ""))

         NewShowWord = ShowWord[x] + Char1[b] + Char1[a]
         print(NewShowWord.replace(" ", ""))

def SBF4():
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for x in range(StateW, WordCount):
         if SaveSwitch is True:
          WriteSave = []
          FILE = open(save, 'w')
          WriteSave.append(str(cmd))
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
         print(NewShowWord.replace(" ", ""))

         if ExhSwitch is False:
          NewShowWord = Char1[b] + ShowWord[x] + Char1[a] + Char1[c]
          print(NewShowWord.replace(" ", ""))

          NewShowWord = Char1[c] + Char1[a] + Char1[b] + ShowWord[x]
          print(NewShowWord.replace(" ", ""))

          NewShowWord = ShowWord[x] + Char1[b] + Char1[a] + Char1[c]
          print(NewShowWord.replace(" ", ""))

def SBF5():
    for u in range(StateU, UserCount):
     for a in range(StateA, EndCount):
      for b in range(StateB, EndCount):
       for c in range(StateC, EndCount):
        for d in range(StateD, EndCount):
         for x in range(StateW, WordCount):
          if SaveSwitch is True:
           WriteSave = []
           FILE = open(save, 'w')
           WriteSave.append(str(cmd))
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
          print(NewShowWord.replace(" ", ""))

          if ExhSwitch is False:
           NewShowWord = Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
           print(NewShowWord.replace(" ", ""))

           NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c]
           print(NewShowWord.replace(" ", ""))

def SBF6():
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
            WriteSave.append(str(cmd))
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
           print(NewShowWord.replace(" ", ""))

           if ExhSwitch is False:
            NewShowWord = Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e]
            print(NewShowWord.replace(" ", ""))

            NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + ShowWord[x]
            print(NewShowWord.replace(" ", ""))

            NewShowWord = ShowWord[x] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
            print(NewShowWord.replace(" ", ""))

def SBF7():
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
             WriteSave.append(str(cmd))
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
            print(NewShowWord.replace(" ", ""))

            if ExhSwitch is False:
             NewShowWord = Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
             print(NewShowWord.replace(" ", ""))

             NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e]
             print(NewShowWord.replace(" ", ""))

def SBF8():
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
              WriteSave.append(str(cmd))
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
             print(NewShowWord.replace(" ", ""))

             if ExhSwitch is False:
              NewShowWord = Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              print(NewShowWord.replace(" ", ""))

              NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + ShowWord[x]
              print(NewShowWord.replace(" ", ""))

              NewShowWord = ShowWord[x] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
              print(NewShowWord.replace(" ", ""))

def SBF9():
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
               WriteSave.append(str(cmd))
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
              print(NewShowWord.replace(" ", ""))

              if ExhSwitch is False:
               NewShowWord = Char1[g] + Char1[e] + Char1[c] + Char1[a] +Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
               print(NewShowWord.replace(" ", ""))

               NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g]
               print(NewShowWord.replace(" ", ""))

def SBF10():
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
                WriteSave.append(str(cmd))
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
               print(NewShowWord.replace(" ", ""))

               if ExhSwitch is False:
                NewShowWord = Char1[h] + Char1[f] + Char1[d] + Char1[b] + ShowWord[x] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                print(NewShowWord.replace(" ", ""))

                NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + ShowWord[x] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + ShowWord[x]
                print(NewShowWord.replace(" ", ""))

                NewShowWord = ShowWord[x] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                print(NewShowWord.replace(" ", ""))

def SBF11():
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
                 WriteSave.append(str(cmd))
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
                print(NewShowWord.replace(" ", ""))

                if ExhSwitch is False:
                 NewShowWord = Char1[i] + Char1[g] + Char1[e] + Char1[c] + Char1[a] + Char1[b] + Char1[d] + Char1[f] + Char1[h] + Char1[j] + ShowWord[x] 
                 print(NewShowWord.replace(" ", ""))

                 NewShowWord = ShowWord[x] + Char1[j] + Char1[h] + Char1[f] + Char1[d] + Char1[b] + Char1[a] + Char1[c] + Char1[e] + Char1[g] + Char1[i]
                 print(NewShowWord.replace(" ", ""))

if Create is True:
 CFILE = open("splicex.create", 'w')
 X = 0
 N = 0
 for WCreate in ShowWord:
  N += 1
 D1 = round(N * 0.1)
 D2 = round(N * 0.2)
 D3 = round(N * 0.3)
 D4 = round(N * 0.4)
 D5 = round(N * 0.5)
 D6 = round(N * 0.6)
 D7 = round(N * 0.7)
 D8 = round(N * 0.8)
 D9 = round(N * 0.9)
 DStop = round(N * 0.95)
 for WCreate in ShowWord: 
  CFILE.write(WCreate + "\n")
  if X == 0:
   sys.stdout.write(SpliceX + 'compiling splicex.create')
   time.sleep(0.5)
   X += 1
  elif X == D1 or X == D2 or X == D3 or X == D4 or X == D5 or X == D6 or X == D7 or X == D8 or X == D9:
   sys.stdout.flush()
   sys.stdout.write('.')
   time.sleep(0.5)
   X += 1
  elif X == DStop:
   sys.stdout.flush()
   sys.stdout.write('.')
   time.sleep(0.5)
   X += 1
  else:
   X += 1
 CFILE.close()
 sys.stdout.write(CLEAR_LINE)
 sys.stdout.write('\r')
 sys.exit(SpliceX + 'compiled ' + str(N) + ' passwords. enjoy ;-)')

def C_BF1():
    if length_start > 0:
     pass
    elif length_end < 0:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF1()

def C_BF2():
    if length_start > 1:
     pass
    elif length_end < 1:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF2()

def C_BF3():
    if length_start > 2:
     pass
    elif length_end < 2:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF3()

def C_BF4():
    if length_start > 3:
     pass
    elif length_end < 3:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF4()

def C_BF5():
    if length_start > 4:
     pass
    elif length_end < 4:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF5()

def C_BF6():
    if length_start > 5:
     pass
    elif length_end < 5:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF6()

def C_BF7():
    if length_start > 6:
     pass
    elif length_end < 6:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF7()

def C_BF8():
    if length_start > 7:
     pass
    elif length_end < 7:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF8()

def C_BF9():
    if length_start > 8:
     pass
    elif length_end < 8:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF9()

def C_BF10():
    if length_start > 9:
     pass
    elif length_end < 9:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF10()

def C_BF11():
    if length_start > 10:
     pass
    elif length_end < 10:
     sys.exit(SpliceX + 'unable to find password')
    elif NoChar is True:
     sys.exit(SpliceX + 'unable to find password')
    else:
     BF11()

def C_SBF1():
    if length_start > 0:
     pass
    elif length_end < 0:
     sys.exit(0)
    else:
     SBF1()

def C_SBF2():
    if length_start > 1:
     pass
    elif length_end < 1:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF2()

def C_SBF3():
    if length_start > 2:
     pass
    elif length_end < 2:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF3()

def C_SBF4():
    if length_start > 3:
     pass
    elif length_end < 3:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF4()

def C_SBF5():
    if length_start > 4:
     pass
    elif length_end < 4:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF5()

def C_SBF6():
    if length_start > 5:
     pass
    elif length_end < 5:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF6()

def C_SBF7():
    if length_start > 6:
     pass
    elif length_end < 6:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF7()

def C_SBF8():
    if length_start > 7:
     pass
    elif length_end < 7:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF8()

def C_SBF9():
    if length_start > 8:
     pass
    elif length_end < 8:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF9()

def C_SBF10():
    if length_start > 9:
     pass
    elif length_end < 9:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF10()

def C_SBF11():
    if length_start > 10:
     pass
    elif length_end < 10:
     sys.exit(0)
    elif NoChar is True:
     sys.exit(0)
    else:
     SBF11()


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
 C_BF1()
 C_BF2()
 C_BF3()
 C_BF4()
 C_BF5()
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")

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
 C_BF1()
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
 C_BF2()
 C_BF3()
 C_BF4()
 C_BF5()
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
if StateCount == 23 and RestoreSwitch is True and StdoutSwitch is False:
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
 C_BF1()
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
 C_BF2()
 C_BF3()
 C_BF4()
 C_BF5()
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF2()
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
 C_BF3()
 C_BF4()
 C_BF5()
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF3()
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
 C_BF4()
 C_BF5()
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF4()
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
 C_BF5()
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF5()
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
 C_BF6()
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF6()
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
 C_BF7()
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF7()
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
 C_BF8()
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF8()
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
 C_BF9()
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF9()
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
 C_BF10()
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF10()
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
 C_BF11()
 sys.exit(SpliceX + " unable to find password")
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
 C_BF11()
 sys.exit(SpliceX + " unable to find password")

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
 C_SBF1()
 C_SBF2()
 C_SBF3()
 C_SBF4()
 C_SBF5()
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF1()
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
 C_SBF2()
 C_SBF3()
 C_SBF4()
 C_SBF5()
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF1()
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
 C_SBF2()
 C_SBF3()
 C_SBF4()
 C_SBF5()
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF2()
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
 C_SBF3()
 C_SBF4()
 C_SBF5()
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF3()
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
 C_SBF4()
 C_SBF5()
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF4()
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
 C_SBF5()
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF5()
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
 C_SBF6()
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF6()
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
 C_SBF7()
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF7()
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
 C_SBF8()
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF8()
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
 C_SBF9()
 C_SBF10()
 C_SBF11()
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
 C_SBF9()
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
 C_SBF10()
 C_SBF11()
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
 C_SBF10()
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
 C_SBF11()
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
 C_SBF11()
 sys.exit(0)

sys.exit(SpliceX + " unknown error: please report bug to author")
