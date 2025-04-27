#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int ndim, int sizeAverage, int ntarget) {
    __shared__ float shInputs[NTHREADS];

    int tid = threadIdx.x;
    shInputs[tid] = 0.0f;

    // Unrolling loops can be beneficial here
    for (int i = tid; i < nframe; i += NTHREADS) {
        for (int j = 0; j < ntarget; ++j) {
            int t = (int)target[i * ntarget + j] - 1;
            if (t >= 0) {
                // Fetch input once to reduce global memory access
                float val = input[i * ndim + t];
                shInputs[tid] += val;
            }
        }
    }
    __syncthreads();

    // Reduction step - All threads contribute their partial sums
    if (tid == 0) {
        float sum = 0.0f;
        for (int i = 0; i < NTHREADS; ++i) {
            sum += shInputs[i];
        }
        if (sizeAverage)
            sum /= nframe;
        *output = -sum;
    }
}