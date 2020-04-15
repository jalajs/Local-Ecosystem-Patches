# !/usr/bin/env python3
# -*- coding: utf-8 -*-

# %% Simple selector (MySQL database)
import pymysql
import datetime
import pandas as pd

print("Welcome to our local ecosystems database.")
print("Enter your MySQL username and password.")


# makes a connection to our database in MySQL
def make_connection():
    while True:
        username = input("Username:")
        password = input("Password:")
        try:
            connection = pymysql.connect(host='localhost', user=username,
                                         password=password,
                                         db='sre', charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            return connection

        except RuntimeError:
            print("Failed connection. Re-enter username and password.")
        except pymysql.Error:
            print("Failed connection. Re-enter username and password.")


# starts our application
def start_program():
    while True:
        action = input("Would you like to (c)reate, (r)ead, (u)pdate or (d)elete objects from the database?. Press e "
                       "to exit program.\n")
        if action == "c" or action.lower() == "create":
            create_action()
        elif action == "r" or action.lower() == "read":
            select_action()
        elif action == "u" or action.lower() == "update":
            update_action()
        elif action == "d" or action.lower() == "delete":
            delete_action()
        elif action == "e":
            exit()
        else:
            print("Invalid action. Try again.")


######################################################################################################################
# CREATE OPERATIONS
def create_action():
    print("You can create/add a new species, wherespecies or subregion.")
    while True:
        selection = input("Enter which table you would like to add values to. Press b to go back.\n")
        if selection == "species":
            create_species()
            start_program()
        elif selection == "wherespecies":
            create_wherespecies()
            start_program()
        elif selection == "subregion":
            create_subregion()
            start_program()
        elif selection == "b":
            start_program()
        else:
            print("Invalid table. You must choose from species, wherespecies, or subregion")


def create_species():
    try:
        cur = cnx.cursor()
        print("Species name, scientific name, type, and kingdom are required. Group is optional.")
        decision = input("Enter b to go back or anything else to continue: ")
        if decision == "b":
            start_program()
        name = verify_str_input("Name: ")
        s_name = verify_str_input("Scientific Name: ")
        s_type = verify_str_input("Type: ")
        kingdom = verify_str_input("Kingdom: ")
        group = verify_optional_input("Group (optional): ")
        if group == "":
            cur.callproc("create_species4", [name, s_name, s_type, kingdom])
            cnx.commit()
            print(name, "added to the species table.")
            cur.close()
        else:
            cur.callproc("create_species5", [name, s_name, group, s_type, kingdom])
            cnx.commit()
            print(name, "added to the species table.")
            cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def create_wherespecies():
    try:
        cur = cnx.cursor()
        subregions = get_subregion()
        species_list = get_species()
        print("Species' scientific name and subregion id are required. Attribute is optional.")
        more = input("Enter m to see the subregion table and species scientific/common name, b to go back, "
                     "or anything else to continue: ")
        if more == "m":
            print_subregion()
            print_species()
        elif more == "b":
            start_program()

        print("Enter the scientific name and subregion ID. Must be an existing species and subregion.")
        name = get_valid_name(species_list)
        s_id = get_valid_subregion(subregions)
        attribute = verify_optional_input("Attribute (optional): ")
        if attribute == "":
            cur.callproc("create_where2", [name, s_id])
            cnx.commit()
            print(name, '-', s_id, "added to the wherespecies table.")
            cur.close()
        else:
            cur.callproc("create_where3", [name, s_id, attribute])
            cnx.commit()
            print(name, '-', s_id, "added to the species table with", attribute, "as its attribute.")
            cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def create_subregion():
    try:
        cur = cnx.cursor()
        subregion_ids = get_subregion()
        print("You can create a new row in the subregion table with a new date for resampling. Just provide the id of "
              "the subregion and the new date.")
        more = input("Enter m if you would like to view the subregion table, b to go back, or anything else to "
                     "continue: ")
        if more == "m":
            print_subregion()
        elif more == "b":
            start_program()
        s_id = get_valid_subregion(subregion_ids)
        date = verify_date("Date (YYYY-MM-DD): ")
        cur.callproc("create_subdate", [s_id, date])
        cnx.commit()
        print(s_id, " with new date", date, "added to the species table.")
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


######################################################################################################################
# READ OPERATIONS
def select_action():
    print("You can view data from species, region, or subregion tables")
    while True:
        selection = input("Enter which table you would like to view data from. Press b to go back.\n")
        if selection == "species":
            select_species()
            start_program()
        elif selection == "region":
            select_region()
            start_program()
        elif selection == "subregion":
            select_subregion()
            start_program()
        elif selection == "b":
            start_program()
        else:
            print("Invalid table. You must choose from species, region, or subregion")


def select_species():
    try:
        print("You can view all species in a particular subregion")
        cur = cnx.cursor()
        more = input("Enter m if you'd like to see the subregions, b to go back, or anything else to continue: ")
        if more == "m":
            print_subregion()
        elif more == "b":
            start_program()
        s_name = verify_str_input("Please enter the subregion name: ")
        cur.callproc("view_species", [s_name.capitalize()])
        rows = cur.fetchall()
        if cur.rowcount == 0:
            print("No species recorded in the given subregion.")
            cur.close()
        else:
            df = pd.DataFrame(rows)
            df = df.set_index("common_name")
            with pd.option_context('display.max_rows', None, 'display.max_columns', None):
                print(df)
            cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def select_region():
    try:
        cur = cnx.cursor()
        print("Below are all of the regions in the database.")
        cur.callproc("view_regions", [])
        rows = cur.fetchall()
        df = pd.DataFrame(rows)
        df = df.set_index("id")
        with pd.option_context('display.max_rows', None, 'display.max_columns', None):
            print(df)
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def select_subregion():
    try:
        cur = cnx.cursor()
        print("Below are all of the subregions in the database.")
        cur.callproc("view_subregions", [])
        rows = cur.fetchall()
        df = pd.DataFrame(rows)
        df = df.set_index("id")
        pd.set_option('display.width', 1000)
        with pd.option_context('display.max_rows', None, 'display.max_columns', None):
            print(df)
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


######################################################################################################################
# UPDATE OPERATIONS
def update_action():
    print("You can update the a species' common name via the species or the wherespecies table. Or you can update some "
          "fields in the subregion table.")
    while True:
        selection = input("Enter which table you would like to update. Enter b to go back.\n")
        if selection.lower() == "species":
            update_species()
            start_program()
        elif selection.lower() == "wherespecies":
            update_wherespecies()
            start_program()
        elif selection.lower() == "subregion":
            update_subregion()
            start_program()
        elif selection == "b":
            start_program()
        else:
            print("Invalid table name. Try again.")


def update_species():
    try:
        cur = cnx.cursor()
        print("Enter the scientific name of the species you would like to change.")
        more = input("Enter m to see the common names associated with scientific names, b to go back, or anything "
                     "else to continue: ")
        if more == "m":
            print_species()
        elif more == "b":
            start_program()
        species_list = get_species()
        species = get_valid_name(species_list)
        new_species = verify_str_input("Enter the new common name: ")
        cur.callproc("update_species", [new_species, species])
        cnx.commit()
        print(species.capitalize(), "'s name changed to", new_species)
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def update_wherespecies():
    try:
        cur = cnx.cursor()
        print("Enter an existing tuple in the wherespecies table to update.")
        more = input("Enter m to view the wherespecies table, b to go back, or anything else to continue: ")
        if more == "m":
            print_wherespecies()
        elif more == "b":
            start_program()
        wherespecies_list = get_wherespecies()
        wherespecies_name, wherespecies_id = get_valid_wherespecies(wherespecies_list)
        new_name = verify_str_input("Enter the new common name: ")
        cur.callproc("update_where", [new_name, wherespecies_id, wherespecies_name])
        cnx.commit()
        print("Common name for", wherespecies_name.capitalize(), "located in subregion", wherespecies_id, "changed to",
              new_name)
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def update_subregion():
    decision = input("Enter what you would like to update in the subregion: water or location. Press b to go back.\n")
    while True:
        if decision.lower() == "water":
            update_water()
            start_program()
        elif decision.lower() == "location":
            update_location()
            start_program()
        elif decision == "b":
            start_program()
        else:
            print("Invalid input. Try again.")


def update_water():
    try:
        cur = cnx.cursor()
        print("Enter the subregion ID for the subregion whose water field you would like to update: ")
        more = input("Enter m to view the subregion table, b to go back, or anything else to continue: ")
        if more == "m":
            print_subregion()
        elif more == "b":
            start_program()
        subregion_ids = get_subregion()
        subregion = get_valid_subregion(subregion_ids)
        new_water = verify_str_input("Enter the new water value: ")
        cur.callproc("update_subregion_water", [new_water, subregion])
        cnx.commit()
        print(subregion, "'s water field changed to ", new_water)
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def update_location():
    try:
        cur = cnx.cursor()
        print("Enter the subregion ID for the subregion whose location you would like to update: ")
        more = input("Enter m to view the subregion table, b to go back, or anything else to continue: ")
        if more == "m":
            print_subregion()
        elif more == "b":
            start_program()
        subregion_ids = get_subregion()
        subregion = get_valid_subregion(subregion_ids)
        new_latc = verify_float_input("Enter the new latitude value: ")
        new_longc = verify_float_input("Enter the new longitude value: ")
        cur.callproc("update_subregion_location", [new_latc, new_longc, subregion])
        cnx.commit()
        print(subregion, "'s location field changed to ", new_latc, ",", new_longc)
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


######################################################################################################################
# DELETE OPERATIONS
def delete_action():
    print("You can delete a species, wherespecies or subregion.")
    while True:
        selection = input("Enter which table you would like to delete. Enter b to go back.\n")
        if selection.lower() == "species":
            delete_species()
            start_program()
        elif selection.lower() == "wherespecies":
            delete_wherespecies()
            start_program()
        elif selection.lower() == "subregion":
            delete_subregion()
            start_program()
        elif selection == "b":
            start_program()
        else:
            print("Invalid table name. Try again.")


def delete_species():
    try:
        cur = cnx.cursor()
        species_list = get_species()
        print("Enter a valid species from the species table that you would like to delete.")
        more = input("Enter m to see the species table, b to go back, or anything else to continue: ")
        if more == "m":
            print_species()
        elif more == "b":
            start_program()
        species = get_valid_name(species_list)
        cur.callproc("delete_species", [species])
        cnx.commit()
        print(species.capitalize(), "deleted from the table.")
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def delete_wherespecies():
    try:
        cur = cnx.cursor()
        wherespecies_list = get_wherespecies()
        print("Enter an existing tuple in the wherespecies table to delete.")
        more = input("Enter m to view the wherespecies table, b to go back, or anything else to continue: ")
        if more == "m":
            print_wherespecies()
        elif more == "b":
            start_program()

        wherespecies_name, wherespecies_id = get_valid_wherespecies(wherespecies_list)
        cur.callproc("delete_where", [wherespecies_name.lower(), wherespecies_id])
        cnx.commit()
        print(wherespecies_name.capitalize(), " -", wherespecies_id, "deleted from the table.")
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


def delete_subregion():
    try:
        cur = cnx.cursor()
        subregion_ids = get_subregion()
        print("Enter the subregion ID for the subregion you would like to delete ")
        more = input("Enter m if you would like to view the subregion table, b to go back, or anything else to "
                     "continue: ")
        if more == "m":
            print_subregion()
        elif more == "b":
            start_program()
        subregion = get_valid_subregion(subregion_ids)
        cur.callproc("delete_subregion", [subregion])
        cnx.commit()
        print(subregion, "subregion deleted from the table.")
        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


######################################################################################################################
# HELPER FUNCTIONS

# ensure the user inputs an existing species and returns it
def get_valid_name(species_list):
    name = verify_str_input("Name: ")
    while name.lower() not in species_list:
        print("Given species does not exist in the table. Try again.")
        name = verify_str_input("Name: ")
    return name


# ensures the user inputs an existing subregion and returns it
def get_valid_subregion(subregions):
    s_id = verify_int_input("Subregion ID: ")
    while s_id not in subregions:
        print("Given subregion does not exist in the table. Try again.")
        s_id = verify_int_input("Subregion ID: ")
    return s_id


# ensure the user input a valid wherespecies and returns the name and subregion ID.
def get_valid_wherespecies(wherespecies_list):
    wherespecies_name = verify_str_input("Scientific name: ")
    wherespecies_id = verify_int_input("Enter the corresponding subregion id: ")
    while (wherespecies_id, wherespecies_name) not in wherespecies_list:
        print("Invalid wherespecies name/id pair. Try again.")
        wherespecies_name = verify_str_input("Scientific name: ")
        wherespecies_id = verify_int_input("Enter the corresponding subregion id: ")

    return wherespecies_name, wherespecies_id


# Prints the scientific and common name rows in the species table
def print_species():
    try:
        cur = cnx.cursor()
        stmt_select = "select scientific, common_name from species"
        cur.execute(stmt_select)
        for row in cur.fetchall():
            print(row["scientific"], '-', row["common_name"])

        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


# Prints the wherespecies table
def print_wherespecies():
    try:
        cur = cnx.cursor()
        stmt_select = "select species, subregion from wherespecies"
        cur.execute(stmt_select)
        for row in cur.fetchall():
            print(row["species"], "-", row["subregion"])

        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


# prints most of the fields in the subregion table
def print_subregion():
    try:
        cur = cnx.cursor()
        stmt_select = "select name, id, latc, longc, water, recorddate from subregion"
        cur.execute(stmt_select)
        rows = cur.fetchall()
        df = pd.DataFrame(rows)
        df = df.set_index("id")
        pd.set_option('display.width', 1000)
        with pd.option_context('display.max_rows', None, 'display.max_columns', None):
            print(df)

        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


# returns all of the scientific names in an array
def get_species():
    global species_array
    try:
        cur = cnx.cursor()
        stmt_select = "select scientific, common_name from species"
        cur.execute(stmt_select)
        species_array = []
        for row in cur.fetchall():
            species_array.append(row["scientific"].lower())

        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))

    return species_array


# returns all of the scientific names and associated subregions in a list of tuples
def get_wherespecies():
    global wherespecies_list_tups
    try:
        cur = cnx.cursor()
        stmt_select = "select species, subregion from wherespecies"
        cur.execute(stmt_select)
        wherespecies_list_tups = []
        for row in cur.fetchall():
            wherespecies_list_tups.append((row["subregion"], row["species"]))

        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))

    return wherespecies_list_tups


#  returns all of the subregion id's in an array
def get_subregion():
    global subregion_array
    try:
        cur = cnx.cursor()
        stmt_select = "select name, id, latc, longc, water, recorddate from subregion"
        cur.execute(stmt_select)
        subregion_array = []
        rows = cur.fetchall()
        for row in rows:
            subregion_array.append(row["id"])

        cur.close()

    except pymysql.Error as e:
        print('Error: %d: %s' % (e.args[0], e.args[1]))

    return subregion_array


# prompts/verifies the user for an integer
def verify_int_input(prompt):
    while True:
        user_input = input(prompt)
        if user_input.isnumeric():
            return int(user_input)
        else:
            print("Please enter an integer.")


# prompts/verifies the user for a float
def verify_float_input(prompt):
    while True:
        try:
            user_input = float(input(prompt))
            return float(user_input)
        except ValueError:
            print("Please enter a valid coordinate. (float)")


# prompts/verifies the user for a valid string/species name for the database
def verify_str_input(prompt):
    while True:
        user_input = input(prompt)
        temp = user_input.replace(' ', '')
        temp = temp.replace('-', '')
        if temp.isalpha():
            return user_input
        elif user_input == "":
            print("Please enter a value for this field.")
        else:
            print("Please enter alphabetic characters only.")


# prompts/verifies the user for a date
def verify_date(prompt):
    while True:
        user_input = input(prompt)
        try:
            datetime.datetime.strptime(user_input, '%Y-%m-%d')
            return user_input
        except ValueError:
            print("Incorrect data format, should be YYYY-MM-DD.")


# prompts/verifies the user for optional input
def verify_optional_input(prompt):
    while True:
        user_input = input(prompt)
        temp = user_input.replace(' ', '')
        temp = temp.replace('-', '')
        if temp == "" or temp.isalpha():
            return user_input
        else:
            print("Enter alphabetic characters only. Just press enter if you do not want to enter a value for this "
                  "field.")


cnx = make_connection()  # prompt the user for MySQL credentials and connect to the database
start_program()  # start our application
