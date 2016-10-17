#comments with hashes

#print hello world
"hello world"

#change directories into "scripts"
cd scripts;


# for loop.  
# Variables start with a $ 
# less than is -le
# printing variables in quoted print line
for ($i=0;$i -le 10;$i++){

#	Write-Output $i;
	$squared = $i*$i;
	"$i squared is $squared";
}

#printing newline
""

#put contents of text file into variable
$file = type source.txt;

#foreach loop

foreach ($line in $file){"$line";}

#newline
""

#foreach loop to print file contents interspliced with arbitrary line
foreach ($line in $file){
    "Here's a line.";
    " $line";
}

#array of strings
$months = "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec";

#blanking out contents of output file
"" > .\output.txt


#taking each line of the file
foreach ($line in $file){

    #split the string into an list of variables based on the comma
    $name,$junk,$junk,$date = $line -split ",";
    #split one of the resulting variables above based on a slash
    $month,$day,$year = $date -split "/";

    #if the name has "Ma" in it, print "Hey!" without a newline
    if ($name -match "Ma"){
        write-host -nonewline "Hey! "
    
        }
    #add the appropriate sufix for the numerical day
    if ($day -match "11"){
        $day = $day+"th";
    }elseif ($day -match "12"){
        $day = $day+"th";
    }elseif ($day -match "1$"){
        $day = $day+"st";
    }elseif($day -match "2$"){
        $day = $day+"nd";
    }elseif($day -match "3$"){
        $day = $day+"rd";
    }else{
        $day = $day+"th";
    }

    #get month string from above array indexed on the numerical month
    $named_month = $months[$month-1];

    #print out to output file in a nice format
    "$name was born on $named_month $day $year" >> output.txt;
}


#gather some output text of an external command
$output = & ruby -h;

#print out command output interspliced with arbitrary text
foreach ($line in $output){
"here's a line"
"$line"
}

#set a variable based on the PATH environment variable accessed via the $env drive
$env_variable = $env:PATH;

#print out PATH and a newline
"$env_variable"
""

#tail -2 with "gc" (get contents)
gc source.txt | select -last 2
#head -1 with "gc" (get contents)
gc .\source.txt | select -first 1

#bring up output file in notepad
notepad.exe .\output.txt
