#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_OneVsAllMultiMarginCriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, int nframe, int dim, int sizeaverage, float *positiveWeight)
{
    int k = blockIdx.x;
    float *input_k = input + k*dim;
    float *gradInput_k = gradInput + k*dim;
    int target_k = ((int)target[k])-1;
    float g = (sizeaverage ? 1./((float)dim) : 1.);

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    for (int i=i_start; i<i_end; i+=i_step)
    {
        float y = (i==target_k) ? 1.0 : -1.0;
        float z = 1 - input_k[i]*y;

        if(z > 0)
        {
            float weight = (i==target_k) ? positiveWeight[i] : 1.0;
            float h =  -y*g*weight;
            gradInput_k[i] = h;
        }
        else
            gradInput_k[i] = 0;
    }
    // No need for __syncthreads() or shared memory, as each thread handles separate segments
}