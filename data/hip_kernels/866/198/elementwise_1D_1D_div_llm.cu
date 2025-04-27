#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    // Use shared memory for faster access
    extern __shared__ float shared_mem[];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Preload data into shared memory
    if (tid < size) {
        shared_mem[threadIdx.x] = in1[tid];
        __syncthreads();

        // Perform division using shared memory
        out[tid] = shared_mem[threadIdx.x] / in2[tid];
    }
}