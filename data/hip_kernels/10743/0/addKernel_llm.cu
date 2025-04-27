#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use blockIdx.x and blockDim.x to allow kernel to process more than blockDim.x elements
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform both addition and subtraction
    int sum = a[i] + b[i];
    int diff = a[i] - b[i];
    
    // Store results in output array
    c[i] = sum;   // Optional: Modify according the logic needed (sum or diff)
    c[i] = diff;  // Remove if sum is needed instead
}