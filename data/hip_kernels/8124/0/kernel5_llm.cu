```c
#include "hip/hip_runtime.h"
#include "includes.h"

typedef float dtype;

#define N_ (8 * 1024 * 1024)
#define MAX_THREADS 256 // threads per block
#define MAX_BLOCKS 64

#define MIN(x,y) ((x < y) ? x : y)

/* return the next power of 2 number that is larger than x */
__global__ void kernel5(dtype *g_idata, dtype *g_odata, unsigned int n)
{
    __shared__ volatile dtype scratch[MAX_THREADS];
    unsigned int bid = gridDim.x * blockIdx.y + blockIdx.x;
    unsigned int blockDimNew = blockDim.x * 2;
    unsigned int i = (bid * blockDimNew) + threadIdx.x;
    unsigned int gridSize = blockDim.x * 2 * gridDim.x;

    // Initialize scratch array to 0
    scratch[threadIdx.x] = 0;
    
    // Efficient strided access for reading
    while(i < n) {
        scratch[threadIdx.x] += g_idata[i] + (i + blockDim.x < n ? g_idata[i + blockDim.x] : 0);
        i += gridSize;
    }
    __syncthreads();

    // Reduction loop unrolling and remove unnecessary synchronization
    for(int stride = (blockDim.x / 2); stride > 0; stride >>= 1) {
        if(threadIdx.x < stride) {
            scratch[threadIdx.x] += scratch[threadIdx.x + stride];
        }
        __syncthreads(); 
    }

    // Write result from each block to global memory
    if(threadIdx.x == 0) {
        g_odata[bid] = scratch[0];
    }
}