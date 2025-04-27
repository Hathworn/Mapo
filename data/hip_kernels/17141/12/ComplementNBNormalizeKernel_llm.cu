#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void ComplementNBNormalizeKernel(float *feature_weights_, float *per_class_sum_, unsigned int n_classes_, unsigned int n_features_) {
    // Calculate the global feature index
    int feat_col = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a shared memory to cache per_class_sum_ for faster access if n_classes_ size is relatively small
    extern __shared__ float shared_class_sum[];

    if (threadIdx.x < n_classes_) {
        shared_class_sum[threadIdx.x] = per_class_sum_[threadIdx.x];
    }
    __syncthreads(); // Ensure all shared memory is loaded

    if (feat_col < n_features_) { // Boundary condition check
        for (unsigned int i = 0; i < n_classes_; ++i) { // For each class
            // Perform division
            feature_weights_[RM_Index(i, feat_col, n_features_)] /= shared_class_sum[i];
        }
    }
}