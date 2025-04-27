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

/*************************************************************************************************************/
/*************								INITIALIZATION CODE										**********/
/*************************************************************************************************************/

__global__ void newForceReduction(float *input, float *output, int startunit, int len)
{
    unsigned int tx = threadIdx.x;
    unsigned int start = blockIdx.x * N_ATOMS;

    __shared__ float partSum[BLOCK_SIZE];

    // Initialize shared memory
    partSum[tx] = (tx < N_ATOMS) ? input[start + tx] : 0.0f;
    __syncthreads();

    // Unroll the loop for faster convergence
    // Use loop to eliminate repetitive code
    for (unsigned int stride = BLOCK_SIZE / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            partSum[tx] += partSum[tx + stride];
        }
        __syncthreads();
    }

    // Store the result in global memory
    if (tx == 0) {
        output[blockIdx.x] = -partSum[0];
    }
}