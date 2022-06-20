/**
 * wheels db create table
 * 
 * wheels dbmigrate create table [name] [force] [id] [primaryKey]
 * | Parameter  | Required | Default | Description                                         |
 * | ---------- | -------- | ------- | --------------------------------------------------- |
 * | name       | true     |         | The name of the database table to create            |
 * | force      | false    | false   | Force the creation of the table                     |
 * | id         | false    | true    | Auto create ID column as autoincrement ID           |
 * | primaryKey | false    | ID      | Overrides the default primary key column name       |
 * 
 **/
 component aliases='wheels db create table' extends="../../base"  {

	/**
	 * I create a migration file in /db/migrate
	 *
	 * Usage: wheels dbmigrate create table [name] [force] [id] [primaryKey]
	 * @name.hint The Object Name
	 * @force.hint Force Creation
	 * @id.hint Auto create ID column as autoincrement ID
	 * @primaryKey.hint overrides default primary key name
	 **/
	function run(
		required string name,
		boolean force    = false,
		boolean id 		 = true,
		string primaryKey="id") {

		// Get Template
		var content=fileRead(getTemplate("dbmigrate/create-table.txt"));

		// Changes here
		content=replaceNoCase(content, "|tableName|", "#name#", "all");
		content=replaceNoCase(content, "|force|", "#force#", "all");
		content=replaceNoCase(content, "|id|", "#id#", "all");
		content=replaceNoCase(content, "|primaryKey|", "#primaryKey#", "all");

		// Make File
		 $createMigrationFile(name=lcase(trim(arguments.name)),	action="create_table",	content=content);
	}
}