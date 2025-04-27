#include "hip/hip_runtime.h"
#include "includes.h"
__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}
__global__ void MultinomialNBLearnKernel(float *feature_probs, float *class_priors, const float *d_row_sums, unsigned int n_samples_, unsigned int n_classes_, unsigned int n_features_) {
    // Calculate unique global thread index
    unsigned int feat_col = blockIdx.x * blockDim.x + threadIdx.x;

    if (feat_col < n_features_) {
        for (unsigned int i = 0; i < n_classes_; ++i) {
            // Precompute common index calculation
            unsigned int idx = RM_Index(i, feat_col, n_features_);
            feature_probs[idx] = log((feature_probs[idx] + 1.0) / (d_row_sums[i] - n_features_));

            if (feat_col == 0) {
                // Compute and store class prior only once per class
                class_priors[i] = log(class_priors[i] / (float)n_samples_);
            }
        }
    }
}