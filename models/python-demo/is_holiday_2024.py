import holidays
import pandas

# Each dbt model needs to follow this specific syntax
def model(dbt, session):
    
    # Pathon models don't use jinja. They use dbt object instead
    # Mae sure to materialize them as tables
    dbt.config(
        materialized="table",
        packages=['pandas', 'holidays'],
        enabled=False
    )

    india_holidays = holidays.IN()

    # This is how we use ref in python models
    df = dbt.ref('date_spine').to_pandas()

    df['IS_HOLIDAY'] = df['DATE_DAY'].apply(lambda date: date in india_holidays)

    return df

