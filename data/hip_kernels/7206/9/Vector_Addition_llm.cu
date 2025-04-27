#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Vector_Addition(const int *dev_a, const int *dev_b, int *dev_c)
{
    // Get the id of thread within the grid
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (tid < N) // Check the boundary condition for the threads
        dev_c[tid] = dev_a[tid] + dev_b[tid];
}