#include "hip/hip_runtime.h"
#include "includes.h"

#define NTHREADS 256  // Define the number of threads for shared memory

__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int ndim, int sizeAverage, int ntarget, float* weights, bool apply_weights) {
    __shared__ float shInputs[NTHREADS];
    int i, j, t;
    
    // Initialize shared memory
    shInputs[threadIdx.x] = 0.0f;

    // Calculate contribution for each thread
    for (i = threadIdx.x; i < nframe; i += blockDim.x) {
        for (j = 0; j < ntarget; ++j) {
            t = static_cast<int>(target[i * ntarget + j]) - 1;
            if (t >= 0) {
                if (apply_weights) {
                    shInputs[threadIdx.x] += (input[i * ndim + t] * weights[t]);
                } else {
                    shInputs[threadIdx.x] += input[i * ndim + t];
                }
            }
        }
    }
    
    __syncthreads();

    // Reduce results from all threads
    if (threadIdx.x == 0) {
        float sum = 0.0f;
        for (i = 0; i < blockDim.x; ++i) {
            sum += shInputs[i];
        }
        if (sizeAverage)
            *output = -(sum / nframe);
        else
            *output = -sum;
    }
}