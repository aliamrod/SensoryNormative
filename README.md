# SensoryNormative
This repository contains code for preprocessing structural MRI data, projecting cortical surface measures with `mri_surf2surf`, building normative models, and analyzing sensory-region deviations.

## Pipeline
1. Setup environment
2. Organize data
3. Run ***



4. -

0 
SensoryNormativeProject/
│
├── 0-setup/
│   ├── README.md
│   ├── install_environment.sh
│   ├── environment.yml
│   └── check_freesurfer.sh
│
├── 1-data-organization/
│   ├── README.md
│   ├── data_dictionary.csv
│   ├── participants.tsv
│   └── organize_bids.py
│
├── 2-preprocessing/
│   ├── README.md
│   ├── run_recon_all.sh
│   ├── check_recon_outputs.sh
│   └── logs/
│
├── 3-surface-extraction/
│   ├── README.md
│   ├── extract_thickness.sh
│   ├── extract_area.sh
│   └── extract_curvature.sh
│
├── 4-surf2surf/
│   ├── README.md
│   ├── run_surf2surf_subject_to_fsaverage.sh
│   ├── run_surf2surf_fsaverage_to_template.sh
│   ├── change_surf2surf_target.sh
│   └── surf2surf_config.sh
│
├── 5-quality-control/
│   ├── README.md
│   ├── qc_freeview_commands.sh
│   ├── qc_subject_list.csv
│   └── qc_notes_template.md
│
├── 6-normative-modeling/
│   ├── README.md
│   ├── train_normative_model.py
│   ├── predict_deviation_scores.py
│   └── model_config.yaml
│
├── 7-sensory-analysis/
│   ├── README.md
│   ├── sensory_region_masks/
│   ├── extract_sensory_rois.py
│   └── analyze_sensory_deviations.R
│
├── 8-statistics/
│   ├── README.md
│   ├── group_comparisons.R
│   ├── covariate_models.R
│   └── multiple_comparison_correction.R
│
├── 9-figures-and-tables/
│   ├── README.md
│   ├── make_brain_maps.py
│   ├── make_tables.R
│   └── figures/
│
├── data/
│   ├── raw/
│   ├── derivatives/
│   └── processed/
│
├── scripts/
│   └── helper_functions/
│
├── README.md
├── LICENSE
└── .gitignore
