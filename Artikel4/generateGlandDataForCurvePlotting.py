# -*- coding: utf-8 -*-
"""
Created on Thu Nov  2 14:16:08 2017

@author: pabr03
"""
import numpy as np
import pandas as pd
import sqlite3 as sql
import matplotlib.pyplot as plt

sourceDataPath = 'C:\\GnuplotProjects\\Artikel4\\GlandData\\results32GLDitherNewMaxProb.db'

# Connect to database
conn = sql.connect(sourceDataPath)

# Read one row of data
a = pd.read_sql_query('Select * from InvariantFeaturesK LIMIT 1',conn)

# Get column names
featureNames = a.columns[-21:]

# Loop over all features, extract data
for feature in featureNames:
    
    # Find all unique pairs of patient number and exam number
    c = pd.read_sql_query('select FileName,RegionNumber,PixelsInRegion from InvariantFeaturesK where TumorGrade like "benign"',conn)
    dd = c.drop_duplicates()
    # Select the largest region
    d = dd.sort_values(by='PixelsInRegion',ascending=False).iloc[0:1]
    plt.figure()
    # Interactive plotting on!
    plt.ion()

    for fileName,regionNumber,PixelsInRegion in d.values:
        # Select values for the feature
        b = pd.read_sql_query('''select BitDepth,{0} from InvariantFeaturesK where 
                              TumorGrade like "{1}" and FileName like "{2}" and 
                              RegionNumber = {3} order by FileName, 
                              RegionNumber,BitDepth'''.format(feature,'benign',
                              fileName,regionNumber)
                              ,conn)
        b.to_csv('{0}_{1}.csv'.format(feature,'InvariantGland'),header=False,index=False)
        
        c = pd.read_sql_query('''select BitDepth,{0} from OriginalFeaturesK where 
                              TumorGrade like "{1}" and FileName like "{2}" and 
                              RegionNumber = {3} order by FileName, 
                              RegionNumber,BitDepth'''.format(feature,'benign',
                              fileName,regionNumber)
                              ,conn)
        c.to_csv('{0}_{1}.csv'.format(feature,'OriginalGland'),header=False,index=False)
        
#        plt.plot(b.BitDepth,b[feature],'o-')
#        plt.title(feature)