import subprocess as sp
import pymysql
import pymysql.cursors

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
     Ins_new_Inp()
    elif(inp == '2'):
     Ins_new_Out()
    elif(inp == '3'):
     Ins_new_Bill()
    return
    return
def DelOp():
    return
def Misc():
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



