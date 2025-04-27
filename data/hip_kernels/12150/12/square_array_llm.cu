#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int array_size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < array_size)
    {
        float value = a[idx]; // Load value once for reuse
        a[idx] = value * value; // Perform the computation
    }
}