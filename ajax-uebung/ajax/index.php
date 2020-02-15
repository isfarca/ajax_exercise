<?php
# ----------------------------------------------------------------------------
# ajax.js - einfaches ajax-framework für den Unterricht
# Created: 07.02.2019 15:11:50Z by rundfunk <at> pieli <dot> net
# Last Update: 07.02.2019 15:28:12Z by rundfunk <at> pieli <dot> net
# ----------------------------------------------------------------------------
# INIT: Die dB-Zugänge
# ----------------------------------------------------------------------------
	define('MYSQL_DB','bm');
	define('MYSQL_USER','root');
	define('MYSQL_PASS','');
	define('MYSQL_HOST','localhost');

# ----------------------------------------------------------------------------
# Verbindungsaufbau
# ----------------------------------------------------------------------------
	$dB = new PDO('mysql:host=' . MYSQL_HOST . ';dbname=' . MYSQL_DB . ';charset=utf8', MYSQL_USER, MYSQL_PASS) OR die('No MySQL!');

# ----------------------------------------------------------------------------
# Steuerung über GET-String
# ----------------------------------------------------------------------------
	$mode = '';
	if(isset($_GET['mode'])) {
		$mode = $_GET['mode'];
	}

# ----------------------------------------------------------------------------
# Entscheidung aH mode
# ----------------------------------------------------------------------------
	switch($mode) {
		case 'artikel':
			$sql = 'SELECT artikelnr,bezeichnung,preis FROM versand_artikel;';
			break;

		case 'kunden':
			$sql = 'SELECT kundennr,anrede,vorname,nachname FROM versand_kunden;';
			break;

		default:
			$sql = 'SELECT bestellnr,artikelnr,kundennr FROM versand_bestellungen;';
			break;
	}

# ----------------------------------------------------------------------------
# Query immer ausführen
# ----------------------------------------------------------------------------
	$stmt = $dB->prepare($sql);
	$stmt->execute();
	
# ----------------------------------------------------------------------------
# HTML zeichnen
# ----------------------------------------------------------------------------
	//~ echo '<table>';
	//~ $once = false;
	//~ foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
		//~ echo '<tr><td>';
		//~ echo implode('</td><td>',$row);
		//~ echo '</td></tr>';
		
	//~ }
	//~ echo '</table>';

# ----------------------------------------------------------------------------
# oder JSON ausgeben
# ----------------------------------------------------------------------------
	$out = $stmt->fetchAll(PDO::FETCH_ASSOC);
	echo json_encode($out);
