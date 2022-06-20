/**
 * Migration to Latest
 **/
component  aliases='wheels db reset'  extends="../base"  {

	/**
	 * 
	 **/
	function run() {
		var DBMigrateInfo=$sendToCliCommand();
		print.line("Resetting Database Schema");
		command('wheels dbmigrate exec version=0').run();
		command('wheels dbmigrate info').run();
	}

}