#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int ndim, int sizeAverage, int ntarget) {
    // Using shared memory and loop unrolling for optimization
    __shared__ float shInputs[NTHREADS]; 
    int idx = threadIdx.x;
    float sum = 0.0f;

    for (int i = idx; i < nframe; i += NTHREADS) {
        #pragma unroll // Unrolling for efficiency
        for (int j = 0; j < ntarget; ++j) {
            int t = static_cast<int>(target[i * ntarget + j]) - 1;
            if (t >= 0) {
                sum += input[i * ndim + t];
            }
        }
    }
    shInputs[idx] = sum;
    __syncthreads();

    if (idx == 0) {
        float total = 0.0f;
        // Unrolling final sum reduction for better performance
        for (int i = 0; i < NTHREADS; ++i) {
            total += shInputs[i];
        }
        if (sizeAverage) {
            total /= nframe;
        }
        *output = -total;
    }
}