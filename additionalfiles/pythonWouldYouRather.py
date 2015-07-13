import requests
import csv
from bs4 import BeautifulSoup

url = 'http://www.enkivillage.com/would-you-rather-questions.html'
response = requests.get(url)
html = response.content

soup = BeautifulSoup(html)

# print(soup.prettify().encode('cp850',errors='ignore'))
questionslist = soup.findAll('div', {"class" : "anchor panel panel-default steps-panel"})

all_questions = []

for question in questionslist:
    all_questions.append(question.get_text().encode('cp850',errors='ignore'))

# for q in all_questions:
#     print q
answer = soup.find('div', {"class" : "anchor panel panel-default steps-panel"})
questions = answer.findAll('p')

with open('questions.csv', 'w') as csvfile:
    fieldnames = ['Question']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    for eachQuestion in questions:
        writer.writerow({'Question' : eachQuestion})

print "Done"
