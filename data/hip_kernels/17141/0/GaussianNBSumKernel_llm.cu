#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void GaussianNBSumKernel(const float *d_data, const int *d_labels, float *feature_means_, int *class_count_, unsigned int n_samples_, unsigned int n_classes_, unsigned int n_features_) {
    // Optimize by using shared memory to reduce global memory accesses
    extern __shared__ int shared_class_count[];

    unsigned int tidx = threadIdx.x;
    unsigned int feat_col = tidx + (blockIdx.x * blockDim.x);
    unsigned int i = 0, row = 0;

    // Initialize shared memory for class counts
    if (tidx < n_classes_ && feat_col < n_features_) {
        shared_class_count[tidx] = 0;
    }
    __syncthreads();

    if (feat_col < n_features_) { // End condition check
        float mean_sum = 0.0f; // Local accumulator for feature means

        for (i = 0; i < n_samples_; ++i) { // For each training sample
            row = d_labels[i];

            // Accumulate feature mean locally
            mean_sum += d_data[RM_Index(i, feat_col, n_features_)];

            // Accumulate class count in shared memory
            if (feat_col == 0) {
                atomicAdd(&shared_class_count[row], 1);
            }
        }

        // Store back calculated mean sum to global memory
        feature_means_[RM_Index(row, feat_col, n_features_)] = mean_sum;

        __syncthreads();

        // Store class counts from shared to global memory by a single thread per block
        if (tidx == 0) {
            for (int c = 0; c < n_classes_; ++c) {
                atomicAdd(&class_count_[c], shared_class_count[c]);
            }
        }
    }
    return;
}