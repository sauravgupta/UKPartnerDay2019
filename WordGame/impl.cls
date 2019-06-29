/// REST backend for Scramble word game<br/>
/// Business logic class defined by OpenAPI in WordGame.spec<br/>
/// Updated Jun 29, 2019 18:25:23
Class WordGame.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Return the score for the provided word<br/>
/// The method arguments hold values for:<br/>
///     word<br/>
ClassMethod Score(word As %String) As %DynamicObject
{
	///This is a basic implementation
    Quit { "score": ($length(word))}
}

/// Add a word to the dictionary<br/>
/// The method arguments hold values for:<br/>
///     body<br/>
ClassMethod AddWord(body As %Stream.Object) As %Stream.Object
{
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
