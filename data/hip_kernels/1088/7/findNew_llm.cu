#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void findNew(double* cCurr, double* cBar, double* cHalf, int nx)
{
    // Use a 1D grid and block configuration for better memory access patterns
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform boundary check to prevent out-of-bounds accesses
    if (index < nx * gridDim.y * blockDim.y) {
        // Compute the updated value
        cCurr[index] = cBar[index] + cHalf[index];
    }
}