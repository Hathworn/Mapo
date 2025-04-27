#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kRMSProp(float *history, float *grad, float factor, int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float shared_history[256];  // Use shared memory for better performance
    __shared__ float shared_grad[256];

    const unsigned int local_idx = threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    
    for (unsigned int i = idx; i < len; i += numThreads) {
        if (i < len) {
            shared_history[local_idx] = history[i];  // Load data into shared memory
            shared_grad[local_idx] = grad[i];
            __syncthreads();  // Ensure all threads have loaded their data

            // Perform computation with shared memory
            shared_history[local_idx] = sqrt(factor * shared_history[local_idx] * shared_history[local_idx] + 
                                             (1-factor) * shared_grad[local_idx] * shared_grad[local_idx]);
            __syncthreads();  // Ensure computation is complete before writing back

            history[i] = shared_history[local_idx];  // Write back results to global memory
        }
    }
}
```
