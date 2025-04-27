#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOne(double* vals, int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x 
            + blockIdx.y * gridDim.x * blockDim.x * blockDim.y 
            + threadIdx.y * blockDim.x;
    
    // Ensure thread is within bounds
    if(idx < N) {
        vals[idx] += 1.0; // Increment value by 1.0
    }
}