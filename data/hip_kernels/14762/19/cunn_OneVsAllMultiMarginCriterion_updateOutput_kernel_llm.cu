#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_OneVsAllMultiMarginCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int dim, int sizeaverage, float *positiveWeight)
{
    __shared__ float buffer[MULTIMARGIN_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k * dim;
    float *output_k = output + k;
    int target_k = ((int)target[k])-1;

    float threadSum = 0.0f;
    for(int i = threadIdx.x; i < dim; i += blockDim.x) // Use single loop for initialization and calculation
    {
        float y = (i == target_k) ? 1.0f : -1.0f; // Precompute y once per iteration
        float z = 1.0f - input_k[i] * y;
        if(z > 0.0f)
        {
            float weight = (i == target_k) ? positiveWeight[i] : 1.0f;
            threadSum += z * weight;
        }
    }
    buffer[threadIdx.x] = threadSum;
    __syncthreads();
    
    // Reduce with stride loop
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (threadIdx.x < stride)
        {
            buffer[threadIdx.x] += buffer[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0)
    {
        if(sizeaverage)
            *output_k = buffer[0] / dim;
        else
            *output_k = buffer[0];
    }
}