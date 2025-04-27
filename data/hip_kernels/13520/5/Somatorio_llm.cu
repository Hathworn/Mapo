#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Somatorio(float *input, float *results, long int n) {
    extern __shared__ float sdata[];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int tx = threadIdx.x;

    // Initialize shared memory
    sdata[tx] = (idx < n) ? input[idx] : 0.0f;
    __syncthreads();

    // Perform reduction
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tx < offset) {
            sdata[tx] += sdata[tx + offset];
        }
        __syncthreads(); // Synchronize within block
    }

    // Write result for this block to global memory
    if (tx == 0) {
        results[blockIdx.x] = sdata[0];
    }
}