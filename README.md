# uaBackfill

# Google Analytics Data Export Script

## Overview

This script fetches historical data from Google Analytics using the Google Analytics Reporting API and saves the data locally as a CSV file or to BigQuery. It uses a service account for authentication.

## Prerequisites

1. **Google Cloud Project**: Create a project in the Google Cloud Console.
2. **Google Analytics Reporting API**: Enable the Google Analytics Reporting API in your Google Cloud project.
3. **Service Account**: Create a service account and download the JSON key file.
4. **Python Environment**: Ensure Python is installed along with the required libraries.

## Setup Instructions

### Step 1: Create a Project in Google Cloud Platform

1. **Go to the Google Cloud Console**: [Google Cloud Console](https://console.cloud.google.com/)
2. **Create a New Project**:
   - Click on the project dropdown at the top.
   - Click on "New Project".
   - Enter a project name and, optionally, select an organization.
   - Click "Create".

### Step 2: Enable the Google Analytics Reporting API

1. **Navigate to the APIs & Services Dashboard**:
   - In the left sidebar, go to "APIs & Services" > "Dashboard".
2. **Enable the API**:
   - Click on "Enable APIs and Services".
   - Search for "Google Analytics Reporting API".
   - Click on it and then click "Enable".

### Step 3: Create Service Account Credentials

1. **Navigate to the Service Accounts Page**:
   - In the left sidebar, go to "IAM & Admin" > "Service Accounts".
2. **Create a Service Account**:
   - Click "Create Service Account".
   - Enter a service account name, ID, and description, then click "Create and Continue".
3. **Assign Roles to the Service Account**:
   - In the "Select a role" dropdown, choose "Project" > "Editor" (or a more restrictive role if you prefer).
   - Click "Continue".
   - Click "Done".
4. **Create a Key for the Service Account**:
   - In the "Service Accounts" list, find your newly created service account.
   - Click the three dots in the "Actions" column and select "Manage keys".
   - Click "Add Key" > "Create New Key".
   - Choose "JSON" and click "Create".
   - The JSON key file will be downloaded automatically to your computer.

### Step 4: Grant Access to Your Google Analytics Account

1. **Go to Google Analytics**: [Google Analytics](https://analytics.google.com/)
2. **Navigate to Admin**:
   - In the lower-left corner, click on "Admin".
3. **Grant Access**:
   - In the "Account" column, select the account you want to access.
   - Click on "Account Settings" > "Account Permissions".
   - Click on the "+" button to add a new user.
   - Add the email address of the service account. This email is found in the JSON file, typically in the format `your-service-account@your-project-id.iam.gserviceaccount.com`.
   - Assign the role "Read & Analyze" (or another role depending on your needs).
   - Click "Add".

### Step 5: Set Up Python Environment

1. **Install Required Libraries**:
   ```sh
   pip install google-auth google-auth-oauthlib google-auth-httplib2 google-api-python-client pandas
   ```

### Step 6: Configure and Run the Script

1. **Update Script Configuration**:
   - Replace `'path/to/your/service-account-file.json'` with the path to your downloaded JSON key file.
   - Replace `'your-view-id'` with your Google Analytics view ID.

2. **Script Example**:

   ```python
   import os
   import pandas as pd
   from google.oauth2 import service_account
   from googleapiclient.discovery import build
   import logging

   # Set up logging
   logging.basicConfig(level=logging.INFO)
   logger = logging.getLogger(__name__)

   # Replace with your service account JSON file and view ID
   SERVICE_ACCOUNT_FILE = 'path/to/your/service-account-file.json'
   VIEW_ID = 'your-view-id'

   # Verify the service account file path
   if not os.path.exists(SERVICE_ACCOUNT_FILE):
       logger.error(f"Service account file does not exist at the specified path: {SERVICE_ACCOUNT_FILE}")
       raise FileNotFoundError(f"Service account file not found at {SERVICE_ACCOUNT_FILE}")

   logger.info("Service account file path verified.")

   # Define the scope
   SCOPES = ['https://www.googleapis.com/auth/analytics.readonly']

   try:
       # Authenticate and initialize the Analytics Reporting API service
       credentials = service_account.Credentials.from_service_account_file(
           SERVICE_ACCOUNT_FILE, scopes=SCOPES)

       analytics = build('analyticsreporting', 'v4', credentials=credentials)
       logger.info("Successfully authenticated and initialized the Analytics Reporting API service.")

   except Exception as e:
       logger.error(f"Failed to authenticate or initialize the Analytics Reporting API service: {e}")
       raise

   # Function to fetch the data
   def fetch_report(analytics, view_id):
       try:
           return analytics.reports().batchGet(
               body={
                   'reportRequests': [
                       {
                           'viewId': view_id,
                           'dateRanges': [{'startDate': '30daysAgo', 'endDate': 'today'}],
                           'metrics': [{'expression': 'ga:sessions'}],
                           'dimensions': [{'name': 'ga:date'}, {'name': 'ga:sourceMedium'}]
                       }]
               }
           ).execute()
       except Exception as e:
           logger.error(f"Failed to fetch the report: {e}")
           raise

   # Fetch the data
   response = fetch_report(analytics, VIEW_ID)
   logger.info("Successfully fetched the report.")

   # Process the response and convert it to a pandas DataFrame
   def parse_response(response):
       try:
           reports = response.get('reports', [])
           for report in reports:
               column_header = report.get('columnHeader', {})
               dimension_headers = column_header.get('dimensions', [])
               metric_headers = column_header.get('metricHeader', {}).get('metricHeaderEntries', [])

               rows = report.get('data', {}).get('rows', [])
               data = []

               for row in rows:
                   dimensions = row.get('dimensions', [])
                   date_range_values = row.get('metrics', [])

                   row_data = []
                   row_data.extend(dimensions)

                   for values in date_range_values:
                       for value in values.get('values'):
                           row_data.append(value)

                   data.append(row_data)

               header = dimension_headers + [metric.get('name') for metric in metric_headers]
               df = pd.DataFrame(data, columns=header)
           return df
       except Exception as e:
           logger.error(f"Failed to parse the response: {e}")
           raise

   # Parse the response
   dataframe = parse_response(response)
   logger.info("Successfully parsed the response into a DataFrame.")

   # Define the folder path where you want to save the data
   output_folder = 'path/to/your/output/folder'

   # Create the folder if it does not exist
   os.makedirs(output_folder, exist_ok=True)
   logger.info(f"Output folder '{output_folder}' is ready.")

   # Define the output file path
   output_file = os.path.join(output_folder, 'analytics_data.csv')

   # Save the DataFrame to a CSV file
   try:
       dataframe.to_csv(output_file, index=False)
       logger.info(f"Data successfully saved to {output_file}")
   except Exception as e:
       logger.error(f"Failed to save the DataFrame to CSV: {e}")
       raise
   ```

### Step 7: Run the Script

1. **Execute the Script**:
   - Run the script in your Python environment.

2. **Verify the Output**:
   - Check the output folder for the `analytics_data.csv` file containing the fetched Google Analytics data.

## Troubleshooting

- **File Not Found**: Ensure the JSON key file path is correct and the file exists.
- **Authentication Issues**: Verify the service account has the necessary permissions in both Google Cloud and Google Analytics.
- **API Errors**: Check the API quotas and ensure the API is enabled in the Google Cloud Console.

---
This README file provides detailed setup instructions, including how to configure and run the script, ensuring users can easily understand and use your script to export Google Analytics data.