class: CommandLineTool
cwlVersion: v1.0
id: mlst
baseCommand:
  - mlst
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output
    type: File
    outputBinding:
      glob: output
label: mlst
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/mlst:2.16.1--0'
    dockerImageId: 'quay.io/biocontainers/mlst:2.16.1--0'
  - class: InlineJavascriptRequirement

stdout: output
