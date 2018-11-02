# cryptodata
## Function:
   *clean up bitinfocharts.com data to CSV*
## Code Requirements
   *Python 3.6* 
## Methods
   *get html files from their root*
   ```
   # save files' paths
    filepaths = glob.glob(fileroot)
    # save files' names
    filenames = [os.path.basename(x).replace('.html', '') for x in filepaths]
    return filepaths, filenames
   ```
   *read html files*
   ```
   # save files' paths
    htmlfile = open(path, 'r', encoding='utf-8')
    html = htmlfile.read()
    return html
   ```
   *parse the html files*
   ```
   # save files' paths
    soup = BeautifulSoup(html, 'lxml')
    scripts = soup.find_all(name="script")
    content = scripts[5].text
    return content
   ```
   *get data*
   ```
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
   ```
   *create dataframe*
   ```
    dataframe = pd.DataFrame({'Time': time, 'Data': data})
    return dataframe
   ```
   *write data into csv file*
   ```
    dataframe.to_csv(r'C:\Users\qiang\Documents\cryptodata\build\\' +
                     filename + '.csv', index=False, sep=',', mode='a+')
   ```
 ## Next work to do 
   ***Now we have the function to create data bu only on html, we need to merge the same coin data into one csv file***  

