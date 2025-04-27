#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void BernoulliNBLearnKernel(float *feature_probs, float *class_count_, const float *d_row_sums, unsigned int n_samples_, unsigned int n_classes_, unsigned int n_features_) {

    unsigned int feat_col = threadIdx.x + (blockIdx.x * blockDim.x);

    // End condition check
    if (feat_col < n_features_) { 
        // Unroll loop for efficiency
        for (unsigned int i = 0; i < n_classes_; ++i) {
            feature_probs[RM_Index(i, feat_col, n_features_)] /= class_count_[i];
        
            // Perform this division only once per class
            if (feat_col == 0) {
                class_count_[i] /= (float)n_samples_;
            }
        }
    }
}