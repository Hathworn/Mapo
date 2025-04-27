#include "hip/hip_runtime.h"
#include "includes.h"

enum ComputeMode { ADD, SUB, MUL, DIV };
hipError_t computeWithCuda(int *c, const int *a, const int *b, unsigned int size, ComputeMode mode);

// Optimized kernel function
__global__ void dividKernel(float* c, const float* a, const float* b)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global thread index
    if (i < size) // Boundary check to prevent out of range memory access
    {
        c[i] = a[i] / b[i];
    }
}