#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using device function
__device__ int add_device(int a, int b) {
    return a + b;
}

__global__ void add(int a, int b, int *c)
{
    // Using device function for the addition
    *c = add_device(a, b);
}