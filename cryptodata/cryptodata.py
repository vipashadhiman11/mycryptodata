#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# @Time    : 2018/10/25 20:07
# @Author  : Yao Qiang
# @Author E-mail: qiangyao1988wsu@gmail.com
# @File    : cryptodata.py
# @Version    : v1.0
# @Software: Spyder
# @Function: clean up bitinfocharts.com data to CSV

from bs4 import BeautifulSoup
import pandas as pd
import re
import os
import glob


def get_html(fileroot):
    '''get html files from their root

    Use the fuction glob.glob from the model glob
    to get the files in the root
    Return the path of the html files and their filenames

    Args:
        fileroot: the path of the html files in the computer

    Return:
        filepaths:a list contains the path of html files
        filenames:a list contains the files' names

    Rises:
        Waiting to achieve, while the fileroot is not correct
    '''
    # save files' paths
    filepaths = glob.glob(fileroot)
    # save files' names
    filenames = [os.path.basename(x).replace('.html', '') for x in filepaths]
    return filepaths, filenames


def read_html(path):
    '''read html files

    Read the html files and
    return their contents

    Args:
        path: the path of the html files in the computer
              returned by get_html()

    Return:
        html: the content of the html files

    '''
    htmlfile = open(path, 'r', encoding='utf-8')
    html = htmlfile.read()
    return html


def parse_html(html):
    '''parse the html files

    Parse the html files by Beautifulsoup
    return the contents contain data

    Args:
        html: the html contents returned by read_html()

    Return:
        content:the contents contain data

    '''
    soup = BeautifulSoup(html, 'lxml')
    scripts = soup.find_all(name="script")
    content = scripts[5].text
    return content


def get_data(content):
    '''get data

    Scrape data from the contents
    return data

    Args:
        content: the contents returned by parse_html()

    Return:
        time:year\\month\\day
        data:a float number
    '''
    # find data by re
    result = re.findall(
        r'(\(\"\d\d\d\d\/\d\d\/\d\d\"\)\,)(\d+(\.\d+)?)',
        content,
        re.S)

    # get time and data
    time = [x[0] for x in result]
    data = [x[1] for x in result]
    # strip the useless punctuation
    for i in range(len(time)):
        time[i] = time[i].strip(r'\,').strip(r'\(').strip(r'\)').strip('\"')
    # change data type from string to float
    data = list(map(eval, data))
    return time, data


def create_dataframe(time, data):
    '''create dataframe

    Args:
        time: returned by  get_data()  year\month\day
        data: returned by  get_data()  a float number
    Return:
        dataframe:a dataframe contains time and data
    '''
    dataframe = pd.DataFrame({'Time': time, 'Data': data})
    return dataframe


def write_csv(dataframe, filename):
    '''write data into csv file

    Args:
        dataframe: returned by  create_dataframe()
        filename: returned by  get_html()
    Return:
        create a .csv file
    '''
    dataframe.to_csv(r'C:\Users\qiang\Documents\cryptodata\build\\' +
                     filename + '.csv', index=False, sep=',', mode='a+')


if __name__ == '__main__':
    '''main function

    First transfer the relpath to abspath
    Then start the functions to crate .csv files

    '''
    root = r"C:\Users\qiang\Documents\cryptodata\datasets\2018_10_08\price_usd\*.html"
    # csvroot = r"C:\Users\qiang\Documents\cryptodata\build\*.csv"

    # start
    filepaths, filenames = get_html(root)

    # go through all the files in the root
    for i in range(len(filepaths)):
        html = read_html(filepaths[i])      # read web
        content = parse_html(html)         # parse web
        time, data = get_data(content)     # get data
        dataframe = create_dataframe(time, data)     # create dataframe
        write_csv(dataframe, filenames[i])   # write csv
