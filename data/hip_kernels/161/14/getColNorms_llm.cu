#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

// Updates the column norms by subtracting the Hadamard-square of the
// Householder vector.
//
// N.B.:  Overflow incurred in computing the square should already have
// been detected in the original norm construction.

__global__ void getColNorms(int rows, int cols, float *da, int lda, float *colNorms)
{
    int colIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Early exit if the column index exceeds the number of columns
    if (colIndex >= cols)
        return;

    float sum = 0.f;
    float *col = da + colIndex * lda;

    // Utilize shared memory to reduce global memory accesses
    __shared__ float sharedMem[512];

    for (int i = threadIdx.x; i < rows; i += blockDim.x) {
        float term = col[i];
        sharedMem[threadIdx.x] = term * term;
        __syncthreads();

        // Accumulate results from shared memory
        for (int j = 0; j < blockDim.x; j++) {
            sum += sharedMem[j];
        }
        __syncthreads();
    }

    colNorms[colIndex] = sum;
}