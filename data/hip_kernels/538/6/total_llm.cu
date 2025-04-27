#include "hip/hip_runtime.h"
#include "includes.h"

// Parameters

#define N_ATOMS 343
#define MASS_ATOM 1.0f
#define time_step 0.01f
#define L 10.5f
#define T 0.728f
#define NUM_STEPS 10000

const int BLOCK_SIZE = 1024;
const int scheme = 1; // 0 for explicit, 1 for implicit

__global__ void total(float *input, float *output, int len)
{
    // Shared memory for storing partial sums
    __shared__ float partSum[2 * BLOCK_SIZE];
    unsigned int tx = threadIdx.x;
    unsigned int start = 2 * blockIdx.x * BLOCK_SIZE;

    // Load input floats to shared memory with boundary checks
    partSum[tx] = (start + tx < len) ? input[start + tx] : 0;
    partSum[BLOCK_SIZE + tx] = (start + BLOCK_SIZE + tx < len) ? input[start + BLOCK_SIZE + tx] : 0;

    // Reduce using a binary reduction tree approach
    for (unsigned int stride = BLOCK_SIZE; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tx < stride) {
            partSum[tx] += partSum[tx + stride];
        }
    }

    // Output the block sum
    if (tx == 0) { 
        output[blockIdx.x] = partSum[0]; 
    }
}