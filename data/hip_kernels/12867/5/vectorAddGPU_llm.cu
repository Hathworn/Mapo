#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddGPU(float * __restrict__ a, float * __restrict__ b, float * __restrict__ c, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N)
    {
        // Utilize registers for repeated access
        float tmp_a = a[idx];
        float tmp_b = b[idx];
        c[idx] = tmp_a + tmp_b;
    }
}