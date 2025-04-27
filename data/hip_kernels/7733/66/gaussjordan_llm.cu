#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussjordan(double *A, double *I, int nn, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds and skip unnecessary checks
    if (x < nn && y < nn && x != i) {
        double AI = A[x * nn + i];
        I[x * nn + y] -= I[i * nn + y] * AI;

        // Perform subtraction only when necessary
        if (y != i) {
            A[x * nn + y] -= A[i * nn + y] * AI;
        }
    }
}