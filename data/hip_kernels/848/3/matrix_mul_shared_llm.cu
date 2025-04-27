#include "hip/hip_runtime.h"
#include "includes.h"

// Macro for tile size, ensures flexibility
#define TILE 16

__global__ void matrix_mul_shared(float *ad, float *bd, float *cd, int N)
{
    float pvalue = 0;

    int ty = threadIdx.y;
    int tx = threadIdx.x;

    // Allocate shared memory per block
    __shared__ float ads[TILE][TILE];
    __shared__ float bds[TILE][TILE];

    // Find Row and Column corresponding to a data element for each thread
    int Row = blockIdx.y * TILE + ty;
    int Col = blockIdx.x * TILE + tx;

    // Iterate through TILEs to traverse the whole width
    for (int i = 0; i < N / TILE; ++i)
    {
        // Copy values of data TILE into shared memory
        ads[ty][tx] = ad[Row * N + (i * TILE) + tx];
        bds[ty][tx] = bd[(i * TILE + ty) * N + Col];

        __syncthreads(); // Synchronize to confirm that the whole TILE has been copied

        // Calculate partial dot-product
        #pragma unroll
        for (int k = 0; k < TILE; k++)
            pvalue += ads[ty][k] * bds[k][tx];

        __syncthreads(); // Synchronize to confirm that the whole partial product has been calculated
    }

    // Store dot product at the corresponding position in the resultant Matrix
    cd[Row * N + Col] = pvalue;
}