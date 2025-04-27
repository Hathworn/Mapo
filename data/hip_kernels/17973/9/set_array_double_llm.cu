#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_array_double(double *a, double value, size_t len)
{
    // Calculate the global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Optimize by using grid-stride loop for better performance
    for (size_t stride = blockDim.x * gridDim.x; idx < len; idx += stride) {
        a[idx] = value;
    }
}