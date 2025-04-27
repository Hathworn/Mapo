#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kPow(float* __restrict__ mat, float pow, float* __restrict__ target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;  // Use 'stride' instead of 'numThreads'

    // Use shared memory for more efficient memory access
    extern __shared__ float sharedMat[];
    sharedMat[threadIdx.x] = mat[idx];
    __syncthreads();

    for (unsigned int i = idx; i < len; i += stride) {
        target[i] = powf(sharedMat[threadIdx.x], pow);  // Compute using shared memory
    }
}