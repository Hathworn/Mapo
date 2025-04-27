#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void partialScan(unsigned int *d_in, unsigned int *d_out, unsigned int *d_total, size_t n)
{
    __shared__ unsigned int temp[BLOCK_WIDTH];
    int tx = threadIdx.x;
    int bx = blockIdx.x;
    int index = BLOCK_WIDTH * bx + tx;

    // Load input to shared memory, zero if out of bounds
    temp[tx] = (index < n) ? d_in[index] : 0;
    __syncthreads();

    // Perform the actual scan using a more optimal parallel approach
    for(int offset = 1; offset < BLOCK_WIDTH; offset <<= 1) {
        unsigned int val = (tx >= offset) ? temp[tx - offset] : 0;
        __syncthreads();
        temp[tx] += val;
        __syncthreads();
    }

    // Write results to d_out and set d_out[0] to 0
    if(index + 1 < n) {
        d_out[index + 1] = temp[tx];
    }
    if(index == 0) {
        d_out[0] = 0;
    }

    // Store the total sum of each block
    if(tx == BLOCK_WIDTH - 1) {
        d_total[bx] = temp[tx];
    }
}