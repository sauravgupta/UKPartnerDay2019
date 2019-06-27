/// REST backend for Scramble word game<br/>
/// Business logic class defined by OpenAPI in WordGame.spec<br/>
/// Created Jun 27, 2019 11:21:22
Class WordGame.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Return the score by counting the number of letters in the provided word<br/>
/// The method arguments hold values:<br/>
/// word<br/>
ClassMethod Score(word As %String) As %DynamicObject
{
	///This is a basic implementation
    Quit { "score": ($length(word))}
}

}
