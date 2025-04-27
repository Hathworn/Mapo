#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void BernoulliNBCalcKernel(const float *d_data, const int *d_labels, float *feature_probs, float *class_count_, unsigned int n_samples_, unsigned int n_classes_, unsigned int n_features_) {

    unsigned int feat_col = blockIdx.x * blockDim.x + threadIdx.x;

    if (feat_col < n_features_) { // Check if thread should execute
        unsigned int row;

        for (unsigned int i = 0; i < n_samples_; ++i) {
            row = d_labels[i];

            // Accumulate feature probabilities
            atomicAdd(&feature_probs[RM_Index(row, feat_col, n_features_)],
                      d_data[RM_Index(i, feat_col, n_features_)]);

            if (feat_col == 0) {
                // Safeguard class count with atomic
                atomicAdd(&class_count_[row], 1);
            }
        }
    }
}