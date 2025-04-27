```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void RoundKernel_naive(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    // Calculate the global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Only process elements within bounds
    if (id < out0count) {
        out0[id] = roundf(A[id]);  // Use roundf for better performance with float
    }
}