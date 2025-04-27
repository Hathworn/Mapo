#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateOutput_kernel(float* output, float *input, float *target, int nframe, int dim, int sizeAverage)
{
    __shared__ float buffer[MSECRITERION_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    int i_start = threadIdx.x;
    int i_step = blockDim.x;

    // Initialize buffer to 0
    buffer[threadIdx.x] = 0.0f;
    for (int i = i_start; i < dim; i += i_step)
    {
        float z = input_k[i] - target_k[i];
        buffer[threadIdx.x] += z * z;
    }
    __syncthreads();

    // Improve reduction using parallel reduction within shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (threadIdx.x < s)
        {
            buffer[threadIdx.x] += buffer[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Write result to output
    if (threadIdx.x == 0)
    {
        *output = buffer[0];
        if (sizeAverage)
            *output /= dim;
    }
}