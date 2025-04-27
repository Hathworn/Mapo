#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_array_gpu(float *a, int power, int array_size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < array_size)
    {
        // Use intrinsics for power calculation to optimize
        a[idx] = powf(a[idx], power);
    }
}