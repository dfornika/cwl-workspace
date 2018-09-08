class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: quast
baseCommand:
  - quast
inputs:
  - id: contig
    type: File
    inputBinding:
      position: 0
  - id: reference
    type: File
  - id: output
    type: string
outputs:
  - id: quast_output
    type: Directory
    outputBinding:
      glob: $(inputs.output)
label: quast
arguments:
  - position: 1
    prefix: '-R'
    valueFrom: $(inputs.reference.path)
  - position: 2
    prefix: '-o'
    valueFrom: $(inputs.output)
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/quast:5.0.0--py27pl526ha92aebf_1'
  - class: InlineJavascriptRequirement
