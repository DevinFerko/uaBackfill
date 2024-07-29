# AdWords
SELECT
    CAST (`ga:adwordsCampaignID` AS INT64) AS `AdWordsCampaignID`,
    CAST (`ga:adwordsAdGroupID` AS INT64) AS `AdWordsAdGroupID`,
    CAST (`ga:adwordsCreativeID` AS INT64) AS `AdWordsCreativeID`,
    CAST (`ga:adwordsCriteriaID` AS INT64) AS `AdWordsCriteriaID`,
    CAST (`ga:adQueryWordCount` AS INT64) AS `AdQueryWordCount`,
    `ga:isTrueViewVideoAd` AS `IsTrueViewVideoAd`,
    CAST (`ga:CTR` AS FLOAT64) AS `CTR`,
    CAST (`ga:costPerTransaction` AS FLOAT64) AS `CostPerTransaction`,
    CAST (`ga:costPerGoalConversion` AS FLOAT64) AS `CostPerGoalConversion`,
    CAST (`ga:costPerConversion` AS FLOAT64) AS `CostPerConversion`,
    CAST (`ga:RPC` AS FLOAT64) AS `RPC`,
    CAST (`ga:ROAS` AS FLOAT64) AS `ROAS`
  FROM 
  `ua-backfill-424912.UA_DR.DR-Adwords1`; # AdWords-Pre2018

# Channel Grouping
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:channelGrouping` AS ChannelGrouping,
  CAST (`ga:visits` AS INT64) AS Visits 
FROM 
  `ua-backfill-424912.UA_DR.DR-ChannelGrouping`; # Channel Grouping Pre 2018

# Content Experiments
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:experimentId` AS `ExperimentID`,
  CAST (`ga:experimentVariant` AS INT64) AS `ExperimentVariant`,
  `ga:experimentCombination` AS `ExperimentCombination`,
  `ga:experimentName` AS `ExperimentName`,
  CAST (`ga:visits` AS INT64) AS `Visits`
FROM 
  `ua-backfill-424912.UA_DR.DR-ContentExperiments`; # Content Experiment Pre 2018

# Ecommerce1
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:transactionId` AS `TransactionId`,
  `ga:affiliation` AS `Affiliation`,
  CAST (`ga:sessionsToTransaction` AS INT64) AS `SessionsToTransaction`,
  CAST (`ga:daysToTransaction` AS INT64) AS `DaysToTransaction`,
  `ga:checkoutOptions` AS `CheckoutOptions`,
  `ga:orderCouponCode` AS `OrderCouponCode`,
  `ga:shoppingStage` AS `ShoppingStage`,
  CAST (`ga:transactions` AS INT64) AS `Transactions`,
  CAST (`ga:transactionRevenue` AS FLOAT64) AS `TransactionRevenue`,
  CAST (`ga:revenuePerTransaction` AS FLOAT64) AS `RevenuePerTransaction`,
  CAST (`ga:transactionRevenuePerSession` AS FLOAT64) AS `TransactionRevenuePerSession`,
  CAST (`ga:transactionShipping` AS FLOAT64) AS `TransactionShipping`,
  CAST (`ga:transactionTax` AS FLOAT64) AS `TransactionTax`,
  CAST (`ga:totalValue` AS FLOAT64) AS `TotalValue`,
  CAST (`ga:itemQuantity` AS INT64) AS `ItemQuantity`,
  CAST (`ga:uniquePurchases` AS INT64) AS `UniquePurchases`
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce1`;

#Ecommerce2
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:transactionId` AS `TransactionId`,
  `ga:affiliation` AS `Affiliation`,
  CAST (`ga:sessionsToTransaction` AS INT64) AS `SessionsToTransaction`,
  CAST (`ga:daysToTransaction` AS INT64) AS `DaysToTransaction`,
  `ga:checkoutOptions` AS `CheckoutOptions`,
  `ga:orderCouponCode` AS `OrderCouponCode`,
  `ga:shoppingStage` AS `ShoppingStage`,
  CAST (`ga:productDetailViews` AS INT64) AS `ProductDetailViews`,
  CAST (`ga:productListCTR` AS FLOAT64) AS `ProductListCTR`,
  CAST (`ga:productListClicks` AS INT64) AS `ProductListClicks`,
  CAST (`ga:productListViews` AS INT64) AS `ProductListViews`,  
  CAST (`ga:productRefundAmount` AS FLOAT64) AS `ProductRefundAmount`,
  CAST (`ga:productRefunds` AS INT64) AS `ProductRefunds`,
  CAST (`ga:productRemovesFromCart` AS INT64) AS `ProductRemovesFromCart`,
  CAST (`ga:productRevenuePerPurchase` AS FLOAT64) AS `ProductRevenuePerPurchase`,
  CAST (`ga:quantityAddedToCart` AS INT64) AS `QuantityAddedToCart`,
  CAST (`ga:quantityCheckedOut` AS INT64) AS `QuantityCheckedOut`
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce2-Pre2018`;

#Ecommerce3
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:transactionId` AS `TransactionId`,
  `ga:affiliation` AS `Affiliation`,
  CAST (`ga:sessionsToTransaction` AS INT64) AS `SessionsToTransaction`,
  CAST (`ga:daysToTransaction` AS INT64) AS `DaysToTransaction`,
  `ga:checkoutOptions` AS `CheckoutOptions`,
  `ga:orderCouponCode` AS `OrderCouponCode`,
  `ga:shoppingStage` AS `ShoppingStage`,
  CAST (`ga:revenuePerItem` AS FLOAT64) AS `RevenuePerItem`,
  CAST (`ga:itemRevenue` AS FLOAT64) AS `ItemRevenue`,
  CAST (`ga:itemsPerPurchase` AS FLOAT64) AS `ItemsPerPurchase`,
  CAST (`ga:buyToDetailRate` AS FLOAT64) AS `BuyToDetailRate`,
  CAST (`ga:cartToDetailRate` AS FLOAT64) AS `CartToDetailRate`,  
  CAST (`ga:internalPromotionCTR` AS FLOAT64) AS `InternalPromotionCTR`,
  CAST (`ga:internalPromotionClicks` AS INT64) AS `InternalPromotionClicks`,
  CAST (`ga:internalPromotionViews` AS INT64) AS `InternalPromotionViews`,
  CAST (`ga:productAddsToCart` AS INT64) AS `ProductAddsToCart`,
  CAST (`ga:productCheckouts` AS INT64) AS `ProductCheckouts`
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce3-Pre2018`;

#Ecommerce4
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:transactionId` AS `TransactionId`,
  `ga:affiliation` AS `Affiliation`,
  CAST (`ga:sessionsToTransaction` AS INT64) AS `SessionsToTransaction`,
  CAST (`ga:daysToTransaction` AS INT64) AS `DaysToTransaction`,
  `ga:checkoutOptions` AS `CheckoutOptions`,
  `ga:orderCouponCode` AS `OrderCouponCode`,
  `ga:shoppingStage` AS `ShoppingStage`,
  CAST (`ga:quantityRefunded` AS INT64) AS `QuantityRefunded`,
  CAST (`ga:quantityRemovedFromCart` AS INT64) AS `QuantityRemovedFromCart`,
  CAST (`ga:refundAmount` AS FLOAT64) AS `RefundAmount`,
  CAST (`ga:revenuePerUser` AS FLOAT64) AS `RevenuePerUser`,
  CAST (`ga:totalRefunds` AS INT64) AS `TotalRefunds`,  
  CAST (`ga:transactionsPerUser` AS FLOAT64) AS `TransactionsPerUser`
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce4-Pre2018`;
	
# Ecommerce5
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:productSku` AS `ProductSku`,
  `ga:productName` AS `ProductName`,
  `ga:productBrand` AS `ProductBrand`,
  `ga:productCategoryHierarchy` AS `ProductCategoryHierarchy`,
  `ga:productCouponCode` AS `ProductCouponCode`,
  `ga:productListName` AS `ProductListName`,
  `ga:productListPosition` AS `ProductListPositione`,
  `ga:productVariant` AS `ProductVariant`,
  CAST (`ga:itemQuantity` AS INT64) AS `ItemQuantity`,
  CAST (`ga:uniquePurchases` AS INT64) AS `UniquePurchases`,
  CAST (`ga:revenuePerItem` AS FLOAT64) AS `RevenuePerItem`,
  CAST (`ga:itemRevenue` AS FLOAT64) AS `ItemRevenue`,
  CAST (`ga:itemsPerPurchase` AS FLOAT64) AS `ItemsPerPurchase`,
  CAST (`ga:localItemRevenue` AS FLOAT64) AS `LocalItemRevenue`,
  CAST (`ga:buyToDetailRate` AS FLOAT64) AS `BuyToDetailRate`,
  CAST (`ga:cartToDetailRate` AS FLOAT64) AS `CartToDetailRate`,
  CAST (`ga:localProductRefundAmount` AS FLOAT64) AS `LocalProductRefundAmount`, 
  CAST (`ga:productAddsToCart` AS INT64) AS `ProductAddsToCart`
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce5-Pre2018`;

#Ecommerce6
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:productSku` AS `ProductSku`,
  `ga:productName` AS `ProductName`,
  `ga:productBrand` AS `ProductBrand`,
  `ga:productCategoryHierarchy` AS `ProductCategoryHierarchy`,
  `ga:productCouponCode` AS `ProductCouponCode`,
  `ga:productListName` AS `ProductListName`,
  `ga:productListPosition` AS `ProductListPositione`,
  `ga:productVariant` AS `ProductVariant`,
  CAST (`ga:productCheckouts` AS INT64) AS `ProductCheckouts`,
  CAST (`ga:productDetailViews` AS INT64) AS `ProductDetailViews`,
  CAST (`ga:productListCTR` AS FLOAT64) AS `ProductListCTR`,
  CAST (`ga:productListClicks` AS INT64) AS `ProductListClicks`,
  CAST (`ga:productListViews` AS INT64) AS `ProductListViews`,
  CAST (`ga:productRefundAmount` AS FLOAT64) AS `ProductRefundAmount`,
  CAST (`ga:productRefunds` AS INT64) AS `ProductRefunds`,
  CAST (`ga:productRemovesFromCart` AS INT64) AS `ProductRemovesFromCart`,
  CAST (`ga:productRevenuePerPurchase` AS FLOAT64) AS `ProductRevenuePerPurchase`, 
  CAST (`ga:quantityAddedToCart` AS INT64) AS `QuantityAddedToCart`
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce6`;

#Ecommerce7
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:productSku` AS `ProductSku`,
  `ga:productName` AS `ProductName`,
  `ga:productBrand` AS `ProductBrand`,
  `ga:productCategoryHierarchy` AS `ProductCategoryHierarchy`,
  `ga:productCouponCode` AS `ProductCouponCode`,
  `ga:productListName` AS `ProductListName`,
  `ga:productListPosition` AS `ProductListPositione`,
  `ga:productVariant` AS `ProductVariant`,
  CAST (`ga:quantityCheckedOut` AS INT64) AS `QuantityCheckedOut`,
  CAST (`ga:quantityRefunded` AS INT64) AS `QuantityRefunded`,
  CAST (`ga:quantityRemovedFromCart` AS INT64) AS `QuantityRemovedFromCart`,
FROM 
  `ua-backfill-424912.UA_DR.DR-Ecommerce7`;

#EventTracking

#GeoNetwork1
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:continent` AS `Continent`,
  `ga:country` AS `Country`,
  `ga:region` AS `Region`,
  `ga:metro` AS `Metro`,
  `ga:city` AS `City`,
  CAST (`ga:latitude` AS FLOAT64) AS `Latitude`,
  CAST (`ga:longitude` AS FLOAT64) AS `Longitude`,
  `ga:networkDomain` AS `NetworkDomain`,
  CAST (`ga:users` AS INT64) AS `Users`
FROM 
  `ua-backfill-424912.UA_DR.DR-GeoNetwork1`;

#GeoNetwork2
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:networkLocation` AS `NetworkLocation`,
  `ga:cityId` AS `CityId`,
  `ga:continentId` AS `ContinentId`,
  `ga:countryIsoCode` AS `CountryIsoCode`,
  `ga:metroId` AS `MetroId`,
  `ga:regionId` AS `RegionId`,
  `ga:regionIsoCode` AS `RegionIsoCode`,
  CAST (`ga:users` AS INT64) AS `Users`
FROM 
  `ua-backfill-424912.UA_DR.OR-GeoNetwork2`;

#GoalConversions 
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:goalCompletionLocation` AS `GoalCompletionLocation`,
  `ga:goalPreviousStep1` AS `GoalPreviousStep1`,
  `ga:goalPreviousStep2` AS `GoalPreviousStep2`,
  `ga:goalPreviousStep3` AS `GoalPreviousStep3`,
  CAST (`ga:goalValuePerSession` AS FLOAT64) AS `GoalValuePerSession`,
  CAST (`ga:goalStartsAll` AS INT64) AS `GoalStartsAll`,
  CAST (`ga:goalConversionRateAll` AS FLOAT64) AS `GoalConversionRateAll`,
  CAST (`ga:goalCompletionsAll` AS INT64) AS `GoalCompletionsAll`,
  CAST (`ga:goalAbandonsAll` AS INT64) AS `GoalAbandonsAll`,
  CAST (`ga:goalValueAll` AS FLOAT64) AS `GoalValueAll`,
  CAST (`ga:goalAbandonRateAll` AS FLOAT64) AS `GoalAbandonRateAll`,
FROM 
  `ua-backfill-424912.UA_DR.DR-GoalConversions`;

#### OR

SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:goalCompletionLocation` AS `GoalCompletionLocation`,
  `ga:goalPreviousStep1` AS `GoalPreviousStep1`,
  `ga:goalPreviousStep2` AS `GoalPreviousStep2`,
  `ga:goalPreviousStep3` AS `GoalPreviousStep3`,
  SAFE_CAST(`ga:goalValuePerSession` AS FLOAT64) AS `GoalValuePerSession`,
  SAFE_CAST(`ga:goalStartsAll` AS INT64) AS `GoalStartsAll`,
  SAFE_CAST(`ga:goalConversionRateAll` AS FLOAT64) AS `GoalConversionRateAll`,
  SAFE_CAST(`ga:goalCompletionsAll` AS INT64) AS `GoalCompletionsAll`,
  SAFE_CAST(`ga:goalAbandonsAll` AS INT64) AS `GoalAbandonsAll`,
  SAFE_CAST(`ga:goalValueAll` AS FLOAT64) AS `GoalValueAll`,
  SAFE_CAST(`ga:goalAbandonRateAll` AS FLOAT64) AS `GoalAbandonRateAll`
FROM 
  `ua-backfill-424912.UA_DR.DR-GoalConversions`;

#InternalSearch1
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:searchUsed` AS `SearchUsed`,
  `ga:searchKeyword` AS `SearchKeyword`,
  `ga:searchKeywordRefinement` AS `SearchKeywordRefinement`,
  `ga:searchCategory` AS `SearchCategory`,
  `ga:searchStartPage` AS `SearchStartPage`,
  `ga:searchDestinationPage` AS `SearchDestinationPage`,
  `ga:searchAfterDestinationPage` AS `SearchAfterDestinationPage`,
  SAFE_CAST(`ga:searchResultViews` AS INT64) AS `SearchResultViews`,
  SAFE_CAST(`ga:searchUniques` AS INT64) AS `SearchUniques`,
  SAFE_CAST(`ga:avgSearchResultViews` AS FLOAT64) AS `AvgSearchResultViews`,
  SAFE_CAST(`ga:searchSessions` AS INT64) AS `SearchSessions`,
  SAFE_CAST(`ga:percentSessionsWithSearch` AS FLOAT64) AS `PercentSessionsWithSearch`,
  SAFE_CAST(`ga:searchDepth` AS INT64) AS `SearchDepth`,
  SAFE_CAST(`ga:avgSearchDepth` AS FLOAT64) AS `AvgSearchDepth`,
  SAFE_CAST(`ga:searchRefinements` AS INT64) AS `SearchRefinements`
FROM 
  `ua-backfill-424912.UA_DR.DR-InternalSearch1`;

#InternalSearch2
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:searchUsed` AS `SearchUsed`,
  `ga:searchKeyword` AS `SearchKeyword`,
  `ga:searchKeywordRefinement` AS `SearchKeywordRefinement`,
  `ga:searchCategory` AS `SearchCategory`,
  `ga:searchStartPage` AS `SearchStartPage`,
  `ga:searchDestinationPage` AS `SearchDestinationPage`,
  `ga:searchAfterDestinationPage` AS `SearchAfterDestinationPage`,
  SAFE_CAST(`ga:percentSearchRefinements` AS FLOAT64) AS `PercentSearchRefinements`,
  SAFE_CAST(`ga:searchDuration` AS FLOAT64) AS `SearchDuration`,
  SAFE_CAST(`ga:avgSearchDuration` AS FLOAT64) AS `AvgSearchDuration`,
  SAFE_CAST(`ga:searchExits` AS INT64) AS `SearchExits`,
  SAFE_CAST(`ga:searchExitRate` AS FLOAT64) AS `SearchExitRate`,
  SAFE_CAST(`ga:searchGoalConversionRateAll` AS FLOAT64) AS `SearchGoalConversionRateAll`,
  SAFE_CAST(`ga:goalValueAllPerSearch` AS FLOAT64) AS `GoalValueAllPerSearch`
FROM 
  `ua-backfill-424912.UA_OR.OR-InternalSearch2-Pre2018`;

#PageTracking1
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:hostname` AS `HostName`,
  `ga:pagePath` AS `PagePath`,
  `ga:pagePathLevel1` AS `PagePathLevel1`,
  `ga:pagePathLevel2` AS `PagePathLevel2`,
  `ga:pagePathLevel3` AS `PagePathLevel3`,
  `ga:pagePathLevel4` AS `PagePathLevel4`,
  SAFE_CAST(`ga:pageValue` AS FLOAT64) AS `PageValue`,
  SAFE_CAST(`ga:entrances` AS INT64) AS `Entrances`,
  SAFE_CAST(`ga:entranceRate` AS FLOAT64) AS `EntranceRate`,
  SAFE_CAST(`ga:pageviewsPerSession` AS FLOAT64) AS `PageviewsPerSession`,
  SAFE_CAST(`ga:uniquePageviews` AS INT64) AS `UniquePageviews`,
  SAFE_CAST(`ga:timeOnPage` AS FLOAT64) AS `TimeOnPage`,
  SAFE_CAST(`ga:avgTimeOnPage` AS FLOAT64) AS `AvgTimeOnPage`,
  SAFE_CAST(`ga:pageviews` AS INT64) AS `Pageviews`,
  SAFE_CAST(`ga:exits` AS INT64) AS `Exits`,
  SAFE_CAST(`ga:exitRate` AS FLOAT64) AS `ExitRate`
FROM 
  `ua-backfill-424912.UA_DR.DR-PageTracking1`;

#PageTracking2-Year
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:pagePath` AS `PagePath`,
  SAFE_CAST(`ga:pageValue` AS FLOAT64) AS `PageValue`,
  SAFE_CAST(`ga:entrances` AS INT64) AS `Entrances`,
  SAFE_CAST(`ga:entranceRate` AS FLOAT64) AS `EntranceRate`,
  SAFE_CAST(`ga:pageviewsPerSession` AS FLOAT64) AS `PageviewsPerSession`,
  SAFE_CAST(`ga:uniquePageviews` AS INT64) AS `UniquePageviews`,
  SAFE_CAST(`ga:timeOnPage` AS FLOAT64) AS `TimeOnPage`,
  SAFE_CAST(`ga:avgTimeOnPage` AS FLOAT64) AS `AvgTimeOnPage`,
  SAFE_CAST(`ga:pageviews` AS INT64) AS `Pageviews`,
  SAFE_CAST(`ga:exits` AS INT64) AS `Exits`,
  SAFE_CAST(`ga:exitRate` AS FLOAT64) AS `ExitRate`
FROM 
  `ua-backfill-424912.UA_TW.TW-PageTracking2-2011`;

#PlatformDevice1
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:browser` AS `Browser`,
  `ga:browserVersion` AS `BrowserVersion`,
  `ga:operatingSystem` AS `OperatingSystem`,
  `ga:operatingSystemVersion` AS `OperatingSystemVersion`,
  `ga:mobileDeviceBranding` AS `MobileDeviceBranding`,
  `ga:mobileDeviceModel` AS `MobileDeviceModel`,
  SAFE_CAST(`ga:users` AS INT64) AS `Users`
FROM 
  `ua-backfill-424912.UA_OR.OR-PlatformDevice1`;

#PlatformDevice2
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:mobileInputSelector` AS `MobileInputSelector`,
  `ga:mobileDeviceInfo` AS `MobileDeviceInfo`,
  `ga:mobileDeviceMarketingName` AS `MobileDeviceMarketingName`,
  `ga:deviceCategory` AS `DeviceCategory`,
  `ga:browserSize` AS `BrowserSize`,
  `ga:dataSource` AS `DataSource`,
  SAFE_CAST(`ga:users` AS INT64) AS `Users`
FROM 
  `ua-backfill-424912.UA_TW.TW-PlatformDevice2-Pre2018`;

#Session
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  SAFE_CAST(`ga:sessionDurationBucket` AS INT64) AS `SessionDurationBucket`,
  SAFE_CAST(`ga:sessions` AS INT64) AS `Sessions`,
  SAFE_CAST(`ga:bounces` AS INT64) AS `Bounces`,
  SAFE_CAST(`ga:bounceRate` AS FLOAT64) AS `BounceRate`,
  SAFE_CAST(`ga:sessionDuration` AS FLOAT64) AS `SessionDuration`,
  SAFE_CAST(`ga:avgSessionDuration` AS FLOAT64) AS `AvgSessionDuration`,
  SAFE_CAST(`ga:uniqueDimensionCombinations` AS INT64) AS `UniqueDimensionCombinations`,
  SAFE_CAST(`ga:hits` AS INT64) AS `Hits`
FROM 
  `ua-backfill-424912.UA_TW.TW-Session-Pre2018`;

#SiteSpeed1
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  SAFE_CAST(`ga:pageLoadTime` AS INT64) AS `PageLoadTime`,
  SAFE_CAST(`ga:pageLoadSample` AS INT64) AS `PageLoadSample`,
  SAFE_CAST(`ga:avgPageLoadTime` AS FLOAT64) AS `AvgPageLoadTime`,
  SAFE_CAST(`ga:domainLookupTime` AS INT64) AS `DomainLookupTime`,
  SAFE_CAST(`ga:avgDomainLookupTime` AS FLOAT64) AS `AvgDomainLookupTime`,
  SAFE_CAST(`ga:pageDownloadTime` AS INT64) AS `PageDownloadTime`,
  SAFE_CAST(`ga:avgPageDownloadTime` AS FLOAT64) AS `AvgPageDownloadTime`,
  SAFE_CAST(`ga:redirectionTime` AS INT64) AS `RedirectionTime`,
  SAFE_CAST(`ga:avgRedirectionTime` AS FLOAT64) AS `AvgRedirectionTime`,
  SAFE_CAST(`ga:serverConnectionTime` AS INT64) AS `ServerConnectionTime`
FROM 
  `ua-backfill-424912.UA_DR.DR-SiteSpeed1`;

#Time
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  SAFE_CAST(`ga:year` AS INT64) AS `Year`,
  SAFE_CAST(`ga:month` AS INT64) AS `Month`,
  SAFE_CAST(`ga:week` AS INT64) AS `Week`,
  SAFE_CAST(`ga:day` AS INT64) AS `Day`,
  SAFE_CAST(`ga:dayOfWeek` AS INT64) AS `DayOfWeek`,
  `ga:dayOfWeekName` AS `DayOfWeekName`,
  SAFE_CAST(`ga:yearMonth` AS INT64) AS `YearMonth`,
  SAFE_CAST(`ga:yearWeek` AS INT64) AS `YearWeek`,
  SAFE_CAST(`ga:visits` AS INT64) AS `Visits`
FROM 
  `ua-backfill-424912.UA_TW.TW-Time-Pre2018`;

#TrafficSources
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:referralPath` AS `ReferralPath`,
  `ga:fullReferrer` AS `FullReferrer`,
  `ga:campaign` AS `Campaign`,
  `ga:source` AS `Source`,
  `ga:medium` AS `Medium`,
  `ga:sourceMedium` AS `SourceMedium`,
  SAFE_CAST(`ga:organicSearches` AS INT64) AS `OrganicSearches`
FROM 
  `ua-backfill-424912.UA_TW.TW-TrafficSources`;

#Users
SELECT
  PARSE_DATE('%Y%m%d', `ga:date`) AS `Date`,
  `ga:userType` AS `UserType`,
  SAFE_CAST(`ga:sessionCount` AS INT64) AS `SessionCount`,
  SAFE_CAST(`ga:daysSinceLastSession` AS INT64) AS `DaysSinceLastSession`,
  `ga:userDefinedValue` AS `UserDefinedValue`,
  SAFE_CAST(`ga:userBucket` AS INT64) AS `UserBucket`,
  SAFE_CAST(`ga:users` AS INT64) AS `Users`,
  SAFE_CAST(`ga:newUsers` AS INT64) AS `NewUsers`,
  SAFE_CAST(`ga:percentNewSessions` AS FLOAT64) AS `PercentNewSessions`,
  SAFE_CAST(`ga:sessionsPerUser` AS FLOAT64) AS `SessionsPerUser`
FROM 
  `ua-backfill-424912.UA_TW.TW-Users-Pre2018`;

#Merges
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.AdWords`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.AdWords-Pre2018`

SELECT * FROM `ua-backfill-424912.OnlyRadiators_UA_Data.InternalSearch2`
UNION ALL
SELECT * FROM `ua-backfill-424912.OnlyRadiators_UA_Data.InternalSearch2-Pre2018`

SELECT * FROM `ua-backfill-424912.TapWarehouse_UA_Data.PlatformDevice1`
UNION ALL
SELECT * FROM `ua-backfill-424912.TapWarehouse_UA_Data.PlatformDevice1-Pre2018`

SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2016`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2017`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2018`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2019`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2020`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2021`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2022`
UNION ALL
SELECT * FROM `ua-backfill-424912.Drench_UA_Data.PageTracking2-2023`

#SiteSpeedJoin
SELECT 
  t1.Date,
  t1.PageLoadTime,
  t1.PageLoadSample,
  t1.AvgPageLoadTime,
  t1.DomainLookupTime,
  t1.AvgDomainLookupTime,
  t1.PageDownloadTime,
  t1.AvgPageDownloadTime,
  t1.RedirectionTime,
  t1.AvgRedirectionTime,
  t1.ServerConnectionTime,
  t2.AvgServerConnectionTime,
  t2.ServerResponseTime,
  t2.AvgServerResponseTime,
  t2.SpeedMetricsSample,
  t2.DomInteractiveTime,
  t2.AvgDomInteractiveTime,
  t2.DomContentLoadedTime,
  t2.AvgDomContentLoadedTime,
  t2.DomLatencyMetricsSample
FROM
  `ua-backfill-424912.Drench_UA_Data.Site-Speed-1` AS t1
JOIN
  `ua-backfill-424912.Drench_UA_Data.Site-Speed-2` AS t2
ON
  t1.Date = t2.Date

#InternalSearchJoin
SELECT 
  t1.Date,
  t1.SearchUsed,
  t1.SearchKeyword,
  t1.SearchKeywordRefinement,
  t1.SearchCategory,
  t1.SearchStartPage,
  t1.SearchDestinationPage,
  t1.SearchAfterDestinationPage,
  t1.SearchResultViews,
  t1.SearchUniques,
  t1.AvgSearchResultViews,
  t1.SearchSessions,
  t1.PercentSessionsWithSearch,
  t1.SearchDepth,
  t1.AvgSearchDepth,
  t1.SearchRefinements,
  t2.PercentSearchRefinements,
  t2.SearchDuration,
  t2.AvgSearchDuration,
  t2.SearchExits,
  t2.SearchExitRate,
  t2.SearchGoalConversionRateAll,
  t2.GoalValueAllPerSearch
FROM
  `ua-backfill-424912.Drench_UA_Data.Internal-Search-1` AS t1
JOIN
  `ua-backfill-424912.Drench_UA_Data.Internal-Search-2` AS t2
ON
  t1.Date = t2.Date AND
  t1.SearchUsed = t2.SearchUsed AND
  t1.SearchKeyword = t2.SearchKeyword AND
  t1.SearchKeywordRefinement = t2.SearchKeywordRefinement AND
  t1.SearchCategory = t2.SearchCategory AND
  t1.SearchStartPage = t2.SearchStartPage AND
  t1.SearchDestinationPage = t2.SearchDestinationPage AND
  t1.SearchAfterDestinationPage = t2.SearchAfterDestinationPage;

#AdWordsJoin
SELECT 
  t1.AdWordsCampaignID,
  t1.AdWordsAdGroupID,
  t1.AdWordsCreativeID,
  t2.AdWordsCriteriaID,
  t2.AdQueryWordCount,
  t2.IsTrueViewVideoAd,
  t1.CTR,
  t1.CostPerTransaction,
  t1.CostPerGoalConversion,
  t1.CostPerConversion,
  t1.RPC,
  t1.ROAS
FROM
  `ua-backfill-424912.TapWarehouse_UA_Data.AdWords1` AS t1
JOIN
  `ua-backfill-424912.TapWarehouse_UA_Data.AdWords2` AS t2
ON
  t1.CTR = t2.CTR AND
  t1.CostPerTransaction = t2.CostPerTransaction AND
  t1.CostPerGoalConversion = t2.CostPerGoalConversion AND
  t1.CostPerConversion = t2.CostPerConversion AND
  t1.RPC = t2.RPC AND
  t1.ROAS = t2.ROAS;

#Ecommerce 1 and 2 Merges
SELECT
    t1.Date,
    t1.TransactionId,
    t1.Affiliation,
    t1.SessionsToTransaction,
    t1.DaysToTransaction,
    t1.CheckoutOptions,
    t1.OrderCouponCode,
    t1.ShoppingStage,
    t1.Transactions,
    t1.TransactionRevenue,
    t1.RevenuePerTransaction,
    t1.TransactionRevenuePerSession,
    t1.TransactionShipping,
    t1.TransactionTax,
    t1.TotalValue,
    t1.ItemQuantity,
    t1.UniquePurchases,
    t2.ProductDetailViews,
    t2.ProductListCTR,
    t2.ProductListClicks,
    t2.ProductListViews,
    t2.ProductRefundAmount,
    t2.ProductRefunds,
    t2.ProductRemovesFromCart,
    t2.ProductRevenuePerPurchase,
    t2.QuantityAddedToCart,
    t2.QuantityCheckedOut
FROM
    `ua-backfill-424912.Drench_UA_Data.Ecommerce-1` AS t1
JOIN
    `ua-backfill-424912.Drench_UA_Data.Ecommerce-2` AS t2
ON
    t1.Date = t2.Date AND
    t1.TransactionId = t2.TransactionId AND
    t1.Affiliation = t2.Affiliation AND
    t1.SessionsToTransaction = t2.SessionsToTransaction AND
    t1.DaysToTransaction = t2.DaysToTransaction AND
    t1.CheckoutOptions = t2.CheckoutOptions AND
    t1.OrderCouponCode = t2.OrderCouponCode AND
    t1.ShoppingStage = t2.ShoppingStage;

#ecommerce 3 and 4 Merges
SELECT
    t1.Date,
    t1.TransactionId,
    t1.Affiliation,
    t1.SessionsToTransaction,
    t1.DaysToTransaction,
    t1.CheckoutOptions,
    t1.OrderCouponCode,
    t1.ShoppingStage,
    t1.RevenuePerItem,
    t1.ItemRevenue,
    t1.ItemsPerPurchase,
    t1.BuyToDetailRate,
    t1.CartToDetailRate,
    t1.InternalPromotionCTR,
    t1.InternalPromotionClicks,
    t1.InternalPromotionViews,
    t1.ProductAddsToCart,
    t1.ProductCheckouts,
    t2.QuantityRefunded,
    t2.QuantityRemovedFromCart,
    t2.RefundAmount,
    t2.RevenuePerUser,
    t2.TotalRefunds,
    t2.TransactionsPerUser
FROM
    `ua-backfill-424912.Drench_UA_Data.Ecommerce-3` AS t1
JOIN
    `ua-backfill-424912.Drench_UA_Data.Ecommerce-4` AS t2
ON
    t1.Date = t2.Date AND
    t1.TransactionId = t2.TransactionId AND
    t1.Affiliation = t2.Affiliation AND
    t1.SessionsToTransaction = t2.SessionsToTransaction AND
    t1.DaysToTransaction = t2.DaysToTransaction AND
    t1.CheckoutOptions = t2.CheckoutOptions AND
    t1.OrderCouponCode = t2.OrderCouponCode AND
    t1.ShoppingStage = t2.ShoppingStage;

#ecommerce 5 and 6 Merges
SELECT
    t1.Date,
    t1.ProductSku,
    t1.ProductName,
    t1.ProductBrand,
    t1.ProductCategoryHierarchy,
    t1.ProductCouponCode,
    t1.ProductListName,
    t1.ProductListPositione,
    t1.ProductVariant,
    t1.ItemQuantity,
    t1.UniquePurchases,
    t1.RevenuePerItem,
    t1.ItemRevenue,
    t1.ItemsPerPurchase,
    t1.LocalItemRevenue,
    t1.BuyToDetailRate,
    t1.CartToDetailRate,
    t1.LocalProductRefundAmount,
    t2.ProductCheckouts,
    t2.ProductDetailViews,
    t2.ProductListCTR,
    t2.ProductListClicks,
    t2.ProductListViews,
    t2.ProductRefundAmount,
    t2.ProductRefunds,
    t2.ProductRemovesFromCart,
    t2.ProductRevenuePerPurchase,
    t2.QuantityAddedToCart

FROM
    `ua-backfill-424912.Drench_UA_Data.Ecommerce-5` AS t1
JOIN
    `ua-backfill-424912.Drench_UA_Data.Ecommerce-6` AS t2
ON
    t1.Date = t2.Date AND
    t1.ProductSku = t2.ProductSku AND
    t1.ProductName = t2.ProductName AND
    t1.ProductBrand = t2.ProductBrand AND
    t1.ProductCategoryHierarchy = t2.ProductCategoryHierarchy AND
    t1.ProductCouponCode = t2.ProductCouponCode AND
    t1.ProductListName = t2.ProductListName AND
    t1.ProductListPositione = t2.ProductListPositione AND
    t1.ProductVariant = t2.ProductVariant;

#ecommerce 1and2 3and4 Merge
SELECT
  *
FROM
  `ua-backfill-424912.Drench_UA_Data.Ecommerce-1and2` AS t1
JOIN
  `ua-backfill-424912.Drench_UA_Data.Ecommerce-3and4` AS t2
ON
  t1.Date = t2.Date AND
  t1.TransactionId = t2.TransactionId AND
  t1.Affiliation = t2.Affiliation AND
  t1.SessionsToTransaction = t2.SessionsToTransaction AND
  t1.DaysToTransaction = t2.DaysToTransaction AND
  t1.CheckoutOptions = t2.CheckoutOptions AND
  t1.OrderCouponCode = t2.OrderCouponCode AND
  t1.ShoppingStage = t2.ShoppingStage;

#ecommerce 5and6 & 7 Merge
SELECT
  *
FROM
  `ua-backfill-424912.Drench_UA_Data.Ecommerce-5and6` AS t1
JOIN
  `ua-backfill-424912.Drench_UA_Data.Ecommerce-7` AS t2
ON
  t1.Date = t2.Date AND
  t1.ProductSku = t2.ProductSku AND
  t1.ProductName = t2.ProductName AND
  t1.ProductBrand = t2.ProductBrand AND
  t1.ProductCategoryHierarchy = t2.ProductCategoryHierarchy AND
  t1.ProductCouponCode = t2.ProductCouponCode AND
  t1.ProductListName = t2.ProductListName AND
  t1.ProductListPositione = t2.ProductListPositione AND
  t1.ProductVariant = t2.ProductVariant;

#Platform or device
SELECT 
  * 
FROM 
  `ua-backfill-424912.TapWarehouse_UA_Data.Platform-Device-1` AS t1
JOIN
  `ua-backfill-424912.TapWarehouse_UA_Data.Platform-Device-2` AS t2
ON
  t1.Date = t2.Date