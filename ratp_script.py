#!/usr/bin/env python3

import urllib.request
import json
import sys
import time

def	errors(err_code):
    if (err_code == 0):
        print("Error: invalid number of arguments.")
    if (err_code == 1):
        print("Error: invalid request.")
    if (err_code == 2):
        print("Error: Invalid destination.")
    print("options:\n\t[1] home->school\n\t[2] school->home\nonly one may be specified at a time.")
    exit()

def	run_script(direction):
    if (direction == "home"):
    	url	 = "https://api-ratp.pierre-grimaud.fr/v4/schedules/tramways/3b/marie+de+miribel/R"
    elif (direction == "school"):
        url	 = "https://api-ratp.pierre-grimaud.fr/v4/schedules/tramways/3b/honore+de+balzac/A"
    url_response = urllib.request.urlopen(url)
    json_data	 = json.loads(url_response.read())
    #print(json_data);
    print("====================================================")
    print("====================== TRAM 1 ======================")
    print("====================================================")
    print(json_data["result"]["schedules"][0]["destination"])
    print(json_data["result"]["schedules"][0]["message"])
    print("====================================================")
    print("====================== TRAM 2 ======================")
    print("====================================================")
    print(json_data["result"]["schedules"][1]["destination"])
    print(json_data["result"]["schedules"][1]["message"])    
    return (0)

def	main(ac, av):
    if (ac != 2):
        errors(1)
    if (av[1] in ["school", "home"]):
        for i in range(15):
            run_script(av[1])
            time.sleep(60)
    else:
        errors(2)
    return (0)

if __name__ == "__main__":
    main(len(sys.argv), sys.argv)
