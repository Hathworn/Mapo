#include "hip/hip_runtime.h"
#include "includes.h"
#define MSECRITERION_THREADS 1024

__global__ void cunn_MSECriterion_updateOutput_kernel(float* output, float *input, float *target, int nframe, int dim, int sizeAverage)
{
    __shared__ float buffer[MSECRITERION_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Parallelized mse calculation with buffer accumulation
    float sum = 0.0f;
    for (int i = i_start; i < i_end; i += i_step)
    {
        float z = input_k[i] - target_k[i];
        sum += z * z;
    }
    buffer[threadIdx.x] = sum;
    __syncthreads();

    // Efficient reduction using shared memory
    if (threadIdx.x == 0)
    {
        float blockSum = 0.0f;
        for (int i = 0; i < blockDim.x; i++)
        {
            blockSum += buffer[i];
        }
        if (sizeAverage)
        {
            blockSum /= dim;
        }
        atomicAdd(output, blockSum); // Use atomicAdd for thread-safe accumulation
    }
}