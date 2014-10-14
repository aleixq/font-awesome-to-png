#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup
import re
import html

def getIcons():
    url= "http://fortawesome.github.io/Font-Awesome/cheatsheet/"
    r = requests.get(url)
    text=r.text
    #text=open("index.html")
    soup = BeautifulSoup(text)
    soup.findAll("div",attrs={"class":'col-md-4'})
    icons={}
    for link in soup.findAll("div",attrs={"class":'col-md-4'}): 
        rmalias=link.find("span",{"class":"muted"}).text
        code=re.sub(r'\[(.*);\]', r"\1", rmalias)
        ucode=html.unescape(code)
        icons[link.contents[2].strip()[3:]]=ucode
    return icons

