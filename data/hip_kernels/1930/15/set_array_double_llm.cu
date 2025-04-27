#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_array_double(double *a, double value, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure loop is only executed if idx is within bounds initially
    if (idx < len) {
        for (; idx < len; idx += blockDim.x * gridDim.x) {
            a[idx] = value;  // Set value directly
        }
    }
}