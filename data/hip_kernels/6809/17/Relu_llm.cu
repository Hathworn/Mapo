#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Relu(float *x, size_t idx, size_t N, float W0)
{
    // Calculate linear thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) { // Check to avoid processing beyond array bounds
        // Perform ReLU operation with a check to reduce computation    
        float val = W0 * x[(idx - 1) * N + i];
        x[(idx - 1) * N + i] = val > 0 ? val : 0.01;
    }
}