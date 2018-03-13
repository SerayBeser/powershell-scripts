# #######################################
# SERAY BESER
#
# Send-PhishingMail
# Sending Phishing Email Program
# #######################################

param (
	[string]$server,
	[string]$serverPort, 
	[string]$from, 
	[string[]]$to, 
	[string]$subject, 
	[string]$body, 
	[string]$bodyPath,  	
	[string]$isbodyHtml,
	[string]$attachmentPath,
	[string]$operation,
	[switch]$help,
	[switch]$output,
	[string]$outputFile
 	
	)
	


if(!$outputFile)
{
	$outputFile = 'output.log'
}

if($outputFile)
{
	$output = $True
}

if($output)
{
	$Date = Get-Date
	"$Date [BEGIN] Sending Phishing Email Program "  | Out-File $outputFile
}

if($help)
{
	Write-Output "`n NAME`n	Send-PhishingMail"
	Write-Output "`n TOPIC`n	Send-PhishingMail Help System"
	Write-Output "`n SHORT DESCRIPTION`n	Send-PhishingMail Program sends phishing mail to the destination mail address(es)."

	Write-Output "`n LONG DESCRIPTION`n	Send-PhishingMail Program sends phishing mail to the 
	destination mail address(es). By default, there is a phishing mail in the program. However, 
	if you want to send another mail, you can do it with the -operation flag. <manuel> takes the 
	subject and the body from the user and sends it to the destination address(es). The program 
	has the ability to send mail to many people at the same time by using -to flag. (-to can get 
	a list) The program also allows you to send mail in html format at the same time. For this, 
	it is enough to mark the -isbodyHtml flag as true by taking the html formatted text's path 
	with the -bodyPath flag. Use the -attachmentPath flag to attach an attachment to the e-mail."

	Write-Output "`n SERVER`n	By default, server is smtp.gmail.com and server port is 587. 
	Use the -server and -serverPort to change the server settings."

	Write-Output "`n SYNTAX`n	./Send-PhishingMail.ps1 [-from] <string> [-to] <string[]> [-subject] <string> 
	[-body] <string> [-bodyPath] <string> [-isbodyHtml {None | True}] 
	[-attachmentPath] <string> [-operation {manuel | default}]  [<CommonParameters>]"
	
	Write-Output "`n OUTPUT`n	If you want to save the log file you can use the -output flag. Logs are saved in the 
	output.log file by default. Use -outputFile flag to save it in another file."

	Write-Output "`n VERSION`n	1.0.0"
	Write-Output "`n AUTHOR`n	Seray Beser"
	Write-Output "`n LICENSE`n	MIT License

	Copyright (c) 2018 Seray Beşer

	Permission is hereby granted, free of charge, to any person obtaining a copy of this software
	and associated documentation files (the `"Software`"), to deal in the Software without
	restriction, including without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
	Software is furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all copies or 
	substantial portions of the Software.

	THE SOFTWARE IS PROVIDED `"AS IS`", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
	INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
	PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR 
	ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
	ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
	SOFTWARE."
	
	exit
}

if (!$from)
{
	$from = Read-Host -Prompt '[INPUT]	Enter <from>'
	if($output)
	{
		$Date = Get-Date
		"$Date [INPUT] Getting input for <from>: $from"  | Out-File $outputFile -Append
	}
}


if (!$to)
{
	$toElement = Read-Host -Prompt '[INPUT]	Enter <to>'

	if($output)
	{
		$Date = Get-Date
		"$Date [INPUT] Getting input for <to>: $toElement"  | Out-File $outputFile -Append
	}

	$to += $toElement
	$i = 2

	while($toElement)
	{
		$toElement = Read-Host -Prompt "[INPUT]	Enter <to[$i]>"
		if($toElement)
		{
			$to += $toElement
			if($output)
			{
				$Date = Get-Date
				"$Date [INPUT] Getting input for <to[$i]>: $toElement"  | Out-File $outputFile -Append
			}
		}
		$i++
	}
}


if (!$subject -Or (!$body -And !$bodyPath))
{
	if(!$operation)
	{
		$operation = Read-Host -Prompt '[INPUT]	Enter <manuel or default>'

		if($output)
		{
			$Date = Get-Date
			"$Date [INPUT] Getting input for <operation>: $operation"  | Out-File $outputFile -Append
		}
	}	

	if ($operation -eq 'manuel')
	{
		$subject = Read-Host -Prompt '[INPUT]	Enter <subject>'
		$body = Read-Host -Prompt '[INPUT]	Enter <body>'
		Write-Output "`n[INFO] You input <subject>: '$subject', <body>: '$body' on '$Date'" 
		
		if($output)
		{
			$Date = Get-Date
			"$Date [INFO] You input <subject>: '$subject', <body>: '$body'"  | Out-File $outputFile -Append
		}
	}

	elseif	($operation -eq 'default')
	{
		$subject = "Hesabın Ele Gecirildi"
		$body = Get-Content 'body.txt'
		$isbodyHtml = 'True'
	}
	
	else
	{
		Write-Output "[ERROR]	Invalid Operation."
		Write-Output "[DONE]	Program Closed."
			if($output)
			{
				$Date = Get-Date
				"$Date [ERROR] Invalid Operation."  | Out-File $outputFile -Append
				"$Date [DONE] Program Closed."  | Out-File $outputFile -Append
			}
		exit
	}
}

# Default mail server settings
if (!$server -Or !$serverPort)
{
	$server = "smtp.gmail.com"
	$serverPort = 587
	
	if($output)
		{
			$Date = Get-Date
			"$Date [INFO] Default server is smtp.gmail.com."  | Out-File $outputFile -Append
			"$Date [DONE] Default server port is 587."  | Out-File $outputFile -Append
		}
}


# Set up server connection
$smtpClient = New-Object System.Net.Mail.SmtpClient $server, $serverPort
$smtpClient.EnableSsl = $true 
$smtpClient.UseDefaultCredentials = $false;

# Get user credentials
$password = Read-Host -Prompt "`n[INPUT]	Enter <password> for '$from'" -AsSecureString
$smtpClient.Credentials =  New-Object System.Net.NetworkCredential($from, $password)

if($output)
{
	$Date = Get-Date
	"$Date [INPUT] You input password for <$from> : ********"  | Out-File $outputFile -Append
}

 
if ($bodyPath -And !$body)
{
	$body = Get-Content $bodyPath
	if($output)
	{
		$Date = Get-Date
		"$Date [INFO] Getting Body in $bodyPath."  | Out-File $outputFile -Append
	}

}

try
{
	foreach ($toElement in $to) {

		if($toElement)
		{
			# Create mail message 
			$message = New-Object System.Net.Mail.MailMessage $from, $toElement, $subject, $body

			# Check body format
			if ($isbodyHtml)
			{
				$message.IsBodyHTML = $true
			}

			# Check attachment
			if ($attachmentPath)
			{
				$attachment = New-Object System.Net.Mail.Attachment $attachmentPath
				$message.Attachments.Add($attachment)
				if($output)
				{
					$Date = Get-Date
					"$Date [INFO] Attached $attachment."  | Out-File $outputFile -Append
				}
			}
			    

			Write-Output "`n[INFO]	Sending Phishing E-Mail to $toElement..."
			if($output)
				{
					$Date = Get-Date
					"$Date [INFO] Sending Phishing E-Mail to $toElement..."  | Out-File $outputFile -Append
				}

			try
			{
				# Send the message
				$smtpClient.Send($message)
				Write-Output "[INFO] Phishing E-Mail Sent."
				if($output)
				{
					$Date = Get-Date
					"$Date [INFO] Phishing E-Mail Sent."  | Out-File $outputFile -Append

				}
			}
			catch
			{
				# Write-Error $_
				Write-Output "[ERROR] Phishing E-Mail Send Failed."
				if($output)
				{
					$Date = Get-Date
					"$Date [ERROR] Phishing E-Mail Send Failed."  | Out-File $outputFile -Append
				}
			}	
		}
	}
}
catch
{

	Write-Output "[ERROR] Authentication Failed."
	if($output)
	{
		$Date = Get-Date
		"$Date [ERROR] Authentication Failed."  | Out-File $outputFile -Append

	}

}

Write-Output "[DONE]	Program Closed."
if($output)
{
	$Date = Get-Date
	"$Date [DONE] Program Closed."  | Out-File $outputFile -Append

}

