#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void hello()
{
    // Each thread will print its thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    printf("Hello world! I'm thread %d\n", idx); // Use global index for printing
}