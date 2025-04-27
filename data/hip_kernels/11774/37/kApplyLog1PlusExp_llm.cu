#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyLog1PlusExp(float* mat, float* target, unsigned int len) {
    extern __shared__ float sharedMem[]; // Use shared memory for efficient access
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    for (unsigned int i = idx; i < len; i += numThreads) {
        sharedMem[threadIdx.x] = mat[i]; // Cache data in shared memory
        float mat_i = sharedMem[threadIdx.x];
        // Simplify branching and use intrinsic logf and expf
        float exp_val = __expf(mat_i > 0 ? -mat_i : mat_i);
        target[i] = __logf(1 + exp_val) + (mat_i > 0 ? mat_i : 0);
    }
}