# -*- coding: utf-8 -*-
"""
Created on Sat Oct 21 21:51:52 2017

@author: pabr03
"""
import numpy as np

# Import IRIS data
from sklearn import datasets
iris = datasets.load_iris()
iris_X = iris.data
iris_y = iris.target

# Split data into training and test sets
np.random.seed(0)
indices = np.random.permutation(len(iris_X))
iris_X_train = iris_X[indices[:-10]]
iris_y_train = iris_y[indices[:-10]]
iris_X_test  = iris_X[indices[-10:]]
iris_y_test  = iris_y[indices[-10:]]

# Classify using linear regression
from sklearn import linear_model
regr = linear_model.LogisticRegression(C=1e5)
regr.fit(iris_X_train,iris_y_train)

regr.predict(iris_X_test)