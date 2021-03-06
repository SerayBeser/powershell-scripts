# Send-PhishingMail 
----------------------------------------------------------------------------------------------------------------------

Send-PhishingMail Program sends phishing mail to the destination mail address(es).

__[WARNING]__ By default, server is smtp.gmail.com and server port is 587. If you use gmail to send phishing mail, you need to change your security settings here : https://myaccount.google.com/lesssecureapps.

If you do not use gmail please use the -server and -serverPort to change the server settings.

__Send-PhishingMail__ Program sends phishing mail to the  destination mail address(es). By default, there is a phishing mail in the program. However, if you want to send another mail, you can do it with the -operation flag. -opeartion <manuel> takes the  subject and the body from the user and sends it to the destination address(es). The program  has the ability to send mail to many people at the same time by using -to flag. (-to can get a list) The program also allows you to send mail in html format at the same time. For this, it is enough to mark the -isbodyHtml flag as true by taking the html formatted text's path with the -bodyPath flag. Use the -attachmentPath flag to attach an attachment to the e-mail.

All the informations and errors are given as a output. Program will produce you a 'output.log' log file. If you want to use another output file please use the -output and -outputFile.

## [FOR WINDOWS] 

#### [HELP] run $.\Send-PhishingMail -help

User can use this command to get informations about how to use. This command will show you parameters.

 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/7.png)
 
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/8.png)

#### [SEND DEFAULT PHISHING MAIL] run $.\Send-PhishingMail

 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/1.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/2.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/3.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/4.png)

#### [SEND MANUEL PHISHING MAIL] run $.\Send-PhishingMail

 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/5.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/6.png)

#### [SEND DEFAULT PHISHING MAIL via FLAGS] run $.\Send-PhishingMail -from <from> -to <to> -operation <default | manuel>

 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/9.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/10.png)

## [FOR LINUX] 

#### [INSTALLATION POWERSHELL] $ sudo apt install powershell

 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/a1.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/a2.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/a3.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/a4.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/a5.png)
 ![alt text](https://github.com/SerayBeser/powershell-scripts/blob/master/screenshots/a6.png)



##### NAME	Send-PhishingMail

.

##### TOPIC	Send-PhishingMail Help System

.

##### SHORT DESCRIPTION	

Send-PhishingMail Program sends phishing mail to the destination mail address(es).

##### LONG DESCRIPTION	

Send-PhishingMail Program sends phishing mail to the 
destination mail address(es). By default, there is a phishing mail in the program. However, 
if you want to send another mail, you can do it with the -operation flag. <manuel> takes the 
subject and the body from the user and sends it to the destination address(es). The program 
has the ability to send mail to many people at the same time by using -to flag. (-to can get 
a list) The program also allows you to send mail in html format at the same time. For this, 
it is enough to mark the -isbodyHtml flag as true by taking the html formatted text's path 
with the -bodyPath flag. Use the -attachmentPath flag to attach an attachment to the e-mail.

##### SERVER
	
By default, server is smtp.gmail.com and server port is 587. 
Use the -server and -serverPort to change the server settings.

##### SYNTAX	

./Send-PhishingMail.ps1 [-from] <string> [-to] <string[]> [-subject] <string> 
[-body] <string> [-bodyPath] <string> [-isbodyHtml {None | True}] 
[-attachmentPath] <string> [-operation {manuel | default}]  [<CommonParameters>]
	
##### OUTPUT

If you want to save the log file you can use the -output flag. Logs are saved in the 
output.log file by default. Use -outputFile flag to save it in another file.

##### VERSION	
	
1.0.0
	
##### AUTHOR	
	
Seray Beser
	
##### LICENSE

MIT License

Copyright (c) 2018 Seray Beşer
Permission is hereby granted, free of charge, to any person obtaining a copy of this software
and associated documentation files (the "Software"), to deal in the Software without	
restriction, including without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or 
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.

	
