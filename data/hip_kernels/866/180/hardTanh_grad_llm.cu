#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    // Calculate global index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure threads work on contiguous block of data
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        float x = in_x[i];
        if (inplace) {
            // Set derivative to zero for out-of-bound values
            in_d[i] = (x < min_val || x > max_val) ? 0 : in_d[i];
        } else {
            // Accumulate if value within bounds
            if (x >= min_val && x <= max_val) {
                in_d[i] += out_d[i];
            }
        }
    }
}