# Segment Metrics dbt Package ([Docs](https://housewarehq.github.io/dbt_segment_metrics)) 

This package is built on top of [dbt-labs-segment package](https://github.com/dbt-labs/segment) which 
* Performs "user stitching" to tie all events associated with a cookie to the same user_id
* Transforms pageviews into sessions ("sessionization")

# 🛑 Few things to keep in mind
These packages are under active development and are expected to change with dbt metrics as it evolves over time. As of now, dbt metrics requires users to define models to calculate metrics and these models are persisted on the warehouse. Keeping this in mind, we have currently modelled our packages such that metrics and the models calculating these metrics have a 1:1 mapping, which is why you will see multiple metrics for the same conceptual metric entity accounting for different time grains and dimensions. In future, with the roll out of dbt Server and evolution of dbt metrics, we expect to streamline our packages to remove these redundancies. 

The metrics in these packages are transformed on top of source data ETL'd via Fivetran to your warehouse. Make sure you have connected your SaaS source with Fivetran for the packages to work properly. 

# 📣 What does this dbt package do?
This package provides pre-built metrics for Segment data from [Fivetran's connector](https://www.fivetran.com/connectors/segment). It uses data in the format described by [this schema information](https://fivetran.com/docs/events/segment#schemainformation).

This package enables you to access commonly used metrics on top of Segment Event Data.

## Metrics 

This package contains transformed models built on top of [dbt-labs Segment](https://github.com/dbt-labs/segment). A dependency on the referred package is declared in this package's `packages.yml` file, so it will automatically download when you run `dbt deps`. 

The metrics offered by this package are described below
(All metrics are available at daily and monthly granularity)
| **metric**                          | **description**                                                                                                                                                                                                                              |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Segment Number of Sessions    | Number of app sessions taking place                 
| Segment  Number of Sessions By Device Category     | Number of sessions  segmented by device category                        
| Segment  Number of Sessions By Referrer Source    | Number of sessions  segmented by the website that brings the traffic
| Segment  Unique Users    |  Unique users recorded across your website and mobile applications. This is based on the Segment Identify API
| Segment  Unique Users Segmented By Country    |          Unique users recorded across your website and mobile applications segmented by user's country derived from their location. This is based on the Segment Identify API                                                               |
| Segment  Unique Users Segmented By Country and City    |   unique users recorded across your website and mobile applications segmented by user's country & city derived from their location. This is based on the Segment Identify API                                     |
| Segment  Page Views    |  number of page views for your website                                                         |
| Segment  Page Views Segmented By Page Path    |  number of page views for your website segmented by page path              | Segment  Page Views Segmented By Page Referrer  | number of page views for your website segmented by referred page |
| Segment  Event Count Segmented By Event Type    |  count of events segmented by event type based on Segment's Track API| 
| Segment  Average Session Duration in Seconds |  average session duration in seconds. Sessionization is done on top of data from Segment's Page API | 
| Segment  Average Session Duration in Seconds Segmented By Device Category |   average session duration in seconds segmented by device category. Sessionization is done on top of data from Segment's Page API | 
| Segment  Average Session Duration in Seconds Segmented By Referrer Source |  average session duration in seconds segmented by source of the traffic. Sessionization is done on top of data from Segment's Page API | 
| Segment  Unique Visitors |  number of unique visitors visiting your website. Visitors include anonymous users too | 
| Segment  Unique Visitors Segmented By Country |  number of unique visitors visiting your website segmented by user's country derived from their location. Visitors include anonymous users too | 
| Segment  Unique Visitors By Segmented Country and City |  number of unique visitors visiting your website segmented by user's country & city derived from their location. Visitors include anonymous users too | 

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have the following:
- At least one Fivetran segment connector syncing data into your destination. 
- A **BigQuery**, **Snowflake**, **Redshift**, or **PostgreSQL** destination.

## Step 2: Install the package

Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

Include in your `packages.yml`

```yaml
packages:
  - git: "https://github.com/HousewareHQ/dbt_segment_metrics.git"
    revision: v1.0.0
```

## Step 3: Define database and schema variables

By default, this package will look for your Segment data in the `fivetran_segment` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Segment data is, please add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
config-version: 2

vars:
  segment__source: your_database_name
  segment_schema: your_schema_name
```

## Step 4: Separate metrics into different schema

By default, this package will compute all the metrics in your `target` schema inside `target` database. It's a good practice to add a suffix to your schema defining what source the metrics are coming from 
Go to your `dbt_project.yml` file
```yml
# dbt_project.yml

...
config-version: 2

models:
  segment_metrics:
    +schema: segment_metrics
```
# 🗄 Which warehouses are supported?
This package has been tested on BigQuery, Snowflake.


# 🙌 Can I contribute?

Additional contributions to this package are very welcome! Please create issues
or open PRs against `main`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.


# 🏪 Are there any resources available?
- Provide [feedback](https://airtable.com/shrPHxTmfkjq3P6Eh) on what you'd like to see next
- Have questions, feedback, or need help? Email us at nipun@houseware.io
- Check out [Houseware's blog](https://www.houseware.io/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
