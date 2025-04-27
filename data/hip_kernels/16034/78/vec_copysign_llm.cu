#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_copysign (int n, double *result, double *x, double *y)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D index
    if (id < n) {
        result[id] = copysign(x[id], y[id]); // Perform copysign operation
    }
}