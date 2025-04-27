#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void ComplementNBCalcKernel(const float *d_data, const int *d_labels, float *per_class_feature_sum_, float *per_feature_sum_, unsigned int n_samples_, unsigned int n_features_) {

    // Calculate global thread ID 
    unsigned int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (tidx < n_features_) {  // Check if within feature bounds
        float class_sum = 0.0f;  // Local cache for class sum
        float feature_sum = 0.0f;  // Local cache for feature sum

        // For each document/sample
        for (unsigned int i = 0; i < n_samples_; ++i) {
            unsigned int row = d_labels[i];
            float value = d_data[RM_Index(i, tidx, n_features_)];

            // Accumulate in local variables
            class_sum += value;
            feature_sum += value;
        }

        // Write back results
        per_class_feature_sum_[RM_Index(row, tidx, n_features_)] = class_sum;
        per_feature_sum_[tidx] = feature_sum;
    }
}
```
