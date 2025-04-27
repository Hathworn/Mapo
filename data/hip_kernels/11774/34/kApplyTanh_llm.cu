#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kApplyTanh(float* mat, float* target, unsigned int len) {
    // Use shared memory to optimize memory access
    extern __shared__ float shared_mat[];
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < len; i += numThreads) {
        // Load data into shared memory for coalesced access
        shared_mat[threadIdx.x] = mat[i];
        __syncthreads();

        // Compute Tanh using shared memory data
        float mat_i = shared_mat[threadIdx.x];
        float exp2x = __expf(2 * mat_i);
        target[i] = 1 - 2 / (exp2x + 1);
        
        __syncthreads();
    }
}