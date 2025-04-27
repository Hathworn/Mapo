#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Get global index of each thread using built-in function for performance
    int index = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x; 
    // Perform addition and store the result
    c[index] = a[index] + b[index];
}