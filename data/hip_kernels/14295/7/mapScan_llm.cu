#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapScan(unsigned int *d_array, unsigned int *d_total, size_t n) {
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int index = BLOCK_WIDTH * bx + tx;

    if(index < n) {
        // Use shared memory to reduce global memory access latency
        __shared__ unsigned int total;
        if(tx == 0) {
            total = d_total[bx];
        }
        __syncthreads();
        
        d_array[index] += total;
    }
}