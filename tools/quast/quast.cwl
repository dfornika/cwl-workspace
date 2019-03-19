class: CommandLineTool
cwlVersion: v1.0
id: quast
baseCommand:
  - quast
inputs:
  - id: contigs
    type: File
    inputBinding:
      position: 1
  - id: reference
    type: File
    inputBinding:
      position: 0
      prefix: '-r'
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: quast
arguments:
  - position: 1
    prefix: '-o'
    valueFrom: output
requirements:
  - class: DockerRequirement
    dockerPull: 'biocontainers/quast:5.0.2--py35pl526ha92aebf_0'
    dockerImageId: 'biocontainers/quast:5.0.2--py35pl526ha92aebf_0'
  - class: InlineJavascriptRequirement
