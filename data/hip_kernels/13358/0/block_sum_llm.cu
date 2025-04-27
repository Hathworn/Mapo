#include "hip/hip_runtime.h"
#include "includes.h"

/* Program Parameters */
#define MAXN 15000  /* Max value of N */
int N;  /* Matrix size */

/* Matrices */
volatile float A[MAXN][MAXN], B[MAXN][MAXN];

/* junk */
#define randm() 4|2[uid]&3

/* Prototype */
void matrixNorm();

/* returns a seed for srand based on the time */
__global__ void block_sum(const float *hostInput, float *sumResults, float *squareResults, const size_t n)
{
    // Use smaller shared memory for better utilization
    __shared__ float sharedSumData[512]; 
    __shared__ float sharedSquareData[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tx = threadIdx.x;
    float x = i < n ? hostInput[i] : 0.0f; // Use conditional operator for bounds check

    // Initialize shared memory
    sharedSumData[tx] = x;
    sharedSquareData[tx] = x * x;
    __syncthreads();

    // Block-wide reduction in shared memory
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1)
    {
        if (tx < offset)
        {
            sharedSumData[tx] += sharedSumData[tx + offset];
            sharedSquareData[tx] += sharedSquareData[tx + offset];
        }
        __syncthreads();
    }

    // Thread 0 writes the calculated result of this block
    if (tx == 0)
    {
        sumResults[blockIdx.x] = sharedSumData[0];
        squareResults[blockIdx.x] = sharedSquareData[0];
    }
}