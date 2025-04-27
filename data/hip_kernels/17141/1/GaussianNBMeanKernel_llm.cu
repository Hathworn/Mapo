#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void GaussianNBMeanKernel(float *feature_means_, int *class_count_, float *class_priors_, unsigned int n_samples_, unsigned int n_classes_, unsigned int n_features_) {
    unsigned int tidx = threadIdx.x;
    unsigned int feat_col = tidx + (blockIdx.x * blockDim.x);

    if (feat_col < n_features_) {
        // Cache class counts in shared memory to reduce global memory accesses
        __shared__ int shared_class_count[MAX_CLASSES]; // Assuming MAX_CLASSES is defined suitably
        if (tidx < n_classes_) {
            shared_class_count[tidx] = class_count_[tidx];
        }
        __syncthreads();

        // Calculate Means
        for (unsigned int i = 0; i < n_classes_; ++i) {
            feature_means_[RM_Index(i, feat_col, n_features_)] /= shared_class_count[i];
        }

        // Calculate Class Priors
        if (feat_col == 0) {
            for (unsigned int i = 0; i < n_classes_; ++i) {
                class_priors_[i] = (float)shared_class_count[i] / n_samples_;
            }
        }
    }
}