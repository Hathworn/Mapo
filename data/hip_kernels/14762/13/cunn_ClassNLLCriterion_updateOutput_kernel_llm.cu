#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateOutput_kernel(float *output, float *input, float *target, int nframe, int ndim, int sizeAverage, int ntarget) {
    // Allocate shared memory for partial results
    __shared__ float shInputs[NTHREADS];
    
    // Current thread index
    int tid = threadIdx.x;
    
    // Initialize shared memory for this thread
    shInputs[tid] = 0.0f;

    // Loop over nframe with stride equal to block size to allow more threads to compute
    for (int i = tid; i < nframe; i += blockDim.x) {
        for (int j = 0; j < ntarget; ++j) {
            int t = static_cast<int>(target[i * ntarget + j]) - 1;  // Convert to zero-based index
            if (t >= 0) {
                shInputs[tid] += input[i * ndim + t];
            }
        }
    }

    // Synchronize to ensure all threads have computed their contributions
    __syncthreads();

    // Reduction step to sum all contributions in shared memory
    if (tid == 0) {
        // Initialize output
        float output_val = 0.0f;
        for (int i = 0; i < NTHREADS; ++i) {
            output_val += shInputs[i];
        }
        // Average if needed
        if (sizeAverage) {
            output_val /= nframe;
        }
        // Negate result as per original kernel logic
        *output = -output_val;
    }
}