#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void is_nan_or_inf_kernel(float *input, size_t size, int *pinned_return)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        float val = input[index];
        // Use atomic operation to prevent race condition
        if (isnan(val) || isinf(val))
            atomicMax(pinned_return, 1);
    }
}