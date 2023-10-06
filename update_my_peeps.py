#!/usr/bin/python

import smtplib
import sys
from string import Template
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

def	read_message_template(filename):
    with open(filename, mode="r", encoding="utf-8") as message_template:
        message_template_content = message_template.read()
    return (Template(message_template_content))

def	get_peeps(filename):
    names = []
    emails = []
    with open(filename, mode='r') as peeps_file:
        for peep in peeps_file:
            names.append(peep.split()[0])
            emails.append(peep.split()[1])
    return (dict(zip(names, emails)))

def	setup_smtp():
    s = smtplib.SMTP(host="example@example.com", port=420) #enter mail service and port
    s.starttls()
    s.login() # (email, password)
    return (s)

def	send_mail(smtp_obj, email_name_dict, message_template):
    print ("Message sent to:")
    for keys in email_name_dict.keys():
        msg_object = MIMEMultipart()
        edited_message_content = message_template.substitute(PERSON_NAME=keys)
        msg_object['From']= #enter your e-mail address here
        msg_object['To']=email_name_dict[keys]
        msg_object['Subject']="HERE BE A MAIL!"
        msg_object.attach(MIMEText(edited_message_content, 'plain'))
        smtp_obj.send_message(msg_object)
        print ("\t-> ", email_name_dict[keys])
        del msg_object

def	main(ac, av):
    if (ac != 3):
        print ("Usage: ./update_my_peeps.py [mailing_list.txt] [message_file.txt]")
        exit (0)
    a = get_peeps(av[1])
    print ("got names and emails ...")
    message = read_message_template(av[2])
    print ("read mesage template ...")
    s = setup_smtp()
    print ("smtp object created  ...")
    send_mail(s, a, message)
    print ("Done. Bye!")
    return (0)

if __name__ == "__main__":
    main(len(sys.argv), sys.argv)
