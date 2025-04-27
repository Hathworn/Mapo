#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

// Optimized kernel to update column norms by calculating the squared sum of the Householder vector.
__global__ void getColNorms(int rows, int cols, float *da, int lda, float *colNorms)
{
    int colIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (colIndex >= cols) return;

    float sum = 0.f;
    float *col = da + colIndex * lda;

    // Use unrolled loop for better performance
    for (int i = 0; i < rows - 3; i += 4) {
        sum += col[i] * col[i];
        sum += col[i + 1] * col[i + 1];
        sum += col[i + 2] * col[i + 2];
        sum += col[i + 3] * col[i + 3];
    }

    // Handle remaining elements
    for (int i = (rows / 4) * 4; i < rows; i++) {
        sum += col[i] * col[i];
    }

    colNorms[colIndex] = sum;
}