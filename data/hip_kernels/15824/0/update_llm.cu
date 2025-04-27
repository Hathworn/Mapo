#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update(float *weights, float *grad, float lr, int N)
{
    int x = blockDim.x * blockIdx.x + threadIdx.x;
    if (x < N)
    {
        // Apply update and reset gradient in a single operation
        float gradient = grad[x];
        weights[x] -= lr * gradient;
        grad[x] = 0.0; // Reset to zero
    }
}