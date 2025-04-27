#include "hip/hip_runtime.h"
#include "includes.h"

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
    // Load a segment of the input vector into shared memory
    __shared__ float partSum[BLOCK_SIZE];
    unsigned int tx = threadIdx.x;
    unsigned int start = 2 * blockIdx.x * BLOCK_SIZE;
    
    float sum = 0; // Initialize sum for each thread

    // Load two elements per thread and reduce potential bank conflicts by using local sum
    if (start + tx < len) {
        sum += input[start + tx];
        if (start + BLOCK_SIZE + tx < len) sum += input[start + BLOCK_SIZE + tx];
    }

    partSum[tx] = sum;
    __syncthreads();

    // Traverse the reduction tree
    for (unsigned int stride = BLOCK_SIZE / 2; stride > 0; stride /= 2) {
        if (tx < stride) {
            partSum[tx] += partSum[tx + stride];
        }
        __syncthreads();
    }

    // Write the computed sum of the block to the output vector at the correct index
    if (tx == 0) {
        output[blockIdx.x] = partSum[0];
    }
}