class: Workflow
cwlVersion: v1.0
id: cpo_pipeline
label: cpo-pipeline
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reads2
    type: File
    'sbg:x': -193.1928253173828
    'sbg:y': 45.67854690551758
  - id: reads1
    type: File
    'sbg:x': -208.15011596679688
    'sbg:y': 355.6777038574219
  - id: refseq_genomes_k21_s1000_msh
    type: File
    'sbg:x': 188.55628967285156
    'sbg:y': 174.55628967285156
outputs:
  - id: quast_output
    outputSource:
      - quast/output
    type: Directory
    'sbg:x': 473
    'sbg:y': -126
  - id: mlst.tsv
    outputSource:
      - mlst/output
    type: File?
    'sbg:x': 461.10113525390625
    'sbg:y': 48.5
  - id: fastqc_R1
    outputSource:
      - fastqc/output
    type: Directory?
    'sbg:x': 11.835732460021973
    'sbg:y': 551.452392578125
  - id: fastqc_R2
    outputSource:
      - fastqc_1/output
    type: Directory?
    'sbg:x': 78.30533599853516
    'sbg:y': -387.1069030761719
steps:
  - id: shovill
    in:
      - id: reads1
        source: reads1
      - id: reads2
        source: reads2
    out:
      - id: contigs
      - id: contig-graph
      - id: log
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/shovill/shovill.cwl
    label: shovill
    'sbg:x': 53
    'sbg:y': 49
  - id: mlst
    in:
      - id: input
        source: shovill/contigs
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/mlst/mlst.cwl
    label: mlst
    'sbg:x': 311
    'sbg:y': 44
  - id: quast
    in:
      - id: contigs
        source:
          - shovill/contigs
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/quast/quast.cwl
    label: quast
    'sbg:x': 304
    'sbg:y': -118
  - id: mash_dist
    in:
      - id: reference
        source: refseq.genomes.k21.s1000.msh
      - id: query
        source:
          - mash_sketch/output
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/mash/mash_dist/mash_dist.cwl
    label: mash_dist
    'sbg:x': 277.0910949707031
    'sbg:y': 275.7024230957031
  - id: mash_sketch
    in:
      - id: R1
        source: reads1
      - id: R2
        source: reads2
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/mash/mash_sketch/mash_sketch.cwl
    label: mash_sketch
    'sbg:x': 50.84105682373047
    'sbg:y': 307.8697814941406
  - id: sort
    in:
      - id: input
        source: mash_dist/output
      - id: keydef
        default: '2,2'
      - id: general-numeric-sort
        default: true
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/sort/sort.cwl
    label: sort
    'sbg:x': 408.10113525390625
    'sbg:y': 239.5
  - id: fastqc
    in:
      - id: input
        source:
          - reads1
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/fastqc/fastqc.cwl
    label: fastqc
    'sbg:x': -142.27850341796875
    'sbg:y': 493.89923095703125
  - id: fastqc_1
    in:
      - id: input
        source:
          - reads2
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/fastqc/fastqc.cwl
    label: fastqc
    'sbg:x': -56.87505340576172
    'sbg:y': -258.4345703125
requirements: []
