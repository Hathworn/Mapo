#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scatter_kernel(unsigned int* d_inputVals, unsigned int* d_inputPos, unsigned int* d_outputVals, unsigned int* d_outputPos, unsigned int* cu_outputVals, size_t numElems) {
    // Compute the global thread index
    unsigned int mid = threadIdx.x + blockIdx.x * blockDim.x;

    if (mid < numElems) {
        // Read the target index from cu_outputVals
        unsigned int val = cu_outputVals[mid];

        // Output the result directly without checking the condition again
        d_outputVals[val] = d_inputVals[mid];
        d_outputPos[val] = d_inputPos[mid];
    }
    // __syncthreads() is unnecessary here and can be removed
}