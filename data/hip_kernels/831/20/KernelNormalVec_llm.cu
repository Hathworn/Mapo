#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KernelNormalVec(double *g_idata, double *g_odata, int l) {

    __shared__ double sdata[BLOCK_SIZE];

    // Improved boundary checking
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + tid;

    // Efficient conditional loading with fewer checks
    double value = (i < l) ? g_idata[i] : 0.0;
    sdata[tid] = value;

    __syncthreads();

    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Directly write result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}