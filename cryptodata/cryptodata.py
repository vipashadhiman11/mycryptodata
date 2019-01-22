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
import shutil


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


def create_dataframe(time, data, feature):
    '''create dataframe

    Args:
        time: returned by  get_data()  year-month-day
        data: returned by  get_data()  a float number
    Return:
        dataframe:a dataframe contains time and data
    '''
    dataframe = pd.DataFrame({'Time': time, feature: data})

    return dataframe


def write_csv(dataframe, filename):
    '''write data into csv file

    Args:
        dataframe: returned by  create_dataframe()
        filename: returned by  get_html()
    Return:
        create a .csv file
    '''
    dataframe.to_csv(r'../build/'
                     + filename + '.csv', index=False, sep=',', mode='a+')
    
    
def sort_files_by_coin(ticker, name):
    '''sort csv files into each coin's folder

    Args:
        ticker: 
        name:
    Return:
        create folders containing the csv files of the coins
    '''
    
    # Subdirectory name - ticker_name, i.e., btc_bitcoin
    coin_directory = "../build/" + ticker + "_" + name

    # If directory does not exist, create it
    if not os.path.exists(coin_directory):
        os.mkdir(coin_directory)

    # Search for CSVs
    file_list = glob.glob("../build/" + name + "*.csv") + \
        glob.glob("../build/*" + ticker + ".csv")

    # Move CSV to subdirectory
    for csv_file in file_list:
        # Copy file over to directory
        shutil.copy2(csv_file, coin_directory)

        # Delete file
        os.remove(csv_file)


def merge_csv(ticker, name):
    '''merge the csv files into a single coin csv file

    Args:
        ticker: 
        name:
    Return:
        create each coin's csv file in the folder named old
    '''
    
    # find csv files
    csvroot = r"../build/" + ticker + "_" + name + "/*.csv"
    csv_list = glob.glob(csvroot)
    #lenList = len(csv_list)

    # initial a csv file
    oldcsv = pd.read_csv(csv_list[0])

    # create final csv file iteration
    for csv in csv_list:
        newcsv = pd.read_csv(csv)
        csv_out = newcsv.merge(oldcsv, on=['Time'], how="outer", sort=True)
        oldcsv = csv_out

    # saves the final csv file
    output_file = "../build/" + ticker + "_" + name + ".csv"
    oldcsv.to_csv(output_file, index=False)
    
    
def sort_csv(features_list):
    '''sort the csv files' columns into right order

    Args:
        features_list
    Return:
        create the final csv files with right features order and 
        in the folder named new
    '''
    
    # find csv files
    csvroot = r"../build/*.csv"
    csv_list = glob.glob(csvroot)

    # create final csv file iteration
    for csv in csv_list:
        # save csv files' names
        csvname = os.path.basename(csv)
        # create new root
        newoutput_file = "../build/" + csvname
        data = pd.read_csv(csv)
        # sort the features
        data = data.reindex(columns = features_list)
        # write new csv files
        data.to_csv(newoutput_file, index=False)


def main():
    '''main function

        First transfer the relpath to abspath
        Then start the functions to crate .csv files

    '''
    
    # list the features
    features_list = ['Time', 'active_address', 'block_size', 'block_time',
                     'difficulty', 'google_trends', 'hashrate', 'market_cap',
                     'mining_profitability', 'price_usd', 'sent_from',
                     'sent_in_usd', 'top_100_total', 'transaction_fee_avg',
                     'transaction_fee_median', 'transaction_value_avg',
                     'transaction_value_median', 'transactions_volume',
                     'tweets']
    
    # list the coins
    coin_list = [["aur", "auroracoin"],
                 ["bch", "bitcoin_cash"],
                 ["blk", "blackcoin"],
                 ["btc", "bitcoin"],
                 ["btg", "bitcoin_gold"],
                 ["dash", "dash"],
                 ["doge", "dogecoin"],
                 ["etc", "ethereum_classic"],
                 ["eth", "ethereum"],
                 ["ftc", "feathercoin"],
                 ["ltc", "litecoin"],
                 ["nmc", "namecoin"],
                 ["nvc", "novacoin"],
                 ["ppc", "peercoin"],
                 ["rdd", "reddcoin"],
                 ["vtc", "vertcoin"],
                 ["xmr", "monero"],
                 ["xrp", "xrp"],
                 ["zec", "zcash"]]
    
    # get dataset according the date
    dataset_date = '2018_10_08'
	# dataset_date = '2019_01_07'
    
    # create csv files according the features of each coin
    for feature in features_list:
        # Form root path
        root = "../datasets/" + dataset_date + "/" + feature + "/*.html"

        # start
        filepaths, filenames = get_html(root)

        # go through all the files in the root
        for i in range(len(filepaths)):
            html = read_html(filepaths[i])      # read web
            content = parse_html(html)         # parse web
            time, data = get_data(content)     # get data
            dataframe = create_dataframe(time, data, feature)     # create dataframe
            write_csv(dataframe, filenames[i])   # write csv
    
    # merge the csv files        
    for coin in coin_list:
        ticker = coin[0]
        name = coin[1]
        sort_files_by_coin(ticker, name)
        merge_csv(ticker, name)
    
    # create the final csv files
    sort_csv(features_list)
        
main()
