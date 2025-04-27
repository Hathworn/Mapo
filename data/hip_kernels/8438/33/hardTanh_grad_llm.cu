#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    for (int i = tid; i < size; i += stride) {
        float x = in_x[i];  // Load memory once

        if (inplace) {
            // Set in_d[i] to zero when out of range
            in_d[i] = (x < min_val || x > max_val) ? 0 : in_d[i];
        } else {
            // Update in_d[i] only when x is within bounds
            if (x >= min_val && x <= max_val) {
                in_d[i] += out_d[i];
            }
        }
    }
}