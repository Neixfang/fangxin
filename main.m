#include<stdio.h>
#include<string.h>
#include<windows.h>
#define N 100
struct teacher
{   int num;
    char name[20];
    char sex;
    int age;
    char danwei[30];
    char address[30];
    char tel[20];
    int jiben;
    int jintie;
    int sheng;
    int ying;
    int dian;
    int shui;
    int fang;
    int suo;
    int wei;
    int gong;
    int heji;
    int shifa;
}te[100];/*定义一个结构体*/
void menu();
void input();
void save(int);
void display();
void modify();
void search();
void del();
void add();/*定义各函数*/

void main()
{   menu();
    int n,flag;
    char a;
    do
    {
        printf("请选择需要操作的步骤(1-7):\n");
        scanf("%d",&n);
        if(n<1||n>7)
        {
            flag=0;
            printf("输入的数字错误，请重新输入:\n");
        }
        else
        {
            flag=1;break;
        }
    }
    while(flag==0);
    while(flag==1)
    {
        switch(n)
        {
            case 1:printf("----输入职工信息----\n");printf("\n");input();break;
            case 2:printf("----浏览职工信息----\n");printf("\n");display();break;
            case 3:printf("----修改职工信息----\n");printf("\n");modify();break;
            case 4:printf("----添加职工信息----\n");printf("\n");add();break;
            case 5:printf("----删除职工信息----\n");printf("\n");del();break;
            case 6:printf("----查询职工信息----\n");printf("\n");search();break;
            case 7:exit(0);break;
            default:break;
        }
        getchar();
        printf("\n");
        printf("是否继续进行(y or n):\n");
        scanf("%c",&a);
        if(a=='y')
        {
            flag=1;
            system("cls");/*清屏*/
            menu();/*调用菜单函数*/
            printf("请再次选择需要操作的步骤(1-7):\n");
            scanf("%d",&n);
            printf("\n");
        }
        exit(0);
    }
}

void search()/*查询函数*/
{
    int num,i;
    int m=load();
    printf("请输入要查找的职工号：\n");
    scanf("%d",&num);
    for(i=0;i<m;i++)
    {if(num==te[i].num)
     {
         printf("已找到该老师，其信息为：\n");
         printf("教师号\t姓名\t性别\t单位名称\t家庭住址\n");
         printf("\n%d\t%s\t%c\t%s\t%s\n",te[i].num,te[i].name,te[i].sex,te[i].danwei,te[i].address);
         printf("联系电话\t基本工资\t津贴\t生活补贴\t应发工资\n");
         printf("\n%s\t%d\t%d\t%d\t%d\n",te[i].tel,te[i].jiben,te[i].jintie,te[i].sheng,te[i].ying);
         printf("电话费\t水电费\t房租\t所得税\t卫生费\t公积金\n");
         printf("\n%d\t%d\t%d\t%d\t%d\t%d\n",te[i].dian,te[i].shui,te[i].fang,te[i].suo,te[i].wei,te[i].gong);
         printf("合计扣款\t实发工资\n");
         printf("\n%d\t%d\n",te[i].heji,te[i].shifa);break;
     
     }
    }
    if(i==m)
    {
        printf("对不起，没有找到该教师\n");
    }
    
}
void modify()/*修改函数*/
{
    int num;
    char name[20];
    char sex;
    int age;
    char danwei[30];
    char address[30];
    char tel[20];
    int jiben;
    int jintie;
    int sheng;
    int ying;
    int dian;
    int shui;
    int fang;
    int suo;
    int wei;
    int gong;
    int heji;
    int shifa;
    int b,c,i,n,flag;
    int m=load();
    printf("\n原来的职工信息\n");
    display();
    printf("\n");
    printf("请输入要修改的老师姓名：\n");
    scanf("%s",name);
    for(flag=1,i=0;flag&&i<m;i++)
    {
        if(strcmp(te[i].name,name)==0)
        {
            printf("已找到该老师，原始记录为：\n");
            printf("教师号\t姓名\t性别\t单位名称\t家庭住址\n");
            printf("\n%d\t%s\t%c\t%s\t%s\n",te[i].num,te[i].name,te[i].sex,te[i].danwei,te[i].address);
            printf("联系电话\t基本工资\t津贴\t生活补贴\t应发工资\n");
            printf("\n%s\t%d\t%d\t%d\t%d\n",te[i].tel,te[i].jiben,te[i].jintie,te[i].sheng,te[i].ying);
            printf("电话费\t水电费\t房租\t所得税\t卫生费\t公积金\n");
            printf("\n%d\t%d\t%d\t%d\t%d\t%d\n",te[i].dian,te[i].shui,te[i].fang,te[i].suo,te[i].wei,te[i].gong);
            printf("合计扣款\t实发工资\n");
            printf("\n%d\t%d\n",te[i].heji,te[i].shifa);
            printf("\n确实要修改信息请按1；不修改请按0\n");
            scanf("%d",&n);
            if(n==1)
            {
                printf("\需要进行修改的选项\n 1.教师号 2.姓名 3.性别 4.单位名称 5.家庭住址 6.联系电话 7.津贴 8.生活补贴 9.电话费 10.水电费 11.房租 12.所得税 13.卫生费 14.公积金 15.基本工资\n");
                printf("请输入你想修改的那一项的序号\n");
                scanf("%d",&c);
                if(c>15||c<1)
                    printf("\n选择错误，请重新选择！\n");
            }
            flag=0;
        }
        
    }
    if(flag==1)
    {printf("\n对不起，查无此人！\n");}
    do
    {
    switch(c)
        {
            case 1:printf("教师号改为：");
                scanf("%d",&num);
                te[i-1].num=num;
                break;
            case 2:printf("姓名改为：");
                scanf("%s",&name);
                strcpy(te[i-1].name,name);
                break;
            case 3:printf("性别改为：");
                scanf("%c",&sex);te[i-1].sex=sex;
                break;
            case 4:printf("单位名称改为：");
                scanf("%s",&danwei);
                strcpy(te[i-1].danwei,danwei);
                break;
            case 5:printf("家庭住址改为：");
                scanf("%s",&address);
                strcpy(te[i-1].address,address);
                break;
            case 6:printf("联系电话改为：");
                scanf("%s",&tel);
                strcpy(te[i-1].tel,tel);
                break;
            case 7:printf("津贴改为：");
                scanf("%d",&jintie);
                te[i-1].jintie=jintie;
                break;
            case 8:printf("生活补贴改为：");
                scanf("%d",&sheng);
                te[i-1].sheng=sheng;
                break;
            case 9:printf("电话费改为：");
                scanf("%d",&dian);
                te[i-1].dian=dian;
                break;
            case 10:printf("水电费改为：");
                scanf("%d",&shui);
                te[i-1].shui=shui;
                break;
            case 11:printf("房租改为：");
                scanf("%d",&fang);
                te[i-1].fang=fang;
                break;
            case 12:printf("所得税改为：");
                scanf("%d",&suo);
                te[i-1].suo=duo;
                break;
            case 13:printf("卫生费改为：");
                scanf("%d",&wei);
                te[i-1].wei=wei;
                break;
            case 14:printf("公积金改为：");
                scanf("%d",&gong);
                te[i-1].gong=gong;
                break;
            case 15:printf("基本工资改为：");
                scanf("%d",&jiben);
                te[i-1].jiben=jiben;
                break;
        }
        printf("\n");
        printf("\n是否确定所修改的信息？\n是请按1：重新修改请按2：\n");
        scanf("%d",&b);
    }
        while(b==2)
            printf("\n浏览修改后的所有信息：\n");
    printf("\n");
    save(m);
    display();
    printf("\n继续修改请按1，不再修改请按0\n");
    scanf("%d",&t);
    switch(t)
    {
        case 1:modify();break;
        case 0:break;
        default:break;
    }
    
}

