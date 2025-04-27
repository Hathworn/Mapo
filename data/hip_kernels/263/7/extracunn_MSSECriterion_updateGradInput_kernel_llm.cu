#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void extracunn_MSSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    __shared__ float buffer[MSSECRITERION_THREADS];

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;
    float local_sum = 0.0;

    // Compute local sum of differences
    for (int i = i_start; i < i_end; i += i_step)
    {
        float z = input_k[i] - target_k[i];
        local_sum += z;
    }
    buffer[threadIdx.x] = local_sum;
    __syncthreads();

    // Perform reduction in shared memory
    if (threadIdx.x == 0)
    {
        float sum = 0.0;
        for (int i = 0; i < blockDim.x; i++)
        {
            sum += buffer[i];
        }
        buffer[0] = sum; // Store final reduced sum in buffer[0]
    }
    __syncthreads();

    // Scale and write the gradient input
    float final_sum = buffer[0];
    for (int i = i_start; i < i_end; i += i_step)
    {
        gradInput_k[i] = norm * final_sum;
    }
}
```
