class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sort
baseCommand:
  - sort
inputs:
  - id: input
    type: File?
    inputBinding:
      position: 1
  - id: keydef
    type: string?
    inputBinding:
      position: 0
      prefix: '--key'
  - id: general-numeric-sort
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-g'
outputs:
  - id: output
    type: File?
label: sort
requirements:
  - class: DockerRequirement
    dockerPull: 'alpine:3.9.2'
stdout: output
