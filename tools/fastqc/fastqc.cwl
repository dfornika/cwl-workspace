class: CommandLineTool
cwlVersion: v1.0
id: fastqc
baseCommand:
  - fastqc
inputs:
  - id: input
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: fastqc
arguments:
  - position: 0
    prefix: '-o'
    valueFrom: output
requirements:
  - class: DockerRequirement
    dockerImageId: 'quay.io/biocontainers/fastqc:0.11.8--1'
    dockerPull: 'quay.io/biocontainers/fastqc:0.11.8--1'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: output
        entry: '$({class: ''Directory''})'
        writable: true
  - class: InlineJavascriptRequirement
