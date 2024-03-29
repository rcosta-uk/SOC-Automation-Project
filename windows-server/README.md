# Here is  how the script works:

- The Active Directory module is imported to enable user creation in Active Directory.

-  The path to the CSV file containing user information is specified. The CSV file should have two columns: "FirstName" and "Surname".

-  The CSV file is read using the Import-Csv cmdlet, and the user information is stored in the $users variable.

-  The path to a dictionary file is specified. This file should contain a list of dictionary words, one word per line.

-  The dictionary file is read using the Get-Content cmdlet, and the words are stored in the $dictionary variable.

-  The script iterates through each user in the CSV file.

-  For each user, the script generates a username by combining the first letter of the first name and the surname, converted to lowercase.

-  The script generates a password using one of two methods:

-  If a random number between 0 and 1 is 0, a random dictionary word is selected as the password.

-  If the random number is 1, a complex password is generated using a combination of ASCII characters and digits, with a length between 4 and 6 characters.

-  The New-ADUser cmdlet is used to create the user in Active Directory with the specified first name, surname, username, and password.

-  The script outputs the created user information, including the first name, surname, username, and password.

-  Make sure to replace "C:\users.csv" with the actual path to your CSV file containing user information, and "C:\dictionary.txt" with the path to your dictionary file.

Note: This script assumes that you have the necessary permissions to create users in Active Directory and that the Active Directory module is available on your Windows Server 2019.

# To run the PowerShell 

This script will create users in Active Directory based on a CSV file and generates passwords using a dictionary, follow these steps:

1.  Save the PowerShell script in a file with a .ps1 extension, for example, create_users.ps1.

2.  Save the users.csv file containing the user information in a location accessible by the script. Make sure the file has two columns: "FirstName" and "Surname".

3.  Save the dictionary.txt file containing the dictionary words in a location accessible by the script.

4.  Open PowerShell with administrative privileges:
      -  Press the Windows key + X and select "Windows PowerShell (Admin)" from the menu.

5.  Navigate to the directory where the PowerShell script is saved using the cd command. For example:

```bash
cd C:\script
```

6.  If PowerShell script execution is restricted, you may need to change the execution policy. Run the following command to allow script execution:

```bash
Set-ExecutionPolicy RemoteSigned
```

Press "Y" and then Enter to confirm the change.

7.  Run the PowerShell script by entering the script filename:

```bash
.\create_users.ps1
```

8.  The script will start executing and will create the users in Active Directory based on the information provided in the users.csv file. It will generate passwords using the dictionary words from dictionary.txt or complex passwords, as defined in the script.

9.  The script will output the created user information, including the first name, surname, username, and password for each user.

Note: Make sure to review and modify the script according to your specific requirements before running it. Ensure that you have the necessary permissions to create users in Active Directory and that the Active Directory module is available on your Windows Server 2019.

Also, be cautious when running scripts with administrative privileges and ensure that you understand the script's functionality and trust its source before executing it.
