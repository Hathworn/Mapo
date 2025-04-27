#include "hip/hip_runtime.h"
#include "includes.h"

enum ComputeMode { ADD, SUB, MUL, DIV };
hipError_t computeWithCuda(int *c, const int *a, const int *b, unsigned int size, ComputeMode mode);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform the computation if within bounds
    if (i < size) {
        c[i] = a[i] + b[i];
    }
}