class: CommandLineTool
cwlVersion: v1.0
id: guppy_barcoder
baseCommand:
  - guppy_barcoder
inputs:
  - id: input_path
    type: Directory
    inputBinding:
      position: 0
      prefix: '-i'
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: guppy_barcoder
arguments:
  - position: 0
    prefix: '-t'
    valueFrom: $(runtime.cores)
  - position: 1
    prefix: '-s'
    valueFrom: output
requirements:
  - class: DockerRequirement
    dockerPull: 'genomicpariscentre/guppy:2.3.5'
    dockerImageId: 'genomicpariscentre/guppy:2.3.5'
