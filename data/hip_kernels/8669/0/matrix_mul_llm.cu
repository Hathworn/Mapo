#include "hip/hip_runtime.h"
#include "includes.h"

//32x32
#define NTHREADS_X 16
#define NTHREADS_Y 32
#define THREADS_PER_BLOCK NTHREADS_X * NTHREADS_Y

/* 
 * Error checking macro for HIP function calls 
 * Based on: http://stackoverflow.com/a/14038590
 */
__global__ void matrix_mul(int *a, int *b, int *c, int a_ncolumns, int c_nlines, int c_ncolumns)
{
    // Calculate global column and row indices
    int column = blockIdx.x * blockDim.x + threadIdx.x;
    int line = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds of result matrix
    if (column >= c_ncolumns || line >= c_nlines)
        return;

    // Keep intermediate sum for dot product
    int sum = 0;
    int beginA = a_ncolumns * line;
    int beginB = column;

    // Perform dot product calculation for line and column
    for (int i = 0; i < a_ncolumns; i++)
    {
        sum += a[beginA + i] * b[i * c_ncolumns + beginB];
    }

    // Write the result back to the matrix C
    c[line * c_ncolumns + column] = sum;
}