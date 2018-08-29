# -*- coding: utf-8 -*-
"""
Created on Thu Jun 28 13:46:46 2018

@author: pabr03
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy import stats
from sklearn.svm import SVC # "Support vector classifier"
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix


model = SVC(kernel='linear', C=1E10)
a = pd.read_excel('Fettumörer_ALLA_DATA_2018-03-11.xlsx')
b = a[['PAD-SPSS: lipom-atypiskt lipom-myxoitt liposarkom','FF mean [%]']]
c = b.values
d = c[:,1]
d.shape = (41,1)
model.fit(d, c[:,0])

# Report
predicted = model.predict(d)
true = c[:,0]
targetNames = ['1','2','4']
print(classification_report(true, predicted, target_names=targetNames))
cm = confusion_matrix(true, predicted)
tn, fp, fn, tp = cm[0:2,0:2].ravel()
specificity = tn / (tn+fp)
sensitivity = tp / (tp+fn)
precision   = tp / (tp+fp)