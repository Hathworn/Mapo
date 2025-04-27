#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLowerBound(float* mat1, float* mat2, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Utilize shared memory to reduce global memory accesses
    __shared__ float s_mat1[256];
    __shared__ float s_mat2[256];
    for (unsigned int i = idx; i < len; i += stride) {
        s_mat1[threadIdx.x] = mat1[i];
        s_mat2[threadIdx.x] = mat2[i];
        __syncthreads(); // Ensure all threads have loaded their elements

        // Compute target using shared memory
        target[i] = s_mat1[threadIdx.x] < s_mat2[threadIdx.x] ? s_mat2[threadIdx.x] : s_mat1[threadIdx.x];
        __syncthreads(); // Ensure computation is complete before next iteration
    }
}