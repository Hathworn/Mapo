#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaCompute_AtP(double *d_A, double *d_P, double *d_AtP, int rows, int columns )
{
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit early if index is out of bounds
    if (ind >= rows * columns) return;

    int row = ind % rows;
    int column = ind / rows;

    // Use shared memory for A and P values to improve access speed when possible
    __shared__ double shared_A[columns];
    __shared__ double shared_P[columns];

    shared_A[column] = d_A[column + row * columns];
    shared_P[column] = d_P[column];

    // Ensures all threads in the block have reached this point before proceeding
    __syncthreads();

    // Compute the resulting d_AtP value with the shared memory
    d_AtP[row + column * rows] = shared_A[column] * shared_P[column];
}