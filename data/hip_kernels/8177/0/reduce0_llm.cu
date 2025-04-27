#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void reduce0(float* g_odata, float* g_idata1, float* g_idata2) {
    extern __shared__ float sdata[];

    // Calculate global index
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Bounds check
    if (i >= gridDim.x * blockDim.x) return;

    // Load from global memory to shared memory
    sdata[tid] = g_idata1[i] * g_idata2[i];
    __syncthreads();

    // Perform tree-based reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}