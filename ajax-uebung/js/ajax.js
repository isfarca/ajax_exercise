/*
 * ajax.js - einfaches ajax-framework fĆ¼r den Unterricht
 * Created: 07.02.2019 15:11:50Z by rundfunk <at> pieli <dot> net
 * Last Update: 10.12.2019 by rundfunk <at> pieli <dot> net
 * version 2
 */

ajax = {
	mem : {
		hiddenFields : {
			artikel : [],
			kunden : ['anrede'],
			bestellungen : [],
		},
	},

	JSON : function(id,callback) { // der AJAX-Abholer
		var xobj = new XMLHttpRequest()
		xobj.overrideMimeType("application/json")
		var url = 'ajax/?mode=' + id
		//~ console.log("ajax.JSON called w/query",url)
		xobj.open("GET", url, true)
		xobj.onreadystatechange = function () {
			if (xobj.readyState == 4 && xobj.status == "200") {
				callback(id, xobj.responseText)
			}
		}
		xobj.send(null)
	},

	baue : {
		// neue Tabellenkoepfe: Wir huepfen einmal durchs object
		kopp : function(t,id,data) { // baut die Tabellenkoepfe lebend am erhaltenen Objekt
			var zeile = document.createElement('TR')
			var versteckt = ajax.mem.hiddenFields[id]
			for(var i=0;i<Object.keys(data[0]).length;i++) {
				var aName = Object.keys(data[0])[i]
				if(versteckt.indexOf(aName) != -1) continue
				var feld = document.createElement('TH')
				feld.innerHTML = aName
				zeile.appendChild(feld)
			}
			t.appendChild(zeile)
		},

		tabelle : function(id,text) { // baut die ganze tabelle aH id, callback
			// der responseText muss immer erst geparsed werden, sonst ist er kein Array!
			data = JSON.parse(text)

			var versteckt = ajax.mem.hiddenFields[id]
			var tabelle = document.createElement('TABLE') // ja, es sind tabellarische Daten
			tabelle.id = 'ajax-table'
			ajax.baue.kopp(tabelle,id,data) // Eine Tabelle sollte einen Kopf haben

			for(var i=0;i<data.length;i++) { // FĆ¼r jeden Datensatz
				var zeile = document.createElement('TR') // eine neue tr
				for(var j=0;j<Object.keys(data[i]).length;j++) { // FĆ¼r jedes Feld
					var feldTitel = Object.keys(data[i])[j]
					if(versteckt.indexOf(feldTitel) != -1) continue
					var feldWert = data[i][feldTitel]
					var feld = document.createElement('TD') // eine neue td
					feld.innerHTML = feldWert // Feld-Wert kommt in die td
					zeile.appendChild(feld) // td wird an Zeile angeklebt
				}
				tabelle.appendChild(zeile) // zeile wird an tabelle angeklebt
			}

			var body = document.querySelector('BODY')
			body.appendChild(tabelle) // tabelle wird an body angeklebt
		},
	},


	init : function() {
		// das sind alles _asynchrone_ Anfragen, wir malen die tabelle, wenn wir damit fertig sind.
		// Dadurch kann es dazu kommen, dass diese Reihenfolge nicht eingehalten wird
		// Ansonsten sind die Zeichner autonom
		ajax.JSON('bestellungen',ajax.baue.tabelle)
		ajax.JSON('artikel',ajax.baue.tabelle)
		ajax.JSON('kunden',ajax.baue.tabelle)
	},
}

// Die Initialisierung nicht vergessen
ajax.init()