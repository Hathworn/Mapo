#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using shared memory
__global__ void kApplyLog1PlusExp(float* mat, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    __shared__ float sharedMat[256]; // Adjust size according to blockDim.x if necessary

    for (unsigned int i = idx; i < len; i += stride) {
        sharedMat[threadIdx.x] = mat[i]; // Load data into shared memory
        __syncthreads(); // Ensure all threads have loaded their data

        float mat_i = sharedMat[threadIdx.x]; // Read from shared memory
        if (mat_i > 0)
            target[i] = (__logf(1 + __expf(-mat_i)) + mat_i);
        else
            target[i] = __logf(1 + __expf(mat_i));

        __syncthreads(); // Ensure results are computed before next iteration
    }
}