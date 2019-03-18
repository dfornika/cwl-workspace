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
    inputBinding:
      position: 0
      prefix: '--R1'
  - id: reads2
    type: File
    inputBinding:
      position: 0
      prefix: '--R2'
outputs:
  - id: contigs
    type: File?
    outputBinding:
      glob: outdir/contigs.fa
  - id: contig-graph
    type: File?
    outputBinding:
      glob: outdir/contigs.gfa
  - id: log
    type: File?
    outputBinding:
      glob: outdir/shovill.log
label: shovill
arguments:
  - position: 0
    prefix: '--ram'
    valueFrom: $(runtime.ram)
  - position: 0
    prefix: '--outdir'
    valueFrom: outdir
requirements:
  - class: ResourceRequirement
    ramMin: 4096
    coresMin: 8
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/shovill:1.0.1--0'
  - class: InlineJavascriptRequirement
