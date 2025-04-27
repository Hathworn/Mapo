#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_MSECriterion_updateOutput_kernel(float* output, float *input, float *target, int nframe, int dim, int sizeAverage)
{
    __shared__ float buffer[MSECRITERION_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Initialize buffer with 0 for each thread
    float sum = 0.0f;
    for (int i = i_start; i < i_end; i += i_step)
    {
        float z = input_k[i] - target_k[i];
        sum += z * z;
    }
    buffer[threadIdx.x] = sum;
    __syncthreads();

    // Reduce using parallel reduction
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (threadIdx.x < stride)
        {
            buffer[threadIdx.x] += buffer[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Finalize result
    if (threadIdx.x == 0)
    {
        *output = buffer[0];
        if (sizeAverage)
            *output /= dim;
    }
}