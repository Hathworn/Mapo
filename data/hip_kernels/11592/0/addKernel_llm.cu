#include "hip/hip_runtime.h"
#include "includes.h"
hipError_t addWithCuda(int *c, const int *a, const int *b, size_t size);

// Optimize by computing index using blockIdx.x and threadIdx.x for scalability
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < size) // Boundary check to prevent out-of-bounds access
    {
        c[i] = a[i] + b[i]; // Perform addition
    }
}