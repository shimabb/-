import csv

buf=[]
matclass1=[]
matclass2=[]
matclass3=[]
with open('data_with_classes.csv', 'r', newline='') as df:
    rows = csv.reader(df, delimiter=',')
    for row in rows:
        buf.append(row)

for data in buf:
    if data[5] == '1':
        matclass1.append(data[0:5])
    if data[5] == '2':
        matclass2.append(data[0:5])
    if data[5] == '3':
        matclass3.append(data[0:5])
    