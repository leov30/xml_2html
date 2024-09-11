@echo off

cd /d "%~dp0"
set _xml=c:/_bin\xml.exe

set "_ingames=http://adb.arcadeitalia.net/media/mame.current/ingames/"
set "_titles=http://adb.arcadeitalia.net/media/mame.current/titles/"
set "_flyers=http://adb.arcadeitalia.net/media/mame.current/flyers/"


type head.html>"%~n1.html"

(echo ^<form name="addtext" onsubmit="return downloadData(this);"^>) >>"%~n1.html"

%_xml% sel --text --template --match "//machine[not(@cloneof)]|//game[not(@cloneof)]"^
 --value-of "concat('<input type=\"checkbox\" name=\"',@name,'\">','<b>',description,' [',@name,']','</b>','&ensp;<input type=\"submit\" onClick=\"addTextTXT();\" value=\"Gamelist\"><br>')" --nl^
 --output "<table><tr>" --nl^
 --value-of "concat('<td><b>Sourcefile: </b>',@sourcefile,'<br>','<b>Bios: </b>',@romof,'<br>','<b>Status: </b>',driver/@status,'<br>','<b>Manufacturer: </b>',manufacturer,'<br>','<b>Year: </b>',year,'<br></td>')" --nl^
 --value-of "concat('<td><img src=\"%_ingames%',@name,'.png\" loading=\"lazy\"></td>')" --nl^
 --value-of "concat('<td><img src=\"%_titles%',@name,'.png\" loading=\"lazy\"></td>')" --nl^
 --output "</tr></table>" --nl "%~1" >>"%~n1.html"

(echo ^</form^>
echo ^</body^>
echo ^</html^>) >>"%~n1.html"


 REM --value-of "concat('<td><b>Sourcefile: </b>',@sourcefile,'<br>','<b>Bios: </b>',@romof,'<br>','<b>Sampleof: </b>',@sampleof,'<br>','<b>Cloneof: </b>',@cloneof,'<br>','<b>Status: </b>',driver/@status,'<br>','<b>Manufacturer: </b>',manufacturer,'<br>','<b>Year: </b>',year,'<br></td>')" --nl^
