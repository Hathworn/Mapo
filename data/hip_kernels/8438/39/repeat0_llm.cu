#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repeat0(float* in, float* out, int outStride0, int outStride1, int outScalarCount) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the total number of threads
    int stride = gridDim.x * blockDim.x;
    
    // Use shared memory to optimize repeated global memory access
    __shared__ int shared_outStride0;
    __shared__ int shared_outStride1;
    
    // Load values into shared memory
    if (threadIdx.x == 0) {
        shared_outStride0 = outStride0;
        shared_outStride1 = outStride1;
    }
    __syncthreads();

    // Iterate over output scalars and compute input indices
    for (; tid < outScalarCount; tid += stride) {
        int linearIndex = tid;
        int outIndex0 = linearIndex / shared_outStride0;
        linearIndex = linearIndex - outIndex0 * shared_outStride0;
        int outIndex1 = linearIndex / shared_outStride1;
        int outIndex2 = linearIndex - outIndex1 * shared_outStride1;
        int inIndex = outIndex2 + (outIndex0 + outIndex1) * shared_outStride1;
        // Copy input data to output
        out[tid] = in[inIndex];
    }
}