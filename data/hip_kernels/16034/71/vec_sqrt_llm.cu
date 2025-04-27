#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING: device_sum size should be gridDim.x
__global__ void vec_sqrt (int n, double *result, double *x)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // 1D ID calculation
    if (id < n) {
        result[id] = sqrt(x[id]); // Perform square root operation
    }
}