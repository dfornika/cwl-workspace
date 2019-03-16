class: Workflow
cwlVersion: v1.0
id: cpo_pipeline
label: cpo-pipeline
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reads2
    type: File
    'sbg:x': -291.32366943359375
    'sbg:y': 265.87200927734375
  - id: reads1
    type: File
    'sbg:x': -294.3883056640625
    'sbg:y': 144.9025421142578
  - id: refseq_genomes_k21_s1000_msh
    type: File
    'sbg:x': -66.16741180419922
    'sbg:y': 542.5327758789062
outputs:
  - id: mlst_output
    outputSource:
      - mlst/output
    type: File?
    'sbg:x': 461.10113525390625
    'sbg:y': 48.5
  - id: fastqc_R1_output
    outputSource:
      - fastqc/output
    type: Directory?
    'sbg:x': -146.3594512939453
    'sbg:y': 62.029788970947266
  - id: fastqc_R2_output
    outputSource:
      - fastqc_1/output
    type: Directory?
    'sbg:x': -135.0926971435547
    'sbg:y': 325.9505615234375
  - id: quast_output
    outputSource:
      - quast/output
    type: Directory
    'sbg:x': 445.3739318847656
    'sbg:y': -170.95127868652344
  - id: mash_dist_output
    outputSource:
      - head/output
    type: File?
    'sbg:x': 640.132080078125
    'sbg:y': 315.2724609375
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
    'sbg:x': 63.176692962646484
    'sbg:y': 126.00399017333984
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
    'sbg:x': 252.70069885253906
    'sbg:y': -109.45011901855469
  - id: mash_dist
    in:
      - id: reference
        source:
          - refseq_genomes_k21_s1000_msh
      - id: query
        source:
          - mash_sketch/output
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/mash/mash_dist/mash_dist.cwl
    label: mash_dist
    'sbg:x': 262.42498779296875
    'sbg:y': 360.4744873046875
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
    'sbg:x': 69.51770782470703
    'sbg:y': 270.52532958984375
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
    'sbg:x': 403.0655212402344
    'sbg:y': 310.4468688964844
  - id: fastqc
    in:
      - id: input
        source:
          - reads1
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/fastqc/fastqc.cwl
    label: fastqc
    'sbg:x': -240.32366943359375
    'sbg:y': -32.81787872314453
  - id: fastqc_1
    in:
      - id: input
        source:
          - reads2
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/fastqc/fastqc.cwl
    label: fastqc
    'sbg:x': -250.72080993652344
    'sbg:y': 403.4015197753906
  - id: head
    in:
      - id: count
        default: 1
      - id: input
        source: sort/output
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/head/head.cwl
    label: head
    'sbg:x': 537.7379760742188
    'sbg:y': 408.3930358886719
