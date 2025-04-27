#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MultiMarginCriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, int nframe, int dim, int sizeaverage)
{
    __shared__ float buffer[MULTIMARGIN_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k*dim;
    float *gradInput_k = gradInput + k*dim;
    int target_k = ((int)target[k])-1;
    float input_target_k = input_k[target_k];
    float g = (sizeaverage ? 1.f/((float)dim) : 1.f);

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    buffer[threadIdx.x] = 0;
    for (int i=i_start; i<i_end; i+=i_step)
    {
        float z = 1.f - input_target_k + input_k[i]; // Use 1.f for float arithmetic
        if(i == target_k)
            continue;

        if(z > 0.f) // Use 0.f for float arithmetic
        {
            buffer[threadIdx.x] -= g;
            gradInput_k[i] = g;
        }
        else
            gradInput_k[i] = 0.f; // Use 0.f for float arithmetic
    }

    __syncthreads();

    // Use a single atomic addition for reduction
    float gradInput_target_k = 0.f;
    if (threadIdx.x == 0) 
    {
        for (int i=0; i<blockDim.x; i++) 
            atomicAdd(&gradInput_target_k, buffer[i]);
            
        gradInput_k[target_k] = gradInput_target_k;
    }
}