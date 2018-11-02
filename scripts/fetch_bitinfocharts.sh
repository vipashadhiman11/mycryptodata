#!/bin/sh
# Script to download bitinfocharts.com data
# Copyright 2018, Jing Sun - jing@wayne.edu

# Collection of links

transactions_links=(
    "https://bitinfocharts.com/comparison/bitcoin-transactions.html"
    "https://bitinfocharts.com/comparison/ethereum-transactions.html"
    "https://bitinfocharts.com/comparison/transactions-xrp.html"
    "https://bitinfocharts.com/comparison/transactions-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-transactions.html"
    "https://bitinfocharts.com/comparison/transactions-etc.html"
    "https://bitinfocharts.com/comparison/dash-transactions.html"
    "https://bitinfocharts.com/comparison/zcash-transactions.html"
    "https://bitinfocharts.com/comparison/monero-transactions.html"
    "https://bitinfocharts.com/comparison/transactions-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-transactions.html"
    "https://bitinfocharts.com/comparison/transactions-btg.html"
    "https://bitinfocharts.com/comparison/transactions-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-transactions.html"
    "https://bitinfocharts.com/comparison/transactions-blk.html"
    "https://bitinfocharts.com/comparison/transactions-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-transactions.html"
    "https://bitinfocharts.com/comparison/transactions-aur.html"
    "https://bitinfocharts.com/comparison/transactions-nvc.html"
)

# Block Size

block_size_link=(
    "https://bitinfocharts.com/comparison/size-btc.html"
    "https://bitinfocharts.com/comparison/size-eth.html"
    "https://bitinfocharts.com/comparison/size-xrp.html"
    "https://bitinfocharts.com/comparison/size-bch.html"
    "https://bitinfocharts.com/comparison/size-ltc.html"
    "https://bitinfocharts.com/comparison/size-etc.html"
    "https://bitinfocharts.com/comparison/size-dash.html"
    "https://bitinfocharts.com/comparison/size-zec.html"
    "https://bitinfocharts.com/comparison/size-xmr.html"
    "https://bitinfocharts.com/comparison/size-vtc.html"
    "https://bitinfocharts.com/comparison/size-doge.html"
    "https://bitinfocharts.com/comparison/size-btg.html"
    "https://bitinfocharts.com/comparison/size-rdd.html"
    "https://bitinfocharts.com/comparison/size-ppc.html"
    "https://bitinfocharts.com/comparison/size-blk.html"
    "https://bitinfocharts.com/comparison/size-ftc.html"
    "https://bitinfocharts.com/comparison/size-nmc.html"
    "https://bitinfocharts.com/comparison/size-aur.html"
    "https://bitinfocharts.com/comparison/size-nvc.html"
)

# Sent from addresses

sent_from_link=(
    "https://bitinfocharts.com/comparison/sentbyaddress-btc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-eth.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-xrp.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-bch.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-ltc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-etc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-dash.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-zec.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-xmr.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-vtc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-doge.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-btg.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-rdd.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-ppc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-blk.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-ftc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-nmc.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-aur.html"
    "https://bitinfocharts.com/comparison/sentbyaddress-nvc.html"
)

# Difficulty

difficulty_link=(
    "https://bitinfocharts.com/comparison/bitcoin-difficulty.html"
    "https://bitinfocharts.com/comparison/ethereum-difficulty.html"
    "https://bitinfocharts.com/comparison/difficulty-xrp.html"
    "https://bitinfocharts.com/comparison/difficulty-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-difficulty.html"
    "https://bitinfocharts.com/comparison/difficulty-etc.html"
    "https://bitinfocharts.com/comparison/dash-difficulty.html"
    "https://bitinfocharts.com/comparison/zcash-difficulty.html"
    "https://bitinfocharts.com/comparison/monero-difficulty.html"
    "https://bitinfocharts.com/comparison/difficulty-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-difficulty.html"
    "https://bitinfocharts.com/comparison/difficulty-btg.html"
    "https://bitinfocharts.com/comparison/difficulty-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-difficulty.html"
    "https://bitinfocharts.com/comparison/difficulty-blk.html"
    "https://bitinfocharts.com/comparison/difficulty-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-difficulty.html"
    "https://bitinfocharts.com/comparison/difficulty-aur.html"
    "https://bitinfocharts.com/comparison/difficulty-nvc.html"
)
# Hashrate

hashrate_link=(
    "https://bitinfocharts.com/comparison/bitcoin-hashrate.html"
    "https://bitinfocharts.com/comparison/ethereum-hashrate.html"
    "https://bitinfocharts.com/comparison/hashrate-xrp.html"
    "https://bitinfocharts.com/comparison/hashrate-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-hashrate.html"
    "https://bitinfocharts.com/comparison/hashrate-etc.html"
    "https://bitinfocharts.com/comparison/dash-hashrate.html"
    "https://bitinfocharts.com/comparison/zcash-hashrate.html"
    "https://bitinfocharts.com/comparison/monero-hashrate.html"
    "https://bitinfocharts.com/comparison/hashrate-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-hashrate.html"
    "https://bitinfocharts.com/comparison/hashrate-btg.html"
    "https://bitinfocharts.com/comparison/hashrate-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-hashrate.html"
    "https://bitinfocharts.com/comparison/hashrate-blk.html"
    "https://bitinfocharts.com/comparison/hashrate-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-hashrate.html"
    "https://bitinfocharts.com/comparison/hashrate-aur.html"
    "https://bitinfocharts.com/comparison/hashrate-nvc.html"
)

# Mining Profitability

mining_profitability_link=(
    "https://bitinfocharts.com/comparison/bitcoin-mining_profitability.html"
    "https://bitinfocharts.com/comparison/ethereum-mining_profitability.html"
    "https://bitinfocharts.com/comparison/mining_profitability-xrp.html"
    "https://bitinfocharts.com/comparison/mining_profitability-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-mining_profitability.html"
    "https://bitinfocharts.com/comparison/mining_profitability-etc.html"
    "https://bitinfocharts.com/comparison/dash-mining_profitability.html"
    "https://bitinfocharts.com/comparison/zcash-mining_profitability.html"
    "https://bitinfocharts.com/comparison/monero-mining_profitability.html"
    "https://bitinfocharts.com/comparison/mining_profitability-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-mining_profitability.html"
    "https://bitinfocharts.com/comparison/mining_profitability-btg.html"
    "https://bitinfocharts.com/comparison/mining_profitability-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-mining_profitability.html"
    "https://bitinfocharts.com/comparison/mining_profitability-blk.html"
    "https://bitinfocharts.com/comparison/mining_profitability-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-mining_profitability.html"
    "https://bitinfocharts.com/comparison/mining_profitability-aur.html"
    "https://bitinfocharts.com/comparison/mining_profitability-nvc.html"
)

# Sent in USD

sent_usd_link=(
    "https://bitinfocharts.com/comparison/sentinusd-btc.html"
    "https://bitinfocharts.com/comparison/sentinusd-eth.html"
    "https://bitinfocharts.com/comparison/sentinusd-xrp.html"
    "https://bitinfocharts.com/comparison/sentinusd-bch.html"
    "https://bitinfocharts.com/comparison/sentinusd-ltc.html"
    "https://bitinfocharts.com/comparison/sentinusd-etc.html"
    "https://bitinfocharts.com/comparison/sentinusd-dash.html"
    "https://bitinfocharts.com/comparison/sentinusd-zec.html"
    "https://bitinfocharts.com/comparison/sentinusd-xmr.html"
    "https://bitinfocharts.com/comparison/sentinusd-vtc.html"
    "https://bitinfocharts.com/comparison/sentinusd-doge.html"
    "https://bitinfocharts.com/comparison/sentinusd-btg.html"
    "https://bitinfocharts.com/comparison/sentinusd-rdd.html"
    "https://bitinfocharts.com/comparison/sentinusd-ppc.html"
    "https://bitinfocharts.com/comparison/sentinusd-blk.html"
    "https://bitinfocharts.com/comparison/sentinusd-ftc.html"
    "https://bitinfocharts.com/comparison/sentinusd-nmc.html"
    "https://bitinfocharts.com/comparison/sentinusd-aur.html"
    "https://bitinfocharts.com/comparison/sentinusd-nvc.html"
)

# Average Transaction Fee

average_transaction_fee_link=(
    "https://bitinfocharts.com/comparison/bitcoin-transactionfees.html"
    "https://bitinfocharts.com/comparison/ethereum-transactionfees.html"
    "https://bitinfocharts.com/comparison/transactionfees-xrp.html"
    "https://bitinfocharts.com/comparison/transactionfees-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-transactionfees.html"
    "https://bitinfocharts.com/comparison/transactionfees-etc.html"
    "https://bitinfocharts.com/comparison/dash-transactionfees.html"
    "https://bitinfocharts.com/comparison/zcash-transactionfees.html"
    "https://bitinfocharts.com/comparison/monero-transactionfees.html"
    "https://bitinfocharts.com/comparison/transactionfees-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-transactionfees.html"
    "https://bitinfocharts.com/comparison/transactionfees-btg.html"
    "https://bitinfocharts.com/comparison/transactionfees-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-transactionfees.html"
    "https://bitinfocharts.com/comparison/transactionfees-blk.html"
    "https://bitinfocharts.com/comparison/transactionfees-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-transactionfees.html"
    "https://bitinfocharts.com/comparison/transactionfees-aur.html"
    "https://bitinfocharts.com/comparison/transactionfees-nvc.html"
)

# Median Transaction Fee

median_transaction_fee_link=(
    "https://bitinfocharts.com/comparison/bitcoin-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/ethereum-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-xrp.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-etc.html"
    "https://bitinfocharts.com/comparison/dash-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/zcash-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/monero-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-btg.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-blk.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-median_transaction_fee.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-aur.html"
    "https://bitinfocharts.com/comparison/median_transaction_fee-nvc.html"
)

# Block Time

block_time_link=(
    "https://bitinfocharts.com/comparison/bitcoin-confirmationtime.html"
    "https://bitinfocharts.com/comparison/ethereum-confirmationtime.html"
    "https://bitinfocharts.com/comparison/confirmationtime-xrp.html"
    "https://bitinfocharts.com/comparison/confirmationtime-bch.html"
    "https://bitinfocharts.com/comparison/litecoin-confirmationtime.html"
    "https://bitinfocharts.com/comparison/confirmationtime-etc.html"
    "https://bitinfocharts.com/comparison/dash-confirmationtime.html"
    "https://bitinfocharts.com/comparison/zcash-confirmationtime.html"
    "https://bitinfocharts.com/comparison/confirmationtime-xmr.html"
    "https://bitinfocharts.com/comparison/confirmationtime-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-confirmationtime.html"
    "https://bitinfocharts.com/comparison/confirmationtime-btg.html"
    "https://bitinfocharts.com/comparison/confirmationtime-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-confirmationtime.html"
    "https://bitinfocharts.com/comparison/confirmationtime-blk.html"
    "https://bitinfocharts.com/comparison/confirmationtime-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-confirmationtime.html"
    "https://bitinfocharts.com/comparison/confirmationtime-aur.html"
    "https://bitinfocharts.com/comparison/confirmationtime-nvc.html"
)

# Average Transaction Value

average_transaction_value_link=(
    "https://bitinfocharts.com/comparison/transactionvalue-btc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-eth.html"
    "https://bitinfocharts.com/comparison/transactionvalue-xrp.html"
    "https://bitinfocharts.com/comparison/transactionvalue-bch.html"
    "https://bitinfocharts.com/comparison/transactionvalue-ltc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-etc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-dash.html"
    "https://bitinfocharts.com/comparison/transactionvalue-zec.html"
    "https://bitinfocharts.com/comparison/transactionvalue-xmr.html"
    "https://bitinfocharts.com/comparison/transactionvalue-vtc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-doge.html"
    "https://bitinfocharts.com/comparison/transactionvalue-btg.html"
    "https://bitinfocharts.com/comparison/transactionvalue-rdd.html"
    "https://bitinfocharts.com/comparison/transactionvalue-ppc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-blk.html"
    "https://bitinfocharts.com/comparison/transactionvalue-ftc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-nmc.html"
    "https://bitinfocharts.com/comparison/transactionvalue-aur.html"
    "https://bitinfocharts.com/comparison/transactionvalue-nvc.html"
)

# Median Transaction Value

median_transaction_value_link=(
    "https://bitinfocharts.com/comparison/mediantransactionvalue-btc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-eth.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-xrp.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-bch.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-ltc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-etc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-dash.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-zec.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-xmr.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-vtc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-doge.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-btg.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-rdd.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-ppc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-blk.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-ftc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-nmc.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-aur.html"
    "https://bitinfocharts.com/comparison/mediantransactionvalue-nvc.html"
)

# Active Addresses

active_addresses_link=(
    "https://bitinfocharts.com/comparison/activeaddresses-btc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-eth.html"
    "https://bitinfocharts.com/comparison/activeaddresses-xrp.html"
    "https://bitinfocharts.com/comparison/activeaddresses-bch.html"
    "https://bitinfocharts.com/comparison/activeaddresses-ltc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-etc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-dash.html"
    "https://bitinfocharts.com/comparison/activeaddresses-zec.html"
    "https://bitinfocharts.com/comparison/activeaddresses-xmr.html"
    "https://bitinfocharts.com/comparison/activeaddresses-vtc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-doge.html"
    "https://bitinfocharts.com/comparison/activeaddresses-btg.html"
    "https://bitinfocharts.com/comparison/activeaddresses-rdd.html"
    "https://bitinfocharts.com/comparison/activeaddresses-ppc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-blk.html"
    "https://bitinfocharts.com/comparison/activeaddresses-ftc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-nmc.html"
    "https://bitinfocharts.com/comparison/activeaddresses-aur.html"
    "https://bitinfocharts.com/comparison/activeaddresses-nvc.html"
)

# Top 100 to Total

top_100_total_link=(
    "https://bitinfocharts.com/comparison/top100cap-btc.html"
    "https://bitinfocharts.com/comparison/top100cap-eth.html"
    "https://bitinfocharts.com/comparison/top100cap-xrp.html"
    "https://bitinfocharts.com/comparison/top100cap-bch.html"
    "https://bitinfocharts.com/comparison/top100cap-ltc.html"
    "https://bitinfocharts.com/comparison/top100cap-etc.html"
    "https://bitinfocharts.com/comparison/top100cap-dash.html"
    "https://bitinfocharts.com/comparison/top100cap-zec.html"
    "https://bitinfocharts.com/comparison/top100cap-xmr.html"
    "https://bitinfocharts.com/comparison/top100cap-vtc.html"
    "https://bitinfocharts.com/comparison/top100cap-doge.html"
    "https://bitinfocharts.com/comparison/top100cap-btg.html"
    "https://bitinfocharts.com/comparison/top100cap-rdd.html"
    "https://bitinfocharts.com/comparison/top100cap-ppc.html"
    "https://bitinfocharts.com/comparison/top100cap-blk.html"
    "https://bitinfocharts.com/comparison/top100cap-ftc.html"
    "https://bitinfocharts.com/comparison/top100cap-nmc.html"
    "https://bitinfocharts.com/comparison/top100cap-aur.html"
    "https://bitinfocharts.com/comparison/top100cap-nvc.html"
)

# Google Trends

gtrends_link=(
    "https://bitinfocharts.com/comparison/google_trends-btc.html"
    "https://bitinfocharts.com/comparison/google_trends-eth.html"
    "https://bitinfocharts.com/comparison/google_trends-ltc.html"
    "https://bitinfocharts.com/comparison/google_trends-xmr.html"
    "https://bitinfocharts.com/comparison/google_trends-doge.html"
)

# Tweets

tweets_link=(
    "https://bitinfocharts.com/comparison/tweets-btc.html"
    "https://bitinfocharts.com/comparison/tweets-eth.html"
    "https://bitinfocharts.com/comparison/tweets-xrp.html"
    "https://bitinfocharts.com/comparison/tweets-bch.html"
    "https://bitinfocharts.com/comparison/tweets-ltc.html"
    "https://bitinfocharts.com/comparison/tweets-etc.html"
    "https://bitinfocharts.com/comparison/tweets-dash.html"
    "https://bitinfocharts.com/comparison/tweets-zec.html"
    "https://bitinfocharts.com/comparison/tweets-xmr.html"
    "https://bitinfocharts.com/comparison/tweets-vtc.html"
    "https://bitinfocharts.com/comparison/tweets-doge.html"
    "https://bitinfocharts.com/comparison/tweets-btg.html"
    "https://bitinfocharts.com/comparison/tweets-rdd.html"
    "https://bitinfocharts.com/comparison/tweets-ppc.html"
    "https://bitinfocharts.com/comparison/tweets-blk.html"
    "https://bitinfocharts.com/comparison/tweets-ftc.html"
    "https://bitinfocharts.com/comparison/tweets-nmc.html"
    "https://bitinfocharts.com/comparison/tweets-aur.html"
    "https://bitinfocharts.com/comparison/tweets-nvc.html"
)

# Price

price_link=(
    "https://bitinfocharts.com/comparison/bitcoin-price.html"
    "https://bitinfocharts.com/comparison/ethereum-price.html"
    "https://bitinfocharts.com/comparison/transactions-price.html"
    "https://bitinfocharts.com/comparison/transactions-price.html"
    "https://bitinfocharts.com/comparison/litecoin-price.html"
    "https://bitinfocharts.com/comparison/price-etc.html"
    "https://bitinfocharts.com/comparison/dash-price.html"
    "https://bitinfocharts.com/comparison/zcash-price.html"
    "https://bitinfocharts.com/comparison/monero-price.html"
    "https://bitinfocharts.com/comparison/price-vtc.html"
    "https://bitinfocharts.com/comparison/dogecoin-price.html"
    "https://bitinfocharts.com/comparison/price-btg.html"
    "https://bitinfocharts.com/comparison/price-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-price.html"
    "https://bitinfocharts.com/comparison/price-blk.html"
    "https://bitinfocharts.com/comparison/price-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-price.html"
    "https://bitinfocharts.com/comparison/price-aur.html"
    "https://bitinfocharts.com/comparison/price-nvc.html"
)

# Market Cap

marketcap_link=(
    "https://bitinfocharts.com/comparison/bitcoin-marketcap.html"
    "https://bitinfocharts.com/comparison/ethereum-marketcap.html"
    "https://bitinfocharts.com/comparison/transactions-marketcap.html"
    "https://bitinfocharts.com/comparison/transactions-marketcap.html"
    "https://bitinfocharts.com/comparison/litecoin-marketcap.html"
    "https://bitinfocharts.com/comparison/marketcap-etc.html"
    "https://bitinfocharts.com/comparison/dash-marketcap.html"
    "https://bitinfocharts.com/comparison/zcash-marketcap.html"
    "https://bitinfocharts.com/comparison/monero-marketcap.html"
    "https://bitinfocharts.com/comparison/price-marketcap.html"
    "https://bitinfocharts.com/comparison/dogecoin-marketcap.html"
    "https://bitinfocharts.com/comparison/marketcap-btg.html"
    "https://bitinfocharts.com/comparison/marketcap-rdd.html"
    "https://bitinfocharts.com/comparison/peercoin-marketcap.html"
    "https://bitinfocharts.com/comparison/marketcap-blk.html"
    "https://bitinfocharts.com/comparison/marketcap-ftc.html"
    "https://bitinfocharts.com/comparison/namecoin-marketcap.html"
    "https://bitinfocharts.com/comparison/marketcap-aur.html"
    "https://bitinfocharts.com/comparison/marketcap-nvc.html"
)

# Setup
user_agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"
date_suffix=`date '+%Y_%m_%d'`  # Use today's date in YY_MM_DD as suffix

## now loop through the above array
for ticker in "${transactions_links[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/transactions/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${block_size_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/block_size/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${sent_from_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/sent_from/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${difficulty_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/difficulty/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${hashrate_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/hashrate/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${mining_profitability_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/mining_profitability/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${sent_usd_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/sent_usd/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${average_transaction_fee_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/average_transaction_fee/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${median_transaction_fee_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/median_transaction_fee/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${block_time_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/block_time/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${average_transaction_value_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/average_transaction_value/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${median_transaction_value_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/median_transaction_value/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${active_addresses_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/active_addresses/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${top_100_total_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/top_100_total/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${gtrends_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/gtrends/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${tweets_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/tweets/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${price_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/price/ $ticker --user-agent=$user_agent
   sleep 1
done

for ticker in "${marketcap_link[@]}"
do
   echo $ticker
   wget --directory-prefix=data_$date_suffix/marketcap/ $ticker --user-agent=$user_agent
   sleep 1
done
