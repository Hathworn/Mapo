#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kArgMaxRowwise(float* mat, float* target, unsigned int width, unsigned int height) {
    __shared__ float max_vals[32];
    __shared__ unsigned int max_args[32];
    
    // Initialize cur_max with a low value for each thread
    float cur_max = -2e38;
    unsigned int cur_arg = 0;
    
    // Optimize loop by using stride to cover the entire width in a coalesced manner
    for (unsigned int i = threadIdx.x; i < width; i += blockDim.x) {
        float val = mat[blockIdx.x * width + i];
        if (val > cur_max) {
            cur_max = val;
            cur_arg = i;
        }
    }
    
    // Store results in shared memory
    max_vals[threadIdx.x] = cur_max;
    max_args[threadIdx.x] = cur_arg;
    __syncthreads();
    
    // Perform reduction using sequential addressing
    if (threadIdx.x == 0) {
        cur_max = max_vals[0];
        cur_arg = max_args[0];
        for (unsigned int i = 1; i < blockDim.x; i++) {
            if (max_vals[i] > cur_max) {
                cur_max = max_vals[i];
                cur_arg = max_args[i];
            }
        }
        target[blockIdx.x] = cur_arg;
    }
}