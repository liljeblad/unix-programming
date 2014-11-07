#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

static int lbl;

int ex(nodeType *p) 
{
    int lbl1, lbl2;

    if (!p) return 0;
    switch(p->type) 
    {
        case typeCon:       
            printf("\tpushl\t$%d\n", p->con.value); 
            break;
        case typeId:        
            printf("\tpushl\t%c\n", p->id.i + 'a'); 
            break;
        case typeOpr:
            switch(p->opr.oper) 
            {
                case WHILE:
                    printf("L%03d:\n", lbl1 = lbl++);
                    ex(p->opr.op[0]);
                    printf("\tL%03d\n", lbl2 = lbl++); //Fix this line
                    ex(p->opr.op[1]);
                    printf("\tjmp\t\tL%03d\n", lbl1);
                    printf("L%03d:\n", lbl2);
                    break;
                case IF:
                    ex(p->opr.op[0]);
                    if (p->opr.nops > 2) 
                    {
                        /* if else */
                        printf("\tL%03d\n", lbl1 = lbl++);
                        ex(p->opr.op[1]);
                        printf("\tjmp\t\tL%03d\n", lbl2 = lbl++);
                        printf("L%03d:\n", lbl1);
                        ex(p->opr.op[2]);
                        printf("L%03d:\n", lbl2);
                    } 
                    else 
                    {
                        /* if */
                        printf("\tL%03d\n", lbl1 = lbl++);
                        ex(p->opr.op[1]);
                        printf("L%03d:\n", lbl1);
                    }
                    break;
                case PRINT:     
                    ex(p->opr.op[0]);
                    printf("\tpushl\t$str\n");
                    printf("\tcall\tprintf\n");
                    break;
                case '=':       
                    ex(p->opr.op[1]);
                    printf("\tpopl\t%c\n", p->opr.op[0]->id.i + 'a');
                    break;
                case UMINUS:                //TODO
                    ex(p->opr.op[0]);
                    printf("\tpopl\t%%eax\n");
                    printf("\txorl\t%%edx, %%edx\n");
                    printf("\tmovl\t$-1, %%ecx\n");
                    printf("\tmull\t%%ecx\n");
                    printf("\tpushl\t%%eax\n");
                    break;
            	case FACT:                     //TODO
              	    ex(p->opr.op[0]);
            	    printf("\tcall\tfact\n");
                    printf("\taddl\t$%d, %%esp\n", 8);
                    printf("\tpushl\t%%eax\n");
            	    break;
            	case LNTWO:                    //TODO
            	    ex(p->opr.op[0]);
                    printf("\tcall\tlntwo\n");
                    printf("\taddl\t$%d, %%esp\n", 8);
                    printf("\tpushl\t%%eax\n");
            	    break;
                default:
                    ex(p->opr.op[0]);
                    ex(p->opr.op[1]);
                    switch(p->opr.oper) 
                    {
                        case GCD:
                            printf("\tcall\tgcd\n");
                            printf("\taddl\t$%d, %%esp\n", 8);
                            printf("\tpushl\t%%eax\n");
                            break;
                        case '+':
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\taddl\t%%eax, %%ebx\n"); 
                            printf("\tpushl\t%%ebx\n"); 
                            break;
                        case '-':
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tsubl\t%%eax, %%ebx\n"); 
                            printf("\tpushl\t%%ebx\n"); 
                            break;
                        case '*':
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ecx\n");
                            printf("\tmull\t%%ecx\n"); 
                            printf("\tpushl\t%%eax\n"); 
                            break;
                        case '/':
                            printf("\tpopl\t%%ebx\n"); 
                            printf("\tpopl\t%%eax\n");
                            printf("\txorl\t%%edx, %%edx\n"); 
                            printf("\tidivl\t%%ebx\n");
                            printf("\tpushl\t%%eax\n"); 
                            break;
                        case '<':
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tcmpl\t%%eax, %%ebx\n"); 
                            printf("\tjge\t"); 
                            break;
                        case '>':
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tcmpl\t%%eax, %%ebx\n"); 
                            printf("\tjle\t"); 
                            break;
                        case GE:
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tcmpl\t%%eax, %%ebx\n"); 
                            printf("\tjl\t"); 
                            break;
                        case LE:
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tcmpl\t%%eax, %%ebx\n"); 
                            printf("\tjg\t"); 
                            break;
                        case NE:    
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tcmpl\t%%eax, %%ebx\n"); 
                            printf("\tje\t"); 
                            break;
                        case EQ:
                            printf("\tpopl\t%%eax\n"); 
                            printf("\tpopl\t%%ebx\n");
                            printf("\tcmpl\t%%eax, %%ebx\n"); 
                            printf("\tjne\t");
                            break;
                    }
            }
    }
    return 0;
}
