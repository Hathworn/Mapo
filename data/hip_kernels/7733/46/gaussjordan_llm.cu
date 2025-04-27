#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussjordan(double *A, double *I, int nn, int i)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < nn && y < nn) {
        if (x != i) {
            I[x * nn + y] -= I[i * nn + y] * A[x * nn + i];  // Update matrix I
            if (y != i) {
                A[x * nn + y] -= A[i * nn + y] * A[x * nn + i];  // Update matrix A
            }
        }
    }
}