class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: abricate
baseCommand:
  - abricate
inputs:
  - id: input
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: output
label: abricate
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/abricate:0.8.10--h1341992_0'
stdout: output
