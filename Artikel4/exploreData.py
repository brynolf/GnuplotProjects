# -*- coding: utf-8 -*-
"""
Created on Tue Oct  3 11:41:19 2017

@author: pabr03
"""
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sqlite3 as sql

# Horizontal axis: training data
# Vertical axis: test data


# Import data
#inv = np.load('result_Brain.npz')
cellData = np.load('Results_Cell.npz')

# Get arrays
invAcc = cellData['inv']
origAcc = cellData['orig']

# Get dataframe 
invDF = pd.DataFrame(invAcc,index = np.arange(8,8*(len(invAcc)+1),8),columns = np.arange(8,8*(len(invAcc)+1),8))
origDF = pd.DataFrame(origAcc,index = np.arange(8,8*(len(origAcc)+1),8),columns = np.arange(8,8*(len(origAcc)+1),8))

figure,axis = plt.subplots(1,2)
axis[0].imshow(origAcc)
axis[1].imshow(invAcc)

# Invert dataframe
invFlip = invDF[::-1].values
origFlip = origDF[::-1].values

# plot data, make sure it looks good
figure,axis = plt.subplots(1,2)
axis[0].imshow(origFlip)
axis[1].imshow(invFlip)

# Save data
np.savetxt('origDataCell.csv',origFlip,delimiter=',',fmt='%.4f')
np.savetxt('invDataCell.csv',invFlip,delimiter=',',fmt='%.4f')