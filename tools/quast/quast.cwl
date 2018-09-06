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
    type: string?
outputs:
  - id: quast_output
    type: File?
label: quast
arguments:
  - position: 1
    prefix: '-R'
    valueFrom: $(inputs.reference.path)
  - position: 2
    prefix: '-o'
    valueFrom: $(inputs.output.path)
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/quast:4.6.3--py27pl526h3727419_2'
  - class: InlineJavascriptRequirement
