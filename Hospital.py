import subprocess as sp
import pymysql
import pymysql.cursors

def Aggre_1():
    return
def Aggre_2():
    return
def Selec_1():
    return
def Selec_2():
    return
def Proj_1():
    return
def Proj_2():
    return
def Search_1():
    return
def Search_2():
    return
def Analysis_1():
    return
def Analysis_2():
    return


def Aggre():
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Avg bill cost for month")
    print("2.Dept with max patients")
    inp = input("\nCHOICE ? ")
    if(inp == '1'):
      Aggre_1()
    elif(inp == '2'):
      Aggre_2()
    return

def Selec():
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Select complete data tuples of Inpatient")
    print("2.Select complete data tuples of Outpatient")
    inp = input("\nCHOICE ? ")
    if(inp == '1'):
      Selec_1()
    elif(inp == '2'):
      Selec_2()
    return

def Proj():
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Inpatients with bill greater than Rs 10,000")
    print("2.Staff whose salary is greater than Rs 50,000")
    inp = input("\nCHOICE ? ")
    if(inp == '1'):
      Proj_1()
    elif(inp == '2'):
      Proj_2()
    return

def Search():
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Doctors whose name starts with the letter ‘A’")
    print("2. Bill numbers ending with 00")
    inp = input("\nCHOICE ? ")
    if(inp == '1'):
      Search_1()
    elif(inp == '2'):
      Search_2()
    return

def Analysis():
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Inpatients whose last name starts with the ‘P’ whose bill is greater than the average bill cost.")
    print("2. Name of the staff with staff id ending with 11 who made more than the average salary")
    inp = input("\nCHOICE ? ")
    if(inp == '1'):
      Analysis_1()
    elif(inp == '2'):
      Analysis_2()
    return
    


def Del_Staff():
    return


def Upd_Sal():
    return
def Upd_room():
    return
def Upd_stat_room():
    return


def Ins_new_Inp():
    return
def Ins_new_Out():
    return
def Ins_new_Bill():
    return

def InsOp():
    print("Welcome!\n")
    print("Choose which insertion you want to make\n")
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Insert new Inpatient")
    print("2.Insert new Outpatient")
    print("3.Insert new Bill")

    inp = input("\nCHOICE ? ")
    if(inp == '1'):
     Ins_new_Inp()
    elif(inp == '2'):
     Ins_new_Out()
    elif(inp == '3'):
     Ins_new_Bill()
    return

def UpdOp():
    print("Welcome!\n")
    print("Choose which informaation do you want to update\n")
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Update the salary of the Staff")
    print("2.Update the cost of Rooms")
    print("3.Update the Status of the rooms when a patient enters or leaves")

    inp = input("\nCHOICE ? ")
    if(inp == '1'):
     Upd_Sal()
    elif(inp == '2'):
     Upd_room()
    elif(inp == '3'):
     Upd_stat_room()
    return

def DelOp():
    print("Welcome!\n")
    print("Choose which informaation do you want to delete\n")
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Delete the staff that has resigned")

    inp = input("\nCHOICE ? ")
    if(inp == '1'):
     Del_Staff()
    return

def Misc():

    print("Welcome!\n")
    print("Choose which type of retrivals you want to make\n")
    print("CHOOSE AN OPTION:(print the corresponding number)\n")
    print("1.Selection")
    print("2.Projection")
    print("3.Aggregate")
    print("4.Search")
    print("5.Analysis")

    inp = input("\nCHOICE ? ")
    if(inp == '1'):
     Selec()
    elif(inp == '2'):
     Proj()
    elif(inp == '3'):
     Aggre()
    elif(inp == '4'):
     Search()
    elif(inp == '5'):
     Analysis()

    return



while(1):
    tmp = sp.call('clear', shell=True)
    username = input("Username: ")
    password = input("Password: ")
    # username="tanvi"
    # password="password"

    try:
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='hfin',
                              cursorclass=pymysql.cursors.DictCursor)
    except Exception as e:
        print(e)
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
        continue

    with con:
         print("Established!\n")
         while(1):
            tmp = sp.call('clear', shell=True)
            #refreshDatabase()
            print("CHOOSE AN OPTION:(print the corresponding number)\n")
            print("1.Insert Options")
            print("2.Update Options")
            print("3.Deletion Options")
            print("4.Misc Options")
            print("5.To quit")

            inp = input("\nCHOICE ? ")
            if(inp == '1'):
                InsOp()
            elif(inp == '2'):
                UpdOp()
            elif(inp == '3'):
                DelOp()
            elif(inp == '4'):
                Misc()
            elif(inp == '5'):
                    exitflag = 1
                    print("Bye")
                    break
            

         break
