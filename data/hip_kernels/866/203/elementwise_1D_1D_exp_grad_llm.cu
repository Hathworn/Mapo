#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_out_x[];
    
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Load data into shared memory
    if (threadIdx.x < size) {
        shared_out_x[threadIdx.x] = out_x[threadIdx.x + blockIdx.x * blockDim.x];
    }
    
    __syncthreads(); // Synchronize to ensure shared memory is fully loaded

    for (; tid < size; tid += stride) {
        // Only proceed if within boundaries
        if (tid < size) {
            // Use shared memory for reading out_x
            in_d[tid] += out_d[tid] * shared_out_x[tid % blockDim.x];
        }
    }
}