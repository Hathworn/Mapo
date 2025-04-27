#include "hip/hip_runtime.h"
#include "includes.h"

#define MAXN 15000  /* Max value of N */
int N;  /* Matrix size */

/* Matrices */
volatile float A[MAXN][MAXN], B[MAXN][MAXN];

/* junk */
#define randm() 4|2[uid]&3

/* Prototype */
void matrixNorm();

__global__ void single_block_reduction(float *sumResults, float *squareResults, const size_t n)
{
    __shared__ float sharedSumData[256];
    __shared__ float sharedSquareData[256];

    int tx = threadIdx.x;

    // Load shared memory with current block's sum and square data
    if(tx < n) {
        sharedSumData[tx] = sumResults[tx];
        sharedSquareData[tx] = squareResults[tx];
    }
    __syncthreads();

    // block-wide reduction in shared memory
    for(int offset = n / 2; offset > 0; offset >>= 1) {
        if(tx < offset) {
            sharedSumData[tx] += sharedSumData[tx + offset];
            sharedSquareData[tx] += sharedSquareData[tx + offset];
        }
        __syncthreads();
    }

    // thread 0 writes the result for the block
    if(tx == 0) {
        sumResults[0] = sharedSumData[0];
        squareResults[0] = sharedSquareData[0];
    }
}