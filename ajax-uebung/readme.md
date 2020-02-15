Arbeitsanweisung: So laeufts!

0. uwamp angucken (https://www.uwamp.com/de/), evtl auf eigenen Stick installieren

1. adminer, das schoenere phpmyadmin runterladen und
1.1. in index.php umbenennen
1.2. in Ordner adminer speichern

2. SQL importieren:
2.1. im Ordner sql liegt eine sql, im Editor oeffnen
2.2. Inhalt der Datei in die Zwischenablage kopieren

3.1. Webserver + DB starten starten, http://localhost/adminer aus 1. aufrufen
3.2. Einloggen mit
     u:root
     p:root
3.3. Datenbank anlegen (meine heisst bm)
3.4. SQL ausführen auswaehlen, sql aus Zwischenablage in die Textarea eingeben, absenden
     Du solltest jetzt drei Tabellen haben:
     versand_kunden
     versand_artikel
     versand_bestellungen

4.   Den Rest (Ordner + index.html) in passenden Ordner (zB /ajax-uebung)im Webserver kopieren.
4.1. index.html im Browser anschauen
4.2. Herausfinden, warum es nicht funktioniert, fixen

5. Freuen (fertich)!
