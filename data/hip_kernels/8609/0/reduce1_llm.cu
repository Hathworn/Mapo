#include "hip/hip_runtime.h"
#include "includes.h"

#define subCOL 5248
#define COL 5248
#define ROW 358
#define WARPABLEROW 512
#define blocksize 256
#define subMatDim subCOL*WARPABLEROW
#define targetMatDim ROW * COL

__global__ void reduce1(int *g_idata, int *g_odata, int g_size)
{
    __shared__ int sdata[blocksize];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data and check bounds
    int my_value = (i < g_size) ? g_idata[i] : 0;
    sdata[tid] = my_value;
    __syncthreads();

    // Unroll the loop by a factor of 2 for optimization
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}