#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_print(int const* p, int n)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index for parallel print

    if (idx == 0) 
    {
        printf("int: %d ", n); // Only the first thread prints the integer
    }

    // Synchronize before printing array
    __syncthreads(); 

    if (idx < n) 
    {
        printf("%d ", p[idx]); // Each thread prints one element
    }
}