#include "hip/hip_runtime.h"
#include "includes.h"

#define subCOL 5248
#define COL 5248
#define ROW 358
#define WARPABLEROW 512
#define blocksize 256
#define subMatDim subCOL*WARPABLEROW
#define targetMatDim ROW * COL

__global__ void reduce5(int *g_idata, int *g_odata, int g_size)
{
    __shared__ int sdata[blocksize];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * (blockDim.x * 2) + threadIdx.x;

    // Load elements to shared memory with bounds check
    int localSum = 0;
    if (i < g_size) localSum = g_idata[i];
    if (i + blockDim.x < g_size) localSum += g_idata[i + blockDim.x];
    sdata[tid] = localSum;
    __syncthreads();

    // Unroll the loop during shared memory reduction
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Perform warp-level reduction using unrolled loop
    if (tid < 32)
    {
        volatile int* smem = sdata; // Use volatile to prevent optimizing out
        smem[tid] += smem[tid + 32];
        smem[tid] += smem[tid + 16];
        smem[tid] += smem[tid + 8];
        smem[tid] += smem[tid + 4];
        smem[tid] += smem[tid + 2];
        smem[tid] += smem[tid + 1];
    }

    // Write block result to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}