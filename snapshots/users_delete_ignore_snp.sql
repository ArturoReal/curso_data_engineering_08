{% snapshot users_snapshot_hard_deletes_ignore %}

{{
    config(
      target_schema='snapshots',
      unique_key='dni',
      strategy='timestamp',
      updated_at='_fivetran_synced',
      hard_deletes='ignore'
    )
}}

select * from {{ source('google_sheets', 'users') }}

{% endsnapshot %}