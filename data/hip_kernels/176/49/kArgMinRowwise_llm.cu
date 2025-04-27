#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kArgMinRowwise(float* mat, float* target, unsigned int width, unsigned int height) {
    __shared__ float min_vals[32];
    __shared__ unsigned int min_args[32];
    
    // Initialize shared memory with maximum values
    min_vals[threadIdx.x] = 2e38;
    min_args[threadIdx.x] = 0;

    float cur_min = 2e38;
    unsigned int cur_arg = 0;
    float val = 0;

    // Process elements in the row assigned to the block
    for (unsigned int i = threadIdx.x; i < width; i += blockDim.x) {
        val = mat[blockIdx.x * width + i];

        if (val < cur_min) {
            cur_min = val;
            cur_arg = i;
        }
    }

    // Atomically update shared memory to ensure thread safety
    atomicMin(reinterpret_cast<unsigned int*>(&min_vals[threadIdx.x]), __float_as_uint(cur_min));
    atomicMin(&min_args[threadIdx.x], cur_arg);

    __syncthreads();

    // Use one thread to determine the global minimum argument
    if (threadIdx.x == 0) {
        cur_min = 2e38;
        cur_arg = 0;

        for (unsigned int i = 0; i < blockDim.x; i++) {
            if (min_vals[i] < cur_min) {
                cur_min = min_vals[i];
                cur_arg = min_args[i];
            }
        }

        target[blockIdx.x] = cur_arg;
    }
}