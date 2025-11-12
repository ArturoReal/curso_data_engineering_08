{% set models_to_generate = codegen.get_models(directory='models/staging/sql_server_dbo', prefix='stg_') %}

-- Agregamos un log para depurar si la lista está vacía
{{ log("Modelos encontrados: " ~ models_to_generate, info=True) }}


{{ codegen.generate_model_yaml(
    model_names = models_to_generate,
    include_data_types = true
) }}
