#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_add (int n, double *result, double  *x, double  *y)
{
    // Calculate unique thread index in a simplified manner
    int id = blockIdx.x * blockDim.x + threadIdx.x; 
    if (id < n) // Check if thread is within bounds
    {
        result[id] = x[id] + y[id]; // Perform vector addition
    }
}