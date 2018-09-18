class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com'
id: mash_sketch
baseCommand:
  - mash
  - sketch
inputs:
  - id: input
    type: 'File[]'
outputs: []
label: mash_sketch
arguments:
  - position: 1
    prefix: ''
    valueFrom: $(inputs.input.map(input => input.path).join(" "))
  - position: 0
    prefix: '-k'
    valueFrom: '32'
  - position: 0
    prefix: '-s'
    valueFrom: '1000'
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/mash:2.0--h9dd4a16_3'
