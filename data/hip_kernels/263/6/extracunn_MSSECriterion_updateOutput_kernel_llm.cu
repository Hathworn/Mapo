#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void extracunn_MSSECriterion_updateOutput_kernel(float* output, float* input, float* target, int nframe, int dim)
{
    extern __shared__ float buffer[];
    int k = blockIdx.x;
    float* input_k = input + k * dim;
    float* target_k = target + k * dim;

    int i = threadIdx.x;
    float z_partial = 0.0f;

    // Calculate partial sum of z
    while (i < dim)
    {
        float z = input_k[i] - target_k[i];
        z_partial += z;
        i += blockDim.x;
    }

    buffer[threadIdx.x] = z_partial;
    __syncthreads();

    // Reduce all partial sums
    if (threadIdx.x == 0)
    {
        float sum = 0.0f;
        for (int j = 0; j < blockDim.x; j++)
        {
            sum += buffer[j];
        }
        *output = sum * sum / (-2.0f * dim * dim);
    }
}