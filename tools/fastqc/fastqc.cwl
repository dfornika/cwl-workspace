class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: fastqc
baseCommand:
  - fastqc
inputs:
  - id: input
    type:
      - File
      - type: array
        items: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: Directory?
    outputBinding:
      glob: output
label: fastqc
arguments:
  - position: 0
    prefix: '-o'
    valueFrom: output
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/fastqc:0.11.8--1'
  - class: InitialWorkDirRequirement
    listing:
      - entryname: output
        entry: '$({class: ''Directory''})'
        writable: true
  - class: InlineJavascriptRequirement
