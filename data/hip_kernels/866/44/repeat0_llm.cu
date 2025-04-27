#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repeat0(float* __restrict__ in, float* __restrict__ out, int outStride0, int outStride1, int outScalarCount) {
    // Use shared memory to reduce global memory access latency
    extern __shared__ float sharedIn[];
    
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Each thread loads data into shared memory
    if (threadIdx.x < outScalarCount) {
        sharedIn[threadIdx.x] = in[threadIdx.x];
    }
    __syncthreads();

    for (; tid < outScalarCount; tid += stride) {
        int linearIndex = tid;
        int outIndex0 = linearIndex / outStride0;
        linearIndex = linearIndex - outIndex0 * outStride0;
        int outIndex1 = linearIndex / outStride1;
        int outIndex2 = linearIndex - outIndex1 * outStride1;
        
        // Use shared memory in place of global memory access
        int inIndex = outIndex2 + (outIndex0 + outIndex1) * outStride1;
        out[tid] = sharedIn[inIndex];
    }
}