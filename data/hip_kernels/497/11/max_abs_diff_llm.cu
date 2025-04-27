#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void max_abs_diff(float* diff, const float* output1, const float* output2, const int size)
{
    extern __shared__ float s_max[];
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int tx = threadIdx.x;

    // Load shared memory only for valid threads within bounds
    if (i < size)
    {
        float o1 = output1[i];
        s_max[tx] = (o1 == -1) ? -1.0f : fabsf(o1 - output2[i]);
    }
    else
    {
        s_max[tx] = -1.0f;
    }

    __syncthreads();  // Ensure shared memory is fully populated

    // Reduce within shared memory
    for (int j = blockDim.x / 2; j > 0; j >>= 1)
    {
        if (tx < j)
        {
            s_max[tx] = fmaxf(s_max[tx], s_max[tx + j]);
        }
        __syncthreads();  // Synchronize at each step of reduction
    }

    // Write block result to global memory
    if (tx == 0)
    {
        diff[blockIdx.x] = s_max[0];
    }
}