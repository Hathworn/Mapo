#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaCompute_AtP(double *d_A, double *d_P, double *d_AtP, int rows, int columns)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int total_elements = rows * columns;

    // Unrolling loop for performance optimization
    for (int i = tid; i < total_elements; i += blockDim.x * gridDim.x)
    {
        int row = i % rows;
        int column = i / rows;
        d_AtP[row + column * rows] = d_A[column + row * columns] * d_P[column];
    }
}