# Code Book for CleaningDataProject
## Data

1) ActLab == The names of the activities subjects performed
2) AllData == All combined data from UCI HAR Dataset
3) CleanData == Melted AllData by subject and activity
4) features == all measurements made by Wearable Technology
5) MeanData == Summarizes the means of each feature by subject and activity
6) Test == Combined Test Data
7) TestSub == Test Subjects
8) TestX == measurements of features
9) TestY == activity
10) Train == Combined Training Data
11) TrainSub == Training Subjects
12) TrainX == measurements of features
13) TrainY == activity

## Values

1) where_feats == gives us a string of integers telling us the rows where means and stds are
2) here_feats == gives us the names of the features using mean and std

## Transformations
1) Line 18-19 Change the features and ActLab column 2 to character from factor
2) Line 25 Clean up the names of the features
3) Line 28 Bind all data in the Test folder into variable called Test
4) Line 29 Bind all data in the Train folder into variable called Train
5) Line 30 Bind all data into one called AllData
6) Line 32-33 cast columns 1 and 2 as factors to prepare summary
7) Line 36 Save AllData as a data.table so I can use melt.data.table
8) Line 37 Melt the data table from 36
