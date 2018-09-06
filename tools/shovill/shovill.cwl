class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: shovill
baseCommand:
  - shovill
inputs:
  - id: reads1
    type: File
  - id: reads2
    type: File
  - id: outdir
    type: Directory
outputs:
  - id: output
    type: Directory?
label: shovill
arguments:
  - position: 0
    prefix: '--R1'
    valueFrom: $(inputs.reads1.path)
  - position: 0
    prefix: '--R2'
    valueFrom: $(inputs.reads2.path)
  - position: 0
    prefix: '--outdir'
    valueFrom: $(inputs.outdir.path)
requirements:
  - class: InlineJavascriptRequirement
