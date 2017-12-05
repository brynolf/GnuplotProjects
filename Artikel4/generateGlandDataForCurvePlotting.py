# -*- coding: utf-8 -*-
"""
Created on Thu Nov  2 14:16:08 2017

@author: pabr03
"""
import numpy as np
import pandas as pd
import sqlite3 as sql
import matplotlib.pyplot as plt

sourceDataPath = 'C:\\GnuplotProjects\\Artikel4\\GlandData\\results32GLDither.db'

# Connect to database
conn = sql.connect(sourceDataPath)

# Read one row of data
a = pd.read_sql_query('Select * from InvariantFeatures LIMIT 1',conn)

# Get column names
featureNames = a.columns[-21:]

# Loop over all features, extract data
for feature in featureNames:
    
    # Find all unique pairs of patient number and exam number
    c = pd.read_sql_query('select PatientNumber,Examnumber from InvariantFeatures where BrainRegion like "Cerebellum"',conn)
    d = c.drop_duplicates()
    plt.figure()
    for patnum,examnum in d.values:
        # Select values for the feature
        b = pd.read_sql_query('''select BitDepth,{0} from InvariantFeatures where 
                              BrainRegion like "{1}" and PatientNumber = {2} and 
                              Examnumber = {3} order by PatientNumber, 
                              ExamNumber,BitDepth'''.format(feature,'FrontalCortex',
                              patnum,examnum)
                              ,conn)
        plt.plot(b.BitDepth,b[feature],'o-')
        plt.title(feature)