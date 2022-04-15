#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <strings.h>

#include "CodeGen.h"
#include "IOMngr.h"

extern FILE *codegen_file;

int NextLabel = 1;

struct TmpReg {
  unsigned char Free;
  unsigned char Used;
  char * Name;
} Registers[18] 
  = { {1, 0, "$t0"},  {1, 0, "$t1"},  {1, 0, "$t2"},  {1, 0, "$t3"},  
      {1, 0, "$t4"},  {1, 0, "$t5"},  {1, 0, "$t6"},  {1, 0, "$t7"},  
      {1, 0, "$t8"},  {1, 0, "$t9"},  {1, 0, "$s0"},  {1, 0, "$s1"},  
      {1, 0, "$s2"},  {1, 0, "$s3"},  {1, 0, "$s4"},  {1, 0, "$s5"},
      {1, 0, "$s6"},  {1, 0, "$s7"}, };
#define MAXREG 18

char Buf[16];

char *
CopyStr(char * AStr)
{
  return (AStr) ? strdup(AStr) : NULL;
}

struct instr_t * 	  
gen_instr(char *Label, char *OpCode, char *Oprnd1, char *Oprnd2, char *Oprnd3)
{ struct instr_t *instr;
  
  instr = (struct instr_t *) malloc(sizeof(struct instr_t));
  instr->label = CopyStr(Label);
  instr->op = CopyStr(OpCode);
  instr->rd = CopyStr(Oprnd1);
  instr->rs = CopyStr(Oprnd2);
  instr->rt = CopyStr(Oprnd3);
  instr-> next = NULL;
	
  return instr;
}
	
extern struct instr_t * 
append(struct instr_t *Seq1, struct instr_t *Seq2)
{ struct instr_t *instr;

  if (!Seq1) return Seq2;
  
  instr = Seq1;
  while (instr->next) instr = instr->next;
  instr->next = Seq2;
  
  return Seq1;
}

void	  
write_seq(struct instr_t *ASeq)
{ struct instr_t *instr;

  //printf("WriteSeq\n");
  instr = ASeq;
  while (instr) {
    if (instr->label) fprintf(codegen_file,"%s:",instr->label);
    if (instr->op) {
			fprintf(codegen_file,"\t%s\t",instr->op);
    	if (instr->rd) fprintf(codegen_file,"\t%s",instr->rd);
    	if (instr->rs) fprintf(codegen_file,", %s",instr->rs);
    	if (instr->rt) fprintf(codegen_file,", %s",instr->rt);
    }
    fprintf(codegen_file,"\n");
    instr = instr->next;
  }
  if (codegen_file != stdout) fclose(codegen_file);
}

char *
gen_label()
{ char *label;

  label = (char *) malloc(8);
  sprintf(label,"L%d",NextLabel++);
  
  return label;
}
	 
int
avail_reg()
{	int i;

  for (i = 0; i < MAXREG; i++) {
    if (Registers[i].Free) {
      Registers[i].Free = 0;
      Registers[i].Used = line_num() + 1;
      return i;
    }
  }
  
  return -1;
}

void print_reg_claims()
{
  for (int i = 0; i < MAXREG; i++) {
    if (!Registers[i].Free) {
      printf("Register %s was claimed on line number %d\n", Registers[i].Name, Registers[i].Used);
    }
  }
}

char *
reg_name(int RegNum)
{
  if ((RegNum >= 0) && ( RegNum < MAXREG)) {
    return Registers[RegNum].Name;
  } 
  else {
    return NULL;
  }
}

void
free_reg(int ANum)
{
  if ((ANum >= 0) && ( ANum < MAXREG)) {
    Registers[ANum].Free = 1;
  } 
  return;
}

void
reset_regs()
{ int i;

  for (i = 0; i < MAXREG; i++) {
    Registers[i].Free = 1;
    Registers[i].Used = 0;
  }

  return;
}

struct instr_t * 
save_seq()
{ struct instr_t * save, *code;
  int i, scnt;
  char addr[8], offset[8];
  
  scnt = 0;
  save = NULL;
  code = NULL;
  for (i = 0; i < MAXREG; i++) {
    if (!Registers[i].Free) {
      scnt++;
      sprintf(addr,"%d($sp)",scnt*4);
      save = append(save,gen_instr(NULL,"sw",reg_name(i),addr,NULL));
    }
  }
  if (scnt > 0) {
    sprintf(offset,"%d",scnt*4);
    code = gen_instr(NULL,"subu","$sp","$sp",offset);
    append(code,save);
  }
  
  return code;
}

struct instr_t * 
restore_seq()
{ struct instr_t * code, * save;
  int i, scnt;

  char addr[8], offset[8];
  
  scnt = 0;
  save = NULL;
  code = NULL;
  for (i = 0; i < MAXREG; i++) {
    if (!Registers[i].Free) {
      scnt++;
      sprintf(addr,"%d($sp)",scnt*4);
      save = append(save,gen_instr(NULL,"lw",reg_name(i),addr,NULL));
    }
  }
  if (scnt > 0) {
    sprintf(offset,"%d",scnt*4);
    code = append(save,gen_instr(NULL,"addu","$sp","$sp",offset));
  }
  
  return code;
}

char *						 
imm(int Val)
{
  sprintf(Buf,"%d",Val);
  return Buf;
}

char *						 
reg_off(int Offset, char * Reg)
{
  sprintf(Buf,"%d(%s)",Offset,Reg);
  return Buf;
}


