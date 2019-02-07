class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: guppy_basecaller
baseCommand:
  - guppy_basecaller
inputs:
  - id: input_path
    type: Directory
    inputBinding:
      position: 2
      prefix: '-i'
  - id: config
    type: string
outputs:
  - id: output
    type: Directory
    outputBinding:
      glob: output
label: guppy_basecaller
arguments:
  - position: 3
    prefix: '-s'
    valueFrom: output
  - position: 1
    prefix: '-c'
    valueFrom: $(inputs.config)
  - position: 0
    prefix: ''
    valueFrom: '--disable-pings'
requirements:
  - class: DockerRequirement
    dockerPull: 'genomicpariscentre/guppy:2.3.1'
  - class: InlineJavascriptRequirement
