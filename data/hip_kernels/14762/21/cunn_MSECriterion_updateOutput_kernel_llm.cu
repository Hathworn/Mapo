#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_MSECriterion_updateOutput_kernel(float* output, float *input, float *target, int nframe, int dim, int sizeAverage)
{
    __shared__ float buffer[MSECRITERION_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k*dim;
    float *target_k = target + k*dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Initialize buffer
    buffer[threadIdx.x] = 0.0f;

    // Compute the squared differences
    for (int i = i_start; i < i_end; i += i_step)
    {
        float z = input_k[i] - target_k[i];
        buffer[threadIdx.x] += z * z;
    }
    __syncthreads();

    // Reduction using first thread
    if (threadIdx.x == 0)
    {
        float sum = 0.0f;
        for (int i = 0; i < blockDim.x; i++)
        {
            sum += buffer[i];
        }
        // Option to average over dimensions
        if (sizeAverage)
            sum /= dim;

        // Assign to global memory output location of block
        atomicAdd(output, sum);
    }
}