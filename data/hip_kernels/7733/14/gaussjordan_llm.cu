```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussjordan(double *A, double *I, int nn, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads operate within the matrix bounds
    if (x < nn && y < nn) {
        // Skip the row with index 'i'
        if (x != i) {
            // Perform the Gauss-Jordan elimination on matrix I
            I[x * nn + y] -= I[i * nn + y] * A[x * nn + i];
            // Perform the Gauss-Jordan elimination on matrix A, avoiding the pivot column
            if (y != i) {
                A[x * nn + y] -= A[i * nn + y] * A[x * nn + i];
            }
        }
    }
}