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
outputs:
  - id: contigs
    type: File?
    outputBinding:
      glob: shovill_output/contigs.fa
  - id: contig-graph
    type: File?
    outputBinding:
      glob: shovill_output/contigs.gfa
  - id: log
    type: File?
    outputBinding:
      glob: shovill_output/shovill.log
label: shovill
arguments:
  - position: 0
    prefix: '--R1'
    valueFrom: $(inputs.reads1.path)
  - position: 0
    prefix: '--R2'
    valueFrom: $(inputs.reads2.path)
  - position: 0
    prefix: '--ram'
    valueFrom: '8'
  - position: 0
    prefix: '--outdir'
    valueFrom: shovill_output
requirements:
  - class: ResourceRequirement
    ramMin: 8
    coresMin: 8
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/shovill:1.0.1--0'
  - class: InlineJavascriptRequirement
