class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: head
baseCommand:
  - head
inputs:
  - id: count
    type: int?
    inputBinding:
      position: 0
      prefix: '-n'
  - id: input
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: output
label: head
requirements:
  - class: DockerRequirement
    dockerPull: 'alpine:3.9.2'
stdout: output
