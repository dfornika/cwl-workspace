class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  s: https://schema.org/
$schemas:
 - https://schema.org/docs/schema_org_rdfa.html
id: mash_screen
baseCommand:
  - mash
  - screen
inputs:
  - id: queries
    type: File
  - id: pool
    type: File
outputs: []
label: mash_screen
arguments:
  - position: 0
    prefix: ''
    valueFrom: $(inputs.queries.path)
  - position: 0
    prefix: ''
    valueFrom: $(inputs.pool.map(pool => pool.path).join(" "))
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/mash:2.1--hf69f6b5_1'
    dockerImageId: 'quay.io/biocontainers/mash:2.1--hf69f6b5_1'
  - class: InlineJavascriptRequirement
