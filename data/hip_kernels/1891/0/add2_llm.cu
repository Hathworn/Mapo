#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int add_d(int a, int b)
{
    // Remove redundant print statement for performance
    return a * b;
}

__global__ void add2(int a, int b, int *c)
{
    // Pre-compute add_d result without intermediate print
    int result = add_d(a, b);
    
    // Directly store result to global memory
    *c = result;
    
    // Remove unnecessary print statements to reduce kernel overhead
}