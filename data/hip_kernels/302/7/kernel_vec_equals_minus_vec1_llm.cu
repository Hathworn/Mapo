#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_vec_equals_minus_vec1(double *vec, double *vec1, int numElements)
{
    // Calculate global thread ID
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform computation only if gid is within bounds
    if (gid < numElements) {
        vec[gid] = -vec1[gid];
    }
}