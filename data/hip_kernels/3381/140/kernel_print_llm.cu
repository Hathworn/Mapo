#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void kernel_print( long const* p, int n)
{
    printf("long: %d ", n);
    
    // Loop unrolling for better performance
    int i = threadIdx.x;
    int stride = blockDim.x;
    for(; i < n; i += stride)
    {
        printf("%ld ", p[i]);
    }
}