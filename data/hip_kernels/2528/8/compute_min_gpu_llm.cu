#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_min_gpu(float *device_input, float *device_output) {
    extern __shared__ float sm[];

    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory
    sm[tid] = device_input[i];
    __syncthreads();

    // Efficient reduction using shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sm[tid] = min(sm[tid], sm[tid + s]);
        }
        __syncthreads();
    }

    // Write result of this block to global memory
    if (tid == 0) device_output[blockIdx.x] = sm[0];
}