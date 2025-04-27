#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(float *gdata, float *out) {
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;
    float sum = 0.0f;

    // Grid-stride loop for loading data
    while (idx < N) {
        sum += gdata[idx];
        idx += gridDim.x * blockDim.x;
    }

    // Store partial sum in shared memory
    sdata[tid] = sum;
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result from first thread of this block
    if (tid == 0) out[blockIdx.x] = sdata[0];
}