#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_acosh(int n, double *result, double *x)
{
    // Combine index computation to reduce arithmetic operations
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid range check
    if (id < n)
    {
        result[id] = acosh(x[id]);
    }
}