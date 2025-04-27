```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_OneVsAllNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int dim, int sizeaverage, float *positiveWeight)
{
    extern __shared__ float buffer[]; // Use dynamic shared memory for flexibility
    int k = blockIdx.x;
    float *input_k = input + k * dim;
    float *output_k = output + k;
    int target_k = ((int)target[k]) - 1;

    int idx = threadIdx.x;
    float sum = 0.0f;

    // Use loop unrolling for better performance
    for (int i = idx; i < dim; i += blockDim.x)
    {
        float z = (i == target_k) ? (-positiveWeight[i] * log(input_k[i])) : -logf(1 - input_k[i]);
        sum += z;
    }
    buffer[idx] = sum; // Store partial sum in shared memory
    __syncthreads();

    // Reduce sum using optimized parallel reduction
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (idx < stride)
        {
            buffer[idx] += buffer[idx + stride];
        }
        __syncthreads();
    }

    // Apply the result to global memory
    if (idx == 0)
    {
        *output_k = sizeaverage ? buffer[0] / nframe : buffer[0];
    }
}