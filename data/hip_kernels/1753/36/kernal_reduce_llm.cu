#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernal_reduce(float *g_idata, float *g_odata)
{
    extern __shared__ float sdata[];
    // Calculate thread and element indices
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x*(blockDim.x*2) + threadIdx.x;

    // Load elements into shared memory, check array boundary
    sdata[tid] = (i < blockDim.x * gridDim.x) ? g_idata[i] : 0;
    sdata[tid] += ((i+blockDim.x) < blockDim.x * gridDim.x) ? g_idata[i+blockDim.x] : 0;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s=blockDim.x/2; s>0; s>>=1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}