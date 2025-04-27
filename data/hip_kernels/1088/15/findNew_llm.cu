#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void findNew(double* cCurr, double* cBar, double* cHalf, int nx)
{
    // Calculate global thread index
    int index = blockDim.x * blockIdx.x + threadIdx.x + 
                (blockDim.y * blockIdx.y + threadIdx.y) * nx;

    // Update current matrix value
    if(index < nx * gridDim.y * blockDim.y) { // Check bounds
        cCurr[index] = cBar[index] + cHalf[index];
    }
}