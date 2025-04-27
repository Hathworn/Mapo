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

    // Initialize shared memory buffer
    buffer[threadIdx.x] = 0;

    // Efficient overlap of computation by each thread
    for (int i = i_start; i < i_end; i += i_step)
    {
        float z = input_k[i] - target_k[i];
        buffer[threadIdx.x] += z * z;
    }
    __syncthreads();

    // Parallel reduction for buffer elements
    int tid = threadIdx.x;
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if (tid < offset) // Avoid race conditions
        {
            buffer[tid] += buffer[tid + offset];
        }
        __syncthreads();
    }

    // Final write-back by the first thread
    if (tid == 0)
    {
        *output = buffer[0];
        if (sizeAverage)
            *output /= dim;
    }
}