#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cmax(float *d_in, float *max, int len)
{
    extern __shared__ float smax[];

    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load elements into shared memory and perform initial reduction step
    if (i < len)
        smax[tid] = d_in[i];
    else
        smax[tid] = -FLT_MAX; // Handle out-of-bounds access

    __syncthreads();

    // Unrolling loop for parallel reduction
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride && (i + stride) < len) {
            smax[tid] = fmaxf(smax[tid], smax[tid + stride]);
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        max[blockIdx.x] = smax[0];
    }
}