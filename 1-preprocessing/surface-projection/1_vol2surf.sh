# Author: Alia Mahama-Rodriguez
# Late Update: 19 Jun 2027

# This step converts fMRIPrep volumetric outputs in MNI152 volumetric space into left- and right-hemisphere surface files in fsaverage space. 
# The workflow first resamples the MNI152 image onto FreeSurfer fsaverage anatomical volume space using `mri_vol2vol`. It then projects the fsaverage 
# cortical surface using `mri_surf2surf`.

# Input
# - MNI152-space NIfTI image (.nii.gz)


# Output:
# - Left and right hemisphere surface files in fsaverage space (lh.fsaverage.mgh + rh.fsaverage.mgh). 
