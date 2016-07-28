/**
*
* {code:bash}
* wheels test app [servername] [reload] [debug]
* {code} 
* 
**/
component extends="base" {
	property name='serverService' inject='ServerService';  

	/**
	* @servername.hint Choose alternative server if not default
	* @reload.hint Force Reload
	* @debug.hint Output passing tests as well as failing ones
	*/
	function run(string servername="", boolean reload=true, boolean debug=false) { 
	 	var suite=$buildTestSuite("app", arguments.servername, arguments.reload, arguments.debug);
				  $outputSuiteVariables(suite);
				  //$runTestSuite(suite);
	}

}
