#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateGradInput_kernel(float *gradInput, float *target, int nframe, int ndim, float grad, int ntarget, float* weights, bool apply_weights) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop to handle more elements per thread
    for (int i = idx; i < nframe; i += blockDim.x * gridDim.x) {
        for (int j = 0; j < ntarget; ++j) {
            int t = (int)target[i * ntarget + j] - 1;
            if (t >= 0) { // Check valid index
                if (apply_weights) {
                    gradInput[i * ndim + t] = grad * weights[t]; // Weighted gradient
                } else {
                    gradInput[i * ndim + t] = grad; // Regular gradient
                }
            }
        }
    }
}