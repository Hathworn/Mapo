#include "hip/hip_runtime.h"
#include "includes.h"

enum ComputeMode { ADD, SUB, MUL, DIV };
hipError_t computeWithCuda(int *c, const int *a, const int *b, unsigned int size, ComputeMode mode);

__global__ void compareWithOneKernel(float* b, const double* a)
{
    // Calculate global thread index for processing larger arrays
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that the current thread index is within bounds
    if (i < N) // Assuming N is the length of the arrays
    {
        if (a[i] == 1.0) // Use 1.0 for precision
        {
            b[i] += 1.0f; // Simplified increment operation
        }
    }
}