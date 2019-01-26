class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: mlst
baseCommand:
  - mlst
inputs:
  - id: input
    type: File?
    inputBinding:
      position: 0
  - id: output_file
    type: File?
outputs:
  - id: output
    type: File?
    outputBinding:
      glob: output_file.ext
label: mlst
requirements:
  - class: DockerRequirement
    dockerPull: 'quay.io/biocontainers/mlst:2.16.1--0'
  - class: InlineJavascriptRequirement
stdout: $(inputs.output_file.basename)
