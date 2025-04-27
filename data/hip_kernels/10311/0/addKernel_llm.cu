#include "hip/hip_runtime.h"
#include "includes.h"
int addWithCuda(int *c, const int *a, const int *b, unsigned int size);
bool isLoadDevice = false;

// Optimized kernel for better parallelism and memory access
__global__ void addKernel(int *c, const int *a, const int *b, int n) 
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) // Ensure threads do not access out-of-bound memory
    {
        c[i] = a[i] + b[i];
    }
}