```c
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

    // Initialize shared memory
    buffer[threadIdx.x] = 0;

    // Accumulate mean square error in shared memory buffer
    for (int i = i_start; i < i_end; i += i_step) {
        float z = input_k[i] - target_k[i];
        buffer[threadIdx.x] += z * z;
    }
    __syncthreads();

    // Reduce the buffer efficiently
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            buffer[threadIdx.x] += buffer[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write output by the first thread in block
    if (threadIdx.x == 0) {
        float mse = buffer[0];
        if (sizeAverage) {
            mse /= dim;
        }
        atomicAdd(output, mse);  // Ensure safe updating of the output
    }
}
```
