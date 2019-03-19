class: CommandLineTool
cwlVersion: v1.0
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
    dockerPull: 'biocontainers/abricate:0.8.10--h1341992_0'
    dockerImageId:  'biocontainers/abricate:0.8.10--h1341992_0'
stdout: output
