class: Workflow
cwlVersion: v1.0
id: guppy_basecalling_barcoding
label: guppy_basecalling_barcoding
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: input_path
    type: Directory
    'sbg:x': -718.3968505859375
    'sbg:y': -106
  - id: config
    type: string
    'sbg:exposed': true
outputs:
  - id: output
    outputSource:
      - guppy_barcoder/output
    type: Directory
    'sbg:x': 80.60113525390625
    'sbg:y': -148
steps:
  - id: guppy_barcoder
    in:
      - id: input_path
        source: guppy_basecaller/output
    out:
      - id: output
    run: ../../tools/guppy/guppy_barcoder.cwl
    label: guppy_barcoder
    'sbg:x': -92
    'sbg:y': -124
  - id: guppy_basecaller
    in:
      - id: input_path
        source: input_path
      - id: config
        default: dna_r9.4.1_450bps.cfg
        source: config
    out:
      - id: output
    run: ../../tools/guppy/guppy_basecaller.cwl
    label: guppy_basecaller
    'sbg:x': -427
    'sbg:y': -85
requirements: []
