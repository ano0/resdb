#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//run this on the file from a wget http://marc.ucis.ano/?get=0&version=3

#define M_TYPE_NULL 0
#define M_TYPE_STRING 1
#define M_TYPE_LIST 2
#define M_TYPE_DICT 3

//extension?
#define M_TYPE_TRANSFERCHAIN 5

char *type[]={"NULL","string","list","dict"};

int indent;

void pi() {
 int i;
 for(i=0;i<indent;i++) {
  printf("%s","  ");
 }
}

void printpercent(unsigned char *data,int length) {
 for(;length;data++,length--) {
  if(isprint(*data)) printf("%c",*data);
  else {
//   printf("%%%c%c","0123456789abcdef"[(*data-'0')>>4&15],"0123456789abcdef"[(*data-'0')&15]);
   printf("%%%02x",*data);
//"0123456789abcdef"[(*data-'0')>>4&15],"0123456789abcdef"[(*data-'0')&15]);
  }
 }
}

int marc_decode(unsigned char *data,int from_index,int length) {
 unsigned char *s;
 unsigned int cur_len=0;
 unsigned char m_type=data[from_index];
 from_index++;
 char *key;
 if(!length) return printf("what the fuck? no length???"),-1;
 pi();
 printf("length: %d\n",length);
 pi();
 switch(m_type) {
  case M_TYPE_NULL:
   printf("[null]\n");
   break;
  case M_TYPE_STRING:
   s=malloc(length);
   memcpy(s,data+from_index,length-1);
   s[length-1]=0;
   printf("string: ");
   printpercent(s,length);
   printf("\n");
   break;
  case M_TYPE_LIST:
   printf("list:\n");
   indent++;
   while(from_index < length) {
    cur_len=data[from_index+3]+(data[from_index+2]<<1)+(data[from_index+1]<<2)+(data[from_index+0]<<3);
    from_index+=4;
    marc_decode(data,from_index,cur_len);
    from_index+=cur_len;
   }
   indent--;
   break;
  case M_TYPE_DICT:
   printf("dict:\n");
   indent++;
   while(from_index < length) {
    cur_len=data[from_index];
    pi();
    printf("len: %d\n",cur_len);
    from_index++;
    if(cur_len == 0) break;
    key=malloc(cur_len+1);
    memcpy(key,data+from_index,cur_len);
    key[cur_len]=0;
    from_index+=cur_len;
    pi();
    printf("key: %s\n",key,cur_len);
    cur_len=data[from_index+3]+(data[from_index+2]<<1)+(data[from_index+1]<<2)+(data[from_index+0]<<3);
    from_index+=4;
    indent++;
    marc_decode(data,from_index,cur_len);
    indent--;
    from_index+=cur_len;
   }
   indent--;
   break;
  /*case M_TYPE_TRANSFERCHAIN:
   s=malloc(length);
   memcpy(s,data+from_index,length-1);
   s[length-1]=0;
   printf("transfer: %s\n",s);
   break;*/
  default:
   printf("oh fuck. dahell is this!?!? mtype of %d!?!?\n",m_type);
   break;
 }
 return 0;
}

void printhex(unsigned char *data,int length) {
 for(;length;data++,length--) {
  printf("%02x",*data);
 }
}

void update_message_decode(unsigned char *data,int from_index,int length) {
 printf("\nupdate_message version: %d len: %d\n",data[from_index],length);
 if(data[from_index] != 2) return printf("this program only handles version 2 update messages.\n");
 from_index++;
 char pkey[32];
 int i;
 char *label;
 unsigned int thedate=0;
 unsigned char label_len=0,ext_type,num_extensions;
 short ext_data_len;
 memcpy(pkey,data+from_index,32);
 from_index+=32;
 char sig[64];
 memcpy(sig,data+from_index,64);
 from_index+=64;
 printf("pkey: 0x");
 printhex(pkey,32);
 printf("\n");
 printf("sig: 0x");
 printhex(sig,64);
 printf("\n");
 //for(;from_index < length;) {
  //timestamp, 4 bytes
  thedate=(data[from_index]<<24)+(data[from_index+1]<<16)+(data[from_index+2]<<8)+(data[from_index+3]);
  printf("thedate: %d\n",thedate);
  from_index+=4;
  //label length, 1 byte
  label_len=data[from_index];
  from_index++;
  printf("label len: %d\n",label_len);
  label=malloc(label_len);
  memcpy(label,data+from_index,label_len);
  label[label_len]=0;
  printf("label: ");
  printhex(label,label_len);
  printf("\n");
  from_index+=label_len;
  num_extensions=data[from_index];
  printf("num of extensions: %d\n",num_extensions);
  from_index++;
  for(i=0;i<num_extensions;i++) {
   ext_type=data[from_index];
   from_index++;
   ext_data_len=(data[from_index]<<8) + (data[from_index+1]);
   from_index+=2;
   from_index+=ext_data_len;//skip this for now... fuck it.
   printf("  ext %d type: %d len: %d\n",i,ext_type,ext_data_len);
   if(ext_type != 1 && ext_type != 4 && ext_type != 5) {//let's pretend 5 is transfer chain?
    printf("fuck. unknown ext_type: %d @ %d\n",ext_type,from_index);
    return;
   }
  }
  marc_decode(data+from_index,0,length);
 //}
 return;
}

void interactive_http_sync(unsigned char *data,int from_index,int length) {
 int i;
 unsigned int update_length;
 unsigned char ext_type;
 unsigned short ext_data_len;
 unsigned char version=data[from_index];
 from_index++;
 unsigned char num_extensions=data[from_index];
 from_index++;
 printf("interactive_http_sync version: %d\n",version);
 printf("num_extensions: %d\n",num_extensions);
 for(i=0;i<num_extensions;i++) {
  ext_type=data[from_index];
  from_index++;
  ext_data_len=(data[from_index]<<8)+data[from_index+1];
  from_index+=2;
  printf("extension: type:%d data_len:%d\n",ext_type,ext_data_len);
  from_index+=ext_data_len;
 }
 for(;from_index < length;) {
  printf("from_index: %d\n",from_index);
  update_length=(data[from_index]<<24)+(data[from_index+1]<<16)+(data[from_index+2]<<8)+(data[from_index+3]);
  from_index+=4;
  if(update_length == 0) return printf("ohfuck.\n");
  update_message_decode(data,from_index,update_length);
  from_index += update_length;
 }
}

int main(int argc,char *argv[]) {
 indent=0;
 if(argc < 2) return printf("usage: %s filename\n",argv[0]),0;
 FILE *fp=fopen(argv[1],"r");
 fseek(fp,0L,SEEK_END);
 long len=ftell(fp);
 fseek(fp,0L,SEEK_SET);
 unsigned char *db;
 db=malloc(len+1);
 if((int)db == -1) return printf("failed to malloc(%d)",len),0;
 fread(db,1,len,fp);
 interactive_http_sync(db,0,len);
/*
 marc_decode("\x01\x41\x41\x41",0,4);
 printf("\n");
 marc_decode("\x02\x00\x00\x00\x04\x01\x41\x41\x41\x00\x00\x00\x04\x01\x42\x41\x42",0,17);
 printf("\n");
//                 \x04BLAH == KLAH dafuq?
 marc_decode("\x03\x04\x42LAH\x00\x00\x00\x05\x01""foOo\x04NoPe\x00\x00\x00\x07\x01wtfftw",0,31);
*/
 return 0;
}
