#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_array_double(double *a, double value, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;  // Pre-calculate stride for efficiency

    // Use a for loop for better readability and no need to calculate idx in each iteration
    for (; idx < len; idx += stride) {
        a[idx] = value;
    }
}