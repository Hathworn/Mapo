#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int ndim, int sizeAverage, int ntarget) {
    extern __shared__ float shInputs[];
    int tid = threadIdx.x;
    int index;
    float localSum = 0.0f;

    // Calculate partial sum for each thread
    for (int i = tid; i < nframe; i += blockDim.x) {
        for (int j = 0; j < ntarget; ++j) {
            index = static_cast<int>(target[i * ntarget + j]) - 1;
            if (index >= 0) {
                localSum += input[i * ndim + index];
            }
        }
    }
    shInputs[tid] = localSum;
    __syncthreads();

    // Reduce partial sums to a single value
    if (tid == 0) {
        float totalSum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            totalSum += shInputs[i];
        }
        if (sizeAverage) {
            totalSum /= nframe;
        }
        *output = -totalSum;
    }
}