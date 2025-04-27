#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy(int * a, int * b, int * c)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Process data within the bounds
    if (tid < N) 
    {
        // Direct evaluation of SAXPY operation
        int temp_a = a[tid]; // Load a[tid] once into a register
        c[tid] = 2 * temp_a + b[tid]; // Compute and store result
    }
}