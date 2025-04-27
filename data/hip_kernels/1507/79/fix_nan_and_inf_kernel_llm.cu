#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fix_nan_and_inf_kernel(float *input, size_t size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        float val = input[index];
        // Direct assignment with ternary operator for efficiency
        input[index] = (isnan(val) || isinf(val)) ? (float)index : val;
    }
}