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
//const int L = ;
const int scheme = 1; // 0 for explicit, 1 for implicit

/*************************************************************************************************************/
/*************								INITIALIZATION CODE										**********/
/*************************************************************************************************************/

__global__ void newForceReduction(float *input, float *output, int startunit, int len)
{
    unsigned int tx = threadIdx.x;
    unsigned int start = blockIdx.x * N_ATOMS;
    __shared__ float partSum[BLOCK_SIZE];

    // Load input elements into shared memory and handle out-of-bounds threads
    partSum[tx] = (tx < N_ATOMS) ? input[start + tx] : 0.0f;
    __syncthreads();

    // Optimized reduction pattern with loop unrolling
    for (unsigned int stride = BLOCK_SIZE / 2; stride > 32; stride >>= 1) {
        if (tx < stride) {
            partSum[tx] += partSum[tx + stride];
        }
        __syncthreads();
    }

    // Unrolled final warp for better performance without __syncthreads()
    if (tx < 32) {
        partSum[tx] += partSum[tx + 32];
        partSum[tx] += partSum[tx + 16];
        partSum[tx] += partSum[tx + 8];
        partSum[tx] += partSum[tx + 4];
        partSum[tx] += partSum[tx + 2];
        partSum[tx] += partSum[tx + 1];
    }

    // Write result to output array from the first thread in the block
    if (tx == 0) {
        output[blockIdx.x] = -partSum[0];
    }
}