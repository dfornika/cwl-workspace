class: CommandLineTool
cwlVersion: v1.0
id: mash_dist
baseCommand:
  - mash
  - dist
inputs:
  - id: reference
    type: File
    inputBinding:
      position: 0
  - id: query
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: File
    outputBinding:
      glob: output
label: mash_dist
arguments:
  - position: 0
    prefix: '-v'
    valueFrom: '1.0'
  - position: 0
    prefix: '-d'
    valueFrom: '1.0'
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/mash:2.1--hf69f6b5_1'
    dockerImageId: 'quay.io/biocontainers/mash:2.1--hf69f6b5_1'
  - class: InlineJavascriptRequirement
stdout: output
