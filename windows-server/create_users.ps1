Import-Module ActiveDirectory

# Specify the path to the CSV file containing user information
$csvFilePath = "C:\users.csv"

# Read the CSV file
$users = Import-Csv -Path $csvFilePath

# Specify the path to the dictionary file
$dictionaryFilePath = "C:\dictionary.txt"

# Read the dictionary file
$dictionary = Get-Content -Path $dictionaryFilePath

# Iterate through each user in the CSV file
foreach ($user in $users) {
    $firstName = $user.FirstName
    $surname = $user.Surname
    
    # Generate a username by combining the first letter of the first name and the surname
    $username = ($firstName[0] + $surname).ToLower()
    
    # Generate a password
    $password = ""
    if ((Get-Random -Minimum 0 -Maximum 2) -eq 0) {
        # Use a dictionary word as the password
        $password = $dictionary | Get-Random
    } else {
        # Generate a complex password
        $passwordLength = Get-Random -Minimum 4 -Maximum 7
        $password = ([char[]]([char]33..[char]95) + ([char[]]([char]97..[char]126)) + 0..9 | Sort-Object {Get-Random})[0..$passwordLength] -join ''
    }
    
    # Create the user in Active Directory
    New-ADUser -Name "$firstName $surname" -GivenName $firstName -Surname $surname -SamAccountName $username -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) -Enabled $true
    
    # Output the user information
    Write-Output "Created user: $firstName $surname ($username) with password: $password"
}
