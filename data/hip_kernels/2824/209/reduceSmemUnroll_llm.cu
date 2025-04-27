```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceSmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    // Static shared memory
    __shared__ int smem[DIM];
    
    // Set thread ID
    unsigned int tid = threadIdx.x;
    
    // Global index
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    
    // Unrolling 4 blocks
    int localSum = 0;
    
    // Use loop to reduce code size and improve clarity
    #pragma unroll
    for (int i = 0; i < 4; i++) {
        if (idx + i * blockDim.x < n) {
            localSum += g_idata[idx + i * blockDim.x];
        }
    }

    smem[tid] = localSum;
    __syncthreads();

    // Optimize reduction using dynamic check for block size
    #pragma unroll
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            smem[tid] += smem[tid + s];
        }
        __syncthreads();
    }
    
    // Unrolling warp
    if (tid < 32) {
        volatile int *vsmem = smem;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid +  8];
        vsmem[tid] += vsmem[tid +  4];
        vsmem[tid] += vsmem[tid +  2];
        vsmem[tid] += vsmem[tid +  1];
    }

    // Write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = smem[0];
}