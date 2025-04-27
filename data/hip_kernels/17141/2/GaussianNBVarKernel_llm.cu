#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void GaussianNBVarKernel(const float *d_data, const int *d_labels, const float *feature_means_, 
                                    float *feature_vars_, const int *class_count_, 
                                    const unsigned int n_samples_, const unsigned int n_classes_, 
                                    const unsigned int n_features_) {
    unsigned int tidx = threadIdx.x;
    unsigned int feat_col = tidx + (blockIdx.x * blockDim.x);

    if (feat_col < n_features_) {
        // Calculate variances using shared memory for faster access
        __shared__ float temp_vars[MAX_N_CLASSES];
        for (unsigned int i = 0; i < n_classes_; ++i) {
            temp_vars[i] = 0.0f; // Initialize shared memory
        }
        __syncthreads();

        for (unsigned int i = 0; i < n_samples_; ++i) {
            unsigned int row = d_labels[i];
            float diff = d_data[RM_Index(i, feat_col, n_features_)] - feature_means_[RM_Index(row, feat_col, n_features_)];
            atomicAdd(&temp_vars[row], diff * diff); // Use atomicAdd to avoid race condition
        }
        __syncthreads();

        for (unsigned int i = 0; i < n_classes_; ++i) {
            feature_vars_[RM_Index(i, feat_col, n_features_)] = temp_vars[i] / class_count_[i]; // Normalize using class count
        }
    }
}
```

Make sure to adjust `MAX_N_CLASSES` to correspond to the maximum expected number of classes that the shared memory can handle.