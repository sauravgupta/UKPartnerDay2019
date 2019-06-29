///Unit Testing changes
Class Testing.UnitTests Extends %UnitTest.TestCase
{
Property Duration As %Time;

Property Lines As %Integer;

Property Globals As %Integer;

Property SystemCPUTime As %Integer;

Property UserCPUTime As %Integer;

Property DiskReadTime As %Integer;

ClassMethod Run(logging as %Boolean = 0){
	set testSuite = "WordGameTests"
    
    // set up ^UnitTestRoot if not already set
    if '$data(^UnitTestRoot) {
    	set mainFolder = "UnitTests\WordGameTests\" 
	    set st = ##class(%File).CreateDirectoryChain(mainFolder _ testSuite)
	    if $$$ISOK(st) { set ^UnitTestRoot = mainFolder }
	    else { write !, "UnitTestRoot folder could not be created. Consult with instructor." }
    }
    
    set testCase = ..%ClassName(1) // this test case
    set test = testSuite _ ":" _ testCase
	set quals = "/noload/norecursive/nodelete"
	set params("Logging") = logging
    do ##class(%UnitTest.Manager).RunTest(test, quals, .params)
    return
}
/// initialize performance counters
Method OnBeforeOneTest(testname As %String) As %Status
{
	return:(..Manager.UserFields.GetAt("Logging") = 0) $$$OK
	set ..Duration = $zh
	set ..Lines = $system.Process.LinesExecuted()
	set ..Globals = $system.Process.GlobalReferences()
	set ..SystemCPUTime = $piece($system.Process.GetCPUTime(), ",", 1)
	set ..UserCPUTime = $piece($system.Process.GetCPUTime(), ",", 2)
	do $system.Process.ResetDiskReadTiming()
	do $system.Process.EnableDiskReadTiming()
	return $$$OK
}

/// Finalize performance counters, and add message to test log. 
/// This is where you could also add code to save the counters to a separate table for analysis.
Method OnAfterOneTest(testname As %String) As %Status
{
	return:(..Manager.UserFields.GetAt("Logging") = 0) $$$OK
	set ..Duration = $zh - ..Duration
	set ..Lines = $system.Process.LinesExecuted() - ..Lines
	set ..Globals = $system.Process.GlobalReferences() - ..Globals
	set ..SystemCPUTime = $piece($system.Process.GetCPUTime(), ",", 1) - ..SystemCPUTime
	set ..UserCPUTime = $piece($system.Process.GetCPUTime(), ",", 2) - ..UserCPUTime
	set ..DiskReadTime = $system.Process.DiskReadMilliseconds()
	do $system.Process.DisableDiskReadTiming()
	
	set msg = "Performance: " _
	          "Duration: " _           ..Duration _
	          ", Lines: " _            ..Lines _
	          ", Globals: " _          ..Globals _
	          ", System CPU Time: " _ (..SystemCPUTime / 1000) _
	          ", User CPU Time: " _   (..UserCPUTime / 1000) _
	          ", Disk Read Time: " _  (..DiskReadTime / 1000)
	do $$$LogMessage(msg)
	return $$$OK
}
}