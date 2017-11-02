# -*- coding: utf-8 -*-
"""
Created on Wed Oct  4 15:49:05 2017

@author: pabr03
"""
import sqlite3 as sql
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Connect to database
db_name = 'resultsNew2.db' 
conn = sql.connect(db_name)
# Get unique file names
names_df = pd.read_sql_query('''select distinct FileName, RegionNumber,TumorGrade from OriginalFeatures''',conn)
for index,row in names_df.iterrows():
    query = '''SELECT * FROM OriginalFeatures WHERE FileName like '%s' AND RegionNumber = %d''' % (row['FileName'],row['RegionNumber'])
    df = pd.read_sql_query(query,conn)
    # Normalize with first value
#    a = np.array(df.iloc[:,6:])
    tmp = df.iloc[:,6:].subtract(df.iloc[0,6:])
    a = np.array(tmp.divide(tmp.iloc[-1,:]-tmp.iloc[0,:]))
    featureNames = tuple(df.columns.values[6:])
    
    fig,ax = plt.subplots()
    fig.set_size_inches(10,5)
    aobj = ax.plot(np.arange(8,(256+8),8),a,label=featureNames)
    ax.set_ylim([-1, 3])
    chartBox = ax.get_position()
    ax.set_position([chartBox.x0, chartBox.y0, chartBox.width*0.5, chartBox.height])
    ax.legend(iter(aobj),featureNames,loc='upper center', bbox_to_anchor=(1.6, 1.1), shadow=True, ncol=1)
    title = "{0}, Region {1}, {2}".format(row['FileName'],row['RegionNumber'],row['TumorGrade'])
    ax.set_title(title)
    figfilename = 'resultFigures3/{0}_plot_{1}_region_{2}.png'.format(row['TumorGrade'],row['FileName'],row['RegionNumber'])
    plt.savefig(figfilename)
    plt.close(fig)
#    plt.show()
