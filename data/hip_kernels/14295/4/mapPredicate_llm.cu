#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize using shared memory to reduce global memory access latency
__global__ void mapPredicate(unsigned int *d_zeros, unsigned int *d_ones, unsigned int *d_in, unsigned int bit, size_t n)
{
    extern __shared__ unsigned int sharedData[];  // allocate shared memory
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int index = BLOCK_WIDTH * bx + tx;

    if(index < n) {
        sharedData[tx] = d_in[index];  // load data into shared memory
        __syncthreads();  // ensure all data is loaded before processing
        
        unsigned int isOne = (sharedData[tx] >> bit) & 1;  // compute using shared memory
        d_ones[index] = isOne;
        d_zeros[index] = 1 - isOne;
    }
}