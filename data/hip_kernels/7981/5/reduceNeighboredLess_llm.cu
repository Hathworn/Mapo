```c++
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighboredLess(int *g_idata, int *g_odata, unsigned int n) {
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ int sdata[];  // Declare shared memory
    if (idx < n) {
        sdata[tid] = g_idata[idx];  // Load input into shared memory
    } else {
        sdata[tid] = 0;  // Deal with out of bound threads
    }
    __syncthreads();  // Ensure all data is loaded

    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];  // Perform reduction in shared memory
        }
        __syncthreads();  // Ensure all adds at one stage are done before the next
    }

    if (tid == 0) g_odata[blockIdx.x] = sdata[0];  // Write result for this block to global memory
}