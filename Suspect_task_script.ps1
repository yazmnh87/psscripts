$taskids = cmd /c osql -E -S .\evault_db -d vault -Q "select taskid from task where status='2'"


$taskIDs = $taskIDs.Replace("taskid","")
$taskIDs = $taskIDs.Replace("-----------","")
$taskIDs = $taskIDs.Replace("(3 row affected)","")
$taskIDs = $taskIDs.Split("`n")
$taskIDs = $taskIDs.trim()
foreach($taskID in $taskIDs){

$taskID = $taskID.trim()
#$taskID 
if(!($taskID -like "*rows affected*"))
{

$taskID

cmd /c C:\Director\Prog\VVPoolOp.exe verifyidxall task $taskID

cmd /c C:\Director\Prog\vvpoolop.exe checkcrc task $taskID

}

}