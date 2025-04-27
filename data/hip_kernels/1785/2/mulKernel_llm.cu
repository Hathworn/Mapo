#include "hip/hip_runtime.h"
#include "includes.h"

enum ComputeMode { ADD, SUB, MUL, DIV };
hipError_t computeWithCuda(int *c, const int *a, const int *b, unsigned int size, ComputeMode mode);

__global__ void mulKernel(float* c, const float* a, const float* b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread doesn't access out of bounds elements
    if (i < size) {
        c[i] = a[i] * b[i];
    }
}