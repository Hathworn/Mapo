#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce3(float *in, float *out, int size)
{
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input data into shared memory, using conditional checks
    if (index < size) {
        sdata[tid] = in[index];
    } else {
        sdata[tid] = 0;
    }
    
    __syncthreads();

    // Iterate over the shared memory for reduction with stride-based loop.
    // Using unrolling and conditional checks to improve performance
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tid == 0) {
        out[blockIdx.x] = sdata[0];
    }
}