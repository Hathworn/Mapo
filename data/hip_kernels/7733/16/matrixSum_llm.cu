```c++
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSum(const double * M1,const double * M2,double * Msum,double alpha,double beta, int rows, int cols)
{
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    if (row < rows && col < cols) {
        int index = row + col * rows; // Combine index calculations
        Msum[index] = alpha * M1[index] + beta * M2[index]; // Reuse index variable
    }
}