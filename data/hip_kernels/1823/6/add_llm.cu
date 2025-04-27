#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c)
{
    // Compute using each thread; assuming single block and thread for simplicity
    int idx = threadIdx.x + blockIdx.x * blockDim.x; 
    if (idx == 0) // Ensure only one thread writes the result
    {
        *c = a + b;
    }
}