class: CommandLineTool
cwlVersion: v1.0
id: mash_sketch
baseCommand:
  - mash
  - sketch
inputs:
  - id: R1
    type: File
    inputBinding:
      position: 0
      prefix: '-r'
  - id: R2
    type: File
    inputBinding:
      position: 0
outputs:
  - id: output
    type: File
    outputBinding:
      glob: output.msh
label: mash_sketch
arguments:
  - position: 0
    prefix: '-k'
    valueFrom: '32'
  - position: 0
    prefix: '-s'
    valueFrom: '1000'
  - position: 0
    prefix: '-m'
    valueFrom: '2'
  - position: 0
    prefix: '-o'
    valueFrom: output
requirements:
  - class: DockerRequirement
    dockerPull: 'biocontainers/mash:2.1--hf69f6b5_1'
    dockerImageId: 'biocontainers/mash:2.1--hf69f6b5_1'
