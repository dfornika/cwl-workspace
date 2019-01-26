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
  - id: output
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
outputs:
  - id: output_dir
    type: Directory?
    outputBinding:
      glob: output
label: fastqc
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/fastqc:0.11.8--1'
  - class: InitialWorkDirRequirement
    listing:
      - $(inputs.output)
  - class: InlineJavascriptRequirement
