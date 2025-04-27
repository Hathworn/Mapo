#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_optimized(float* softmaxP, float* b, int rows, int cols){
    int tid = threadIdx.x;
    int bid = blockIdx.x;

    __shared__ float shared_max;
    __shared__ float shared_sum;

    if(tid < rows){
        // Initialize shared variables for reduction operations
        shared_max = -100000000.0f;
        shared_sum = 0.0f;
        __syncthreads();

        // Calculate max value using a block-wide reduction
        atomicMax(&shared_max, b[tid * cols + bid]);
        __syncthreads();

        // Compute softmaxP using the max value
        float val = b[tid * cols + bid] - shared_max;
        val = __expf(val);

        // Accumulate the sum in shared memory
        atomicAdd(&shared_sum, val);
        __syncthreads();

        // Normalize the probabilities
        if (shared_sum > 0.0f) {
            softmaxP[tid * cols + bid] = val / shared_sum;
        }
    }
}