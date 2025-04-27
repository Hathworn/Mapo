#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Avoid repeated calculations by computing common comparison form once
    bool within_range;
    
    for (int i = tid; i < size; i += stride) {
        within_range = in_x[i] >= min_val && in_x[i] <= max_val;
        if (inplace) {
            // Optimize conditional check for in_d assignment
            if (!within_range) in_d[i] = 0;
        } else {
            // Use precomputed conditional result
            if (within_range) in_d[i] += out_d[i];
        }
    }
}