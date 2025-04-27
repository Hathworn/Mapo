#include "hip/hip_runtime.h"
#include "includes.h"

/* Optimized Vector addition kernel */

/*
Matrix Matrix multiplication with a single thread for each row
*/

/*
Matrix Matrix multiplication with a single thread for each result element
*/

/*
Matrix Vector multiplication with a block with 4 threads per block, shared block mem and parallel reduce
*/

__global__ void simple_addition(int *a, int *b, int *c, int len)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure tid is within bounds
    if (tid < len) {
        c[tid] = a[tid] + b[tid];
    }
}