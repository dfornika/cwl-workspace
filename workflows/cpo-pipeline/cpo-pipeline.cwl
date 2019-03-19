class: Workflow
cwlVersion: v1.0
id: cpo_pipeline
label: cpo-pipeline
$namespaces:
  edam: "http://edamontology.org/"
  s: https://schema.org/
$schemas:
  - "http://edamontology.org/EDAM_1.16.owl"
inputs:
  - id: reads2
    type: File
    format: 'edam:format_1932'
  - id: reads1
    type: File
    format: 'edam:format_1932'
  - id: refseq_genomes_k21_s1000_msh
    type: File
outputs:
  - id: mlst_output
    outputSource: "mlst/output"
    type: File
  - id: fastqc_R1_output
    outputSource: "fastqc_reads1/output"
    type: Directory
  - id: fastqc_R2_output
    outputSource: "fastqc_reads2/output"
    type: Directory
  - id: quast_output
    outputSource: "quast/output"
    type: Directory
  - id: mash_dist_output
    outputSource: "head/output"
    type: File
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
  - id: mlst
    in:
      - id: input
        source: shovill/contigs
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/mlst/mlst.cwl
    label: mlst
  - id: quast
    in:
      - id: contigs
        source:
          - shovill/contigs
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/quast/quast.cwl
    label: quast
  - id: mash_dist
    in:
      - id: reference
        source: refseq_genomes_k21_s1000_msh
      - id: query
        source:
          - mash_sketch/output
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/mash/mash_dist/mash_dist.cwl
    label: mash_dist
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
  - id: fastqc_reads1
    in:
      - id: input
        source:
          - reads1
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/fastqc/fastqc.cwl
    label: fastqc
  - id: fastqc_reads2
    in:
      - id: input
        source:
          - reads2
    out:
      - id: output
    run: https://raw.githubusercontent.com/dfornika/cwl-workspace/master/tools/fastqc/fastqc.cwl
    label: fastqc
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
