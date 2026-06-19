# Author: Alia Mahama-Rodriguez
# Late Update: 19 Jun 2027

# This step converts fMRIPrep volumetric outputs in MNI152 volumetric space into left- and right-hemisphere surface files in fsaverage space. 
# The workflow first resamples the MNI152 image onto FreeSurfer fsaverage anatomical volume space using `mri_vol2vol`. It then projects the fsaverage 
# cortical surface using `mri_surf2surf`.

# Input
# - MNI152-space NIfTI image (.nii.gz)


# Output:
# - Left and right hemisphere surface files in fsaverage space (lh.fsaverage.mgh + rh.fsaverage.mgh). 


# Test Run (1 patient) 

#!/bin/bash

set -e

module load freesurfer
export FS_FREESURFERENV_NO_OUTPUT=1
source "$FREESURFER_HOME/SetUpFreeSurfer.sh"
export SUBJECTS_DIR="$FREESURFER_HOME/subjects"

CSV="ol/processing_required.csv"
OUTDIR="workdir/fsaverage"

mkdir -p "$OUTDIR"

tail -n +2 "$CSV" | while IFS=',' read -r \
  subject_id session_id run age sex site scanner_id diagnosis \
  path_fmri path_fmriprep preprocessing_failed uid uid2 timepoint \
  healthy longitudinal_yn healthy_yn bucket split path_bold_L path_bold_R
do
  IN="$path_fmri"
  SAFE_UID2=$(echo "$uid2" | tr '/' '_')

  echo "----------------------------------------"
  echo "SUBJECT_ID=$subject_id"
  echo "UID2=$uid2"
  echo "IN=$IN"

  if [[ ! -f "$IN" ]]; then
    echo "MISSING_INPUT=$IN"
    continue
  fi

  for HEMI in lh rh; do
    OUT="$OUTDIR/${SAFE_UID2}_${HEMI}_space-fsaverage_bold.mgz"

    if [[ -s "$OUT" ]]; then
      echo "SKIP_EXISTS=$OUT"
      continue
    fi

    mri_vol2surf \
      --mov "$IN" \
      --reg "$FREESURFER_HOME/average/mni152.register.dat" \
      --hemi "$HEMI" \
      --trgsubject fsaverage \
      --projfrac 0.5 \
      --interp trilinear \
      --o "$OUT"

    echo "QC=$OUT"
    mri_info "$OUT" | grep -E "dimensions|nframes|TR"
  done

  echo "DONE=$uid2"
done
