$root = Get-Location
$csv = Import-Csv -Path '.\GFG Logic Building Programs - C++ Problems Tracker.csv'

function Convert-ToKebab([string]$text) {
    if ([string]::IsNullOrWhiteSpace($text)) { return 'program' }
    $s = $text.ToLowerInvariant()
    $s = $s -replace '&', ' and '
    $s = $s -replace '\+', ' plus '
    $s = $s -replace '\*', ' multiply '
    $s = $s -replace '/', ' '
    $s = $s -replace '[^a-z0-9]+', '-'
    $s = $s -replace '-{2,}', '-'
    return $s.Trim('-')
}

function Get-Description([string]$title) {
    $t = $title.ToLowerInvariant()
    if ($t -match 'hello') { return 'Prints a greeting message to the console.' }
    if ($t -match 'sum') { return 'Computes the sum of the provided values.' }
    if ($t -match 'swap') { return 'Swaps the provided values using the appropriate logic.' }
    if ($t -match 'size') { return 'Displays the size of the requested data types.' }
    if ($t -match 'interest') { return 'Calculates the required interest value.' }
    if ($t -match 'area|perimeter|rectangle') { return 'Calculates the rectangle dimensions and related values.' }
    if ($t -match 'even|odd') { return 'Checks whether the number is even or odd.' }
    if ($t -match 'largest') { return 'Finds the largest of the given values.' }
    if ($t -match 'vowel|consonant') { return 'Checks whether the character is a vowel or consonant.' }
    if ($t -match 'leap') { return 'Checks whether the given year is a leap year.' }
    if ($t -match 'table') { return 'Prints the multiplication table for the given number.' }
    if ($t -match 'natural') { return 'Computes the sum of natural numbers.' }
    if ($t -match 'factorial') { return 'Calculates the factorial of the given number.' }
    if ($t -match 'reverse') { return 'Reverses the given input using the appropriate logic.' }
    if ($t -match 'gcd|lcm') { return 'Finds the greatest common divisor or least common multiple.' }
    if ($t -match 'palindrome') { return 'Checks whether the input is a palindrome.' }
    if ($t -match 'prime') { return 'Checks whether the given number is prime.' }
    if ($t -match 'armstrong') { return 'Checks whether the given number is an Armstrong number.' }
    if ($t -match 'fibonacci') { return 'Generates or computes Fibonacci-related values.' }
    if ($t -match 'power') { return 'Calculates the power of the given base and exponent.' }
    if ($t -match 'factor') { return 'Finds the factors of the given number.' }
    if ($t -match 'calculator') { return 'Performs basic arithmetic operations based on user input.' }
    if ($t -match 'pattern|pyramid|triangle|diamond|floyd|pascal') { return 'Prints the requested pattern to the console.' }
    if ($t -match 'array') { return 'Works with arrays using the required logic.' }
    if ($t -match 'matrix') { return 'Performs matrix operations using the required logic.' }
    if ($t -match 'pointer') { return 'Demonstrates pointer concepts in C++.' }
    if ($t -match 'string') { return 'Manipulates strings using the required logic.' }
    if ($t -match 'binary|octal|decimal|hex|boolean|double|long|char|int') { return 'Performs the requested conversion operation.' }
    if ($t -match 'structure|class|object|inheritance|encapsulation|polymorphism|friend|virtual|abstract|singleton|interface') { return 'Demonstrates the requested OOP concept.' }
    if ($t -match 'vector|map|set|stack|multiset|transform|permutation|sort|search|next greater|greater element') { return 'Uses STL containers or algorithms to solve the task.' }
    if ($t -match 'file') { return 'Handles file input and output operations.' }
    if ($t -match 'exception') { return 'Demonstrates exception handling in C++.' }
    if ($t -match 'date|time|calendar') { return 'Works with dates and time values.' }
    if ($t -match 'random|console|namespace|header|xor|quotient|remainder|roots|sizeof') { return 'Solves the problem using the appropriate logic.' }
    return 'Solves the problem using the appropriate logic.'
}

$currentCategory = $null
$updated = 0
$skipped = 0

foreach ($row in $csv) {
    if (-not [string]::IsNullOrWhiteSpace($row.Category)) {
        $currentCategory = $row.Category.Trim()
    }

    $problemTitle = $row.'Problem Name'.Trim()
    $folderPath = Join-Path $root $currentCategory
    if (-not (Test-Path $folderPath)) { New-Item -ItemType Directory -Path $folderPath -Force | Out-Null }

    $fileName = Convert-ToKebab $problemTitle
    $filePath = Join-Path $folderPath ($fileName + '.cpp')

    if (-not (Test-Path $filePath)) { continue }

    $content = Get-Content -Path $filePath -Raw
    if ($content -match '^[\s\r\n]*\/\*\s*Program:') {
        $skipped++
        continue
    }

    $description = Get-Description $problemTitle
    $comment = "/*`nProgram: $problemTitle`nDescription: $description`n*/`n`n"
    $newContent = $comment + $content.TrimStart()
    Set-Content -Path $filePath -Value $newContent -Encoding UTF8
    $updated++
}

"Updated files: $updated"
"Skipped files (already had top comment): $skipped"
