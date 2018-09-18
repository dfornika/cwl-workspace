class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: mash_screen
baseCommand:
  - mash
  - screen
inputs:
  - id: queries
    type: File
  - id: pool
    type: 'File[]'
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
    dockerPull: 'quay.io/biocontainers/mash:2.0--h9dd4a16_3'
  - class: InlineJavascriptRequirement
