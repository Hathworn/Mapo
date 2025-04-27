#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cosineKernel(float *a, float *b, float *outN, float *outD1, float *outD2, int size) {
    extern __shared__ float sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;

    float sum0 = 0.0f; // Initialize local sums
    float sum1 = 0.0f;
    float sum2 = 0.0f;

    int stride = gridDim.x * blockDim.x;
    
    while (i < size) {
        // Compute partial results for pair of elements
        float val0 = a[i] * b[i];
        float val1 = a[i + blockDim.x] * b[i + blockDim.x];

        // Accumulate to local sums
        sum0 += val0 + val1;
        sum1 += val0 + val1;
        sum2 += val0 + val1;

        i += stride;
    }

    // Store local sums into shared memory
    sdata[3 * tid]     = sum0;
    sdata[3 * tid + 1] = sum1;
    sdata[3 * tid + 2] = sum2;

    __syncthreads();

    // Perform parallel reduction within block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[3 * tid]     += sdata[3 * tid + s];
            sdata[3 * tid + 1] += sdata[3 * tid + s + 1];
            sdata[3 * tid + 2] += sdata[3 * tid + s + 2];
        }
        __syncthreads(); // Ensure all threads have updated before next reduction step
    }

    // Write result for each block to global memory
    if (tid == 0) {
        outN[blockIdx.x] = sdata[0];
        outD1[blockIdx.x] = sdata[1];
        outD2[blockIdx.x] = sdata[2];
    }
}