#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void back_prop_kernel_batch(float *device_output, float *inP, float *m_hidden, float* weights_2, float* o_errG, int nInput, int nHidden, int nOutput, float l_R, int batchSize)
{
    int linearThreadIndex = threadIdx.x;
    int unit = blockIdx.x % nHidden;
    int batch = blockIdx.x / nHidden;

    __shared__ float weightedSum;

    if (linearThreadIndex == 0 && unit < nHidden) {
        float sum = 0.0f;  // Initialize local sum
        for (int i = 0; i < nOutput; i++) {
            sum += weights_2[unit * nOutput + i] * o_errG[batch * (nOutput + 1) + i];
        }
        weightedSum = sum;  // Update shared memory with local sum
    }

    __syncthreads();

    if (linearThreadIndex < nInput) {
        float m_hidden_val = m_hidden[batch * (nHidden + 1) + unit];
        temp = l_R * inP[batch * (nInput + 1) + linearThreadIndex] * m_hidden_val * (1 - m_hidden_val) * weightedSum;

        atomicAdd(&device_output[linearThreadIndex * nHidden + unit], temp);
    }
}