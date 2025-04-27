#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void back_prop_kernel(float *device_output, float *inP, float *m_hidden, float* weights_2, float* o_errG, int nInput, int nHidden, int nOutput, float l_R)
{
    int linearThreadIndex = threadIdx.x;
    int unit = blockIdx.x;

    // Use shared memory for weightedSum to improve access speed
    __shared__ float weightedSum;

    // Initialize shared memory
    if (linearThreadIndex == 0) {
        weightedSum = 0.0f;
    }
    __syncthreads();

    // Calculate weightedSum using all threads in the block
    for (int i = linearThreadIndex; i < nOutput; i += blockDim.x) {
        atomicAdd(&weightedSum, weights_2[unit * nOutput + i] * o_errG[i]);
    }
    __syncthreads();

    // Update only relevant device_output entries
    if (linearThreadIndex < nInput) {
        device_output[linearThreadIndex * nHidden + unit] = l_R * inP[linearThreadIndex] * m_hidden[unit] * (1 - m_hidden[unit]) * weightedSum;
    }
}