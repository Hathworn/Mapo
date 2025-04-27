#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ReduceRowMajor3(int *g_idata, int *g_odata, int size) {
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid = threadIdx.x;
    extern __shared__ int sdata[];
    sdata[tid] = (i < size) ? g_idata[i] : 0; // Use ternary operator for simplicity
    __syncthreads();
    
    for (unsigned int s = blockDim.x / 2; s > 3; s >>= 1) { // Use bitwise operator for division by 2
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    if (tid < 4) { // Assign first 4 elements only, avoids unnecessary checks
        g_odata[blockIdx.x * 4 + tid] = sdata[tid];
    }
}