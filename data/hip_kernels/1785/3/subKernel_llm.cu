#include "hip/hip_runtime.h"
#include "includes.h"

enum ComputeMode { ADD, SUB, MUL, DIV };
hipError_t computeWithCuda(int *c, const int *a, const int *b, unsigned int size, ComputeMode mode);

// Optimized by using blockDim.x and blockIdx for scalable parallel processing.
__global__ void subKernel(float* c, const float* a, const float* b)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    c[i] = a[i] * b[i];
}