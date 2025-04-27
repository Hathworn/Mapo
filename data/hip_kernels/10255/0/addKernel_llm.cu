#include "hip/hip_runtime.h"
#include "includes.h"
//-----include header files, ¤Þ¤J¼ÐÀYÀÉ-----

hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

// Optimize kernel for better data access and parallelism
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Calculate global index 
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (i < N) { 
        c[i] = a[i] + b[i];
    }
}