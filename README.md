# uaBackfill

# Google Analytics to BigQuery Data Loader

This script fetches Google Analytics data and loads it into a BigQuery table. It is designed to run in a BigQuery notebook environment.

## Prerequisites

1. **Google Cloud SDK**: Ensure you have the Google Cloud SDK installed and authenticated.
2. **Service Account**: A service account with access to Google Analytics and BigQuery.
3. **Python Libraries**: Install the required Python libraries.

    ```bash
    pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client google-cloud-bigquery pandas
    ```

## Setup

1. **Service Account Key**: Obtain the JSON key file for your Google Cloud service account. Replace the `key` dictionary in the script with your service account key details.

2. **Google Analytics View ID**: Replace `VIEW_ID` with your Google Analytics view ID.

3. **BigQuery Dataset and Table**: Replace `DATASET_ID` and `TABLE_ID` with your BigQuery dataset and table names.

## Script Overview

### Authentication

The script uses the service account credentials to authenticate with both Google Analytics and BigQuery APIs.

```python
credentials = service_account.Credentials.from_service_account_info(
    key,
    scopes=['https://www.googleapis.com/auth/analytics.readonly']
)
analytics = build('analyticsreporting', 'v4', credentials=credentials)
bq_client = bigquery.Client(credentials=credentials, project=key['project_id'])
```

### Fetch Google Analytics Report

The `get_analytics_report` function fetches the Google Analytics data.

```python
def get_analytics_report():
    request_body = {
        'reportRequests': [
            {
                'viewId': VIEW_ID,
                'dateRanges': [{'startDate': '2019-01-01', 'endDate': '2019-12-31'}],
                'metrics': [],
                'dimensions': [{'name': 'ga:date'}],
                'pageSize': 1000
            }
        ]
    }

    all_rows = []
    while True:
        response = analytics.reports().batchGet(body=request_body).execute()
        report = response['reports'][0]
        rows = report.get('data', {}).get('rows', [])
        all_rows.extend(rows)
        
        next_page_token = report.get('nextPageToken')
        if not next_page_token:
            break
        
        request_body['reportRequests'][0]['pageToken'] = next_page_token
    
    return all_rows, response['reports'][0]['columnHeader']
```

### Parse Response

The `parse_response` function converts the fetched data into a Pandas DataFrame.

```python
def parse_response(rows, headers):
    if not rows:
        return pd.DataFrame()

    dimension_headers = headers['dimensions']
    metric_headers = [metric['name'] for metric in headers['metricHeader']['metricHeaderEntries']]

    data = []
    for row in rows:
        dimensions = row['dimensions']
        metrics = row['metrics'][0]['values']
        data.append(dimensions + metrics)
    
    columns = dimension_headers + metric_headers
    
    df = pd.DataFrame(data, columns=columns)
    return df
```

### Load Data to BigQuery

The `load_data_to_bigquery` function loads the DataFrame into the specified BigQuery table.

```python
def load_data_to_bigquery(df):
    table_ref = bq_client.dataset(DATASET_ID).table(TABLE_ID)
    job = bq_client.load_table_from_dataframe(df, table_ref)
    job.result()
    print(f"Data successfully loaded to BigQuery table {DATASET_ID}.{TABLE_ID}")
```

### Main Function

The `main` function orchestrates the data fetching, parsing, and loading process.

```python
def main():
    rows, headers = get_analytics_report()
    df = parse_response(rows, headers)
    if not df.empty:
        load_data_to_bigquery(df)
    else:
        print("No data to load to BigQuery")
```

## Execution

Run the script in your BigQuery notebook:

```python
if __name__ == '__main__':
    main()
    print("Time took to run --- %s seconds ---" % (time.time() - startTime))
```

---

Replace placeholder values with your actual data and credentials. This README provides a clear guide on setting up and running the script in a BigQuery notebook environment.
