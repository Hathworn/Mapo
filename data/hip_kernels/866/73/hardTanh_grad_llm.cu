#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Use shared memory to optimize memory access pattern
    __shared__ float shared_in[1024];
    __shared__ float shared_out[1024];
    
    for (int i = tid; i < size; i += stride) {
        // Load data into shared memory
        shared_in[threadIdx.x] = in_x[i];
        shared_out[threadIdx.x] = out_d[i];
        __syncthreads();

        if (inplace) {
            // Direct update for in-place
            if (shared_in[threadIdx.x] < min_val || shared_in[threadIdx.x] > max_val)
                in_d[i] = 0;
        } else {
            // Accumulate only within the specified range
            if (shared_in[threadIdx.x] >= min_val && shared_in[threadIdx.x] <= max_val)
                in_d[i] += shared_out[threadIdx.x];
        }
        __syncthreads();
    }
}