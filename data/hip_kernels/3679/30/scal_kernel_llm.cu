#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scal_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize calculation of global thread index
    int gridSize = blockDim.x * gridDim.x;         // Calculate total number of threads in the grid
    while (i < N) {
        X[i*INCX] *= ALPHA;
        i += gridSize;                             // Advance by grid size for next iteration
    }
}