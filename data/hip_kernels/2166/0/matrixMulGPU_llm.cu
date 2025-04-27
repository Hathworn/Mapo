#include "hip/hip_runtime.h"
#include "includes.h"

#define N  64

__global__ void matrixMulGPU(int * a, int * b, int * c)
{
    // Calculate row index of the element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    // Calculate column index of the element
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize the sum variable
    int sum = 0;
    
    // Perform multiplication and accumulate
    for (int k = 0; k < N; k++) {
        sum += a[row * N + k] * b[k * N + col];
    }
    
    // Write the result to the output matrix
    c[row * N + col] = sum;
}