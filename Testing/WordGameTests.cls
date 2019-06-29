Class Testing.WordGameTests Extends Testing.UnitTests
{
Method TestWordScoreAPI()
{
   Set httprequest=##class(%Net.HttpRequest).%New()
   Set httprequest.Server="ec2-35-178-241-139.eu-west-2.compute.amazonaws.com"
   set httprequest.Port="52773"
   set httprequest.Username="_SYSTEM"
   set httprequest.Password="SYS"
   set word="UKPartnerDay2019"
   Do httprequest.Get("/WordGame/score/1234",0)
   If $IsObject(httprequest.HttpResponse) {
     ; Read the web page
     Do httprequest.HttpResponse.Data.Rewind()
     set JSONObjStr=httprequest.HttpResponse.Data.Read()
     set responseStr={}.%FromJSON(JSONObjStr)
     
   } Else {
     
     Set status = $$$ERROR($$$GeneralError,"API not working")
   }

	// assertion 1
	do $$$AssertEquals(responseStr."score",$LENGTH(word), "Correct Score")
	quit $$$OK
	
}
}