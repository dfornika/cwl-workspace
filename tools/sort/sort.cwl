class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sort
baseCommand:
  - sort
inputs:
  - id: input
    type: File
    inputBinding:
      position: 1
  - id: keydef
    type: string
    inputBinding:
      position: 0
      prefix: '-k'
  - id: general-numeric-sort
    type: boolean?
    inputBinding:
      position: 0
      prefix: '-g'
outputs:
  - id: output
    type: File
label: sort
requirements:
  - class: DockerRequirement
    dockerPull: 'bash:5.0.2'
stdout: output
