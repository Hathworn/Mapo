#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void gaxpy3(const int n, const double *a, const double *b, double *c)
{
    // Calculate the global index for each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x 
            + (blockIdx.y * blockDim.y + threadIdx.y) * blockDim.x
            + (blockIdx.z * blockDim.z + threadIdx.z) * blockDim.x * blockDim.y;
    
    if (i < n) {
        // Efficient memory access and removal of unnecessary print statements
        c[i] = a[0] * b[i] + c[i];
    }
}