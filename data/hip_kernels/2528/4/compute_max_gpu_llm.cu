#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_max_gpu(float *device_input, float *device_output) {
    extern __shared__ float sm[];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    sm[tid] = device_input[i];
    __syncthreads();

    // Use warp reduction for better efficiency
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sm[tid] = max(sm[tid], sm[tid + s]);
        }
        __syncthreads();
    }

    // Write the result of this block to global memory
    if (tid == 0) device_output[blockIdx.x] = sm[0];
}