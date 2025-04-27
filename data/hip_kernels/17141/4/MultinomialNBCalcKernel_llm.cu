#include "hip/hip_runtime.h"
#include "includes.h"
__device__ inline unsigned int RM_Index(unsigned int row, unsigned int col, unsigned int width) {
    return (row * width + col);
}

__global__ void MultinomialNBCalcKernel(const float *d_data, const int *d_labels, float *feature_probs, float *class_priors, unsigned int n_samples_, unsigned int n_classes_, unsigned int n_features_) {

    // Calculate unique thread index
    unsigned int tidx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure the current thread deals only with available features
    if (tidx < n_features_) {
        for (unsigned int i = 0; i < n_samples_; ++i) {
            unsigned int row = d_labels[i];
            
            // Each thread independently updates its feature probability index
            atomicAdd(&feature_probs[RM_Index(row, tidx, n_features_)], d_data[RM_Index(i, tidx, n_features_)]);

            // Thread 0 moderates class prior updating
            if (tidx == 0) {
                atomicAdd(&class_priors[row], 1);
            }
        }
    }
}