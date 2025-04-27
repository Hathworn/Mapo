#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void repeat0(float* in, float* out, int outStride0, int outStride1, int outScalarCount) {
    // Optimize kernel by using shared memory and loop unrolling
    extern __shared__ float sharedMem[];

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Load data into shared memory
    if (tid < outScalarCount) {
        sharedMem[threadIdx.x] = in[tid];
    }
    __syncthreads();

    for (; tid < outScalarCount; tid += stride) {
        int linearIndex = tid;
        int outIndex0 = linearIndex / outStride0;
        linearIndex -= outIndex0 * outStride0;
        int outIndex1 = linearIndex / outStride1;
        int outIndex2 = linearIndex - outIndex1 * outStride1;
        int inIndex = outIndex2 + (outIndex0 + outIndex1) * outStride1;
        out[tid] = sharedMem[inIndex]; // Using shared memory
    }
}