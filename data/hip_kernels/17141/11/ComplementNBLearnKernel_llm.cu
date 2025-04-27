#include "hip/hip_runtime.h"
#include "includes.h"
__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void ComplementNBLearnKernel(float *feature_weights_, float *per_class_feature_sum_, float *per_feature_sum_, float *per_class_sum_, float all_sum_, unsigned int n_classes_, unsigned int n_features_) {
    // Use shared memory to reduce global memory access
    extern __shared__ float shared_mem[];
    
    unsigned int tidx = threadIdx.x;
    int feat_col = tidx + (blockIdx.x * blockDim.x);

    if (feat_col < n_features_) { // Boundary check
        float *s_per_feature_sum = shared_mem;
        
        // Load per_feature_sum_ into shared memory
        if (tidx < n_features_) {
            s_per_feature_sum[tidx] = per_feature_sum_[tidx];
        }
        __syncthreads(); // Synchronize to ensure shared memory is populated

        float den_sum = 0;
        float num_sum = 0;

        for (unsigned int i = 0; i < n_classes_; ++i) { // For each class
            den_sum = all_sum_ - per_class_sum_[i];
            num_sum = s_per_feature_sum[feat_col] - per_class_feature_sum_[RM_Index(i, feat_col, n_features_)];

            feature_weights_[RM_Index(i, feat_col, n_features_)] =
                log(num_sum + 1.0) - log(den_sum + n_features_);
        }
    }
}