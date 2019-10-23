<?php
	date_default_timezone_set('Australia/Perth');

	//	include_once 'inc/connect.php';
	/*** Define database parameters here */
	ini_set('memory_limit','3000M');
	ini_set('max_execution_time','300');
	ini_set('max_allowed_packet','100M');
	define("DB_USER", 'root');
	define("DB_PASSWORD", 'mysql');
	define("DB_NAME", 'swliveDB');
	define("DB_HOST", 'localhost');
	/*define("OUTPUT_DIR", '//TSA-APP02/www/stbase/DBbackups/');*/
	define("OUTPUT_DIR", 'C:/Users/PC/Desktop/renderDB');
	define("TABLES", '*');
	 
	/**
	 * Instantiate Backup_Database and perform backup
	 */

	$backupDatabase = new Backup_Database();
	$status = $backupDatabase->backupTables(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, TABLES, OUTPUT_DIR) ? 'OK' : 'KO';
	//echo "<br /><br /><br />Backup result: ".$status;
	//exit;
	if($status == 'OK') 
	{ 
		$response = "Data-Base Backup Created successfull.";
		echo('<script type="text/javascript">alert("' . $response . '"; </script>');
		
		header('Location:dashboard.php'); 
	}
	else if($status == 'KO')
	{
		exit('Try again...!!!! process not successfull.<br>click <a href="dashboard.php">Here</a> to continue');
	}
				
	/**
	 * The Backup_Database class
	 */
	class Backup_Database {
		/**
		 * Host where database is located
		 */
		var $host = '';
	 
		/**
		 * Username used to connect to database
		 */
		var $username = '';
	 
		/**
		 * Password used to connect to database
		 */
		var $passwd = '';
	 
		/**
		 * Database to backup
		 */
		var $dbName = '';
	 
		/**
		 * Database charset
		 */
		var $charset = '';
	 
		/**
		 * Constructor initializes database
		 */
		/*function Backup_Database($host, $username, $passwd, $dbName, $charset = 'utf8')
		{
			$this->host     = $host;
			$this->username = $username;
			$this->passwd   = $passwd;
			$this->dbName   = $dbName;
			$this->charset  = $charset;
	 
			$this->initializeDatabase();
		}
	 
		protected function initializeDatabase()
		{
			$conn = mysqli_connect($this->host, $this->username, $this->passwd, $this->dbName);

			if (! mysqli_set_charset($conn,$this->charset))
			{
				mysqli_query($conn,'SET NAMES '.$this->charset);
			}
				
					
					
			}*/
	 
		/**
		 * Backup the whole database or just some tables
		 * Use '*' for whole database or 'table1 table2 table3...'
		 * @param string $tables
		 */
		public function backupTables($host, $username, $passwd, $dbName, $tables = '*', $outputDir = '.', $charset = 'utf8')
		{	
			
					$this->host     = $host;
			$this->username = $username;
			$this->passwd   = $passwd;
			$this->dbName   = $dbName;
			$this->charset  = $charset;
			
			$conn = mysqli_connect($this->host, $this->username, $this->passwd, $this->dbName);

			if (! mysqli_set_charset($conn,$this->charset))
			{
				mysqli_query($conn,'SET NAMES '.$this->charset);
			}
					
					
			try
			{
				
				/* DATABASE - BACKUP - LOG */
				mysqli_query($conn,"INSERT INTO dbbakcup_log SET dateID = '".date('Y-m-d')."' , timeID = '".date('h : i : A')."' ");
						
				/**
				* Tables to export
				*/
				if($tables == '*')
				{
					$tables = array();
					$result = mysqli_query($conn,'SHOW TABLES');
					while($row = mysqli_fetch_row($result))
					{
						$tables[] = $row[0];
					}
				}
				else
				{
					$tables = is_array($tables) ? $tables : explode(',',$tables);
				}
	 
				$sql = 'CREATE DATABASE IF NOT EXISTS '.$this->dbName.";\n\n";
				$sql .= 'USE '.$this->dbName.";\n\n";
	 
				/**
				* Iterate tables
				*/
				foreach($tables as $table)
				{
					//echo "Backing up ".$table." table...";
	 
					$result 		= mysqli_query($conn,'SELECT * FROM '.$table);
					$numFields = mysqli_num_fields($result);
	 
					$sql .= 'DROP TABLE IF EXISTS '.$table.';';
					$row2 = mysqli_fetch_row(mysqli_query($conn,'SHOW CREATE TABLE '.$table));
					$sql.= "\n\n".$row2[1].";\n\n";
	 
					for ($i = 0; $i < $numFields; $i++)
					{
						while($row = mysqli_fetch_row($result))
						{
							$sql .= 'INSERT INTO '.$table.' VALUES(';
							for($j=0; $j<$numFields; $j++)
							{
								$row[$j] = addslashes($row[$j]);
								$row[$j] = @ereg_replace("\n","\\n",$row[$j]);
								if (isset($row[$j]))
								{
									$sql .= '"'.$row[$j].'"' ;
								}
								else
								{
									$sql.= '""';
								}
	 
								if ($j < ($numFields-1))
								{
									$sql .= ',';
								}
							}
	 
							$sql.= ");\n";
						}
					}

	 
					$sql.="\n\n\n";
	 
					//echo " OK" . "<br />";
				}
			}
			catch (Exception $e)
			{
				var_dump($e->getMessage());
				return false;
			}
	 
			return $this->saveFile($sql, $outputDir);
		}
	 
		/**
		 * Save SQL to file
		 * @param string $sql
		 */
		protected function saveFile(&$sql, $outputDir = '.')
		{
			if (!$sql) return false;
	 
			try
			{
				
				
				$handle = fopen($outputDir.'/DB_Backup('.$this->dbName.'-'.date("Y-m-d-His", time()).').sql','w+');				
				fwrite($handle, $sql);
				fclose($handle);
			}
			catch (Exception $e)
			{
				var_dump($e->getMessage());
				return false;
			}
	 
			return true;
		}
}
?>
