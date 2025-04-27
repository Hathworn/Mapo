#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int ndim, int sizeAverage, int ntarget) {
    __shared__ float shInputs[NTHREADS];

    // Load shared memory to avoid frequent global memory access
    shInputs[threadIdx.x] = 0.0f;
    __syncthreads();

    float partialSum = 0.0f;
    for (int i = threadIdx.x; i < nframe; i += NTHREADS) {
        for (int j = 0; j < ntarget; ++j) {
            int t = static_cast<int>(target[i * ntarget + j]) - 1;
            if (t >= 0) {
                partialSum += input[i * ndim + t];
            }
        }
    }
    
    // Reduce across threads in a block
    shInputs[threadIdx.x] = partialSum;
    __syncthreads();

    // Perform block-level reduction
    if (threadIdx.x < 32) {
        for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            shInputs[threadIdx.x] += __shfl_down_sync(0xffffffff, shInputs[threadIdx.x], offset);
        }
    }

    // Final reduction and write to output by the first thread
    if (threadIdx.x == 0) {
        *output = shInputs[0];
        if (sizeAverage) {
            *output /= nframe;
        }
        *output = -(*output);
    }
}