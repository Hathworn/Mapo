```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void is_nan_or_inf_kernel(float *input, size_t size, int *pinned_return)
{
    // Using shared memory for reduction
    extern __shared__ int smem[];
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int tid = threadIdx.x;

    // Initialize shared memory
    smem[tid] = 0;

    // Check for NaN or Inf and store result
    if (index < size) {
        float val = input[index];
        if (isnan(val) || isinf(val)) {
            smem[tid] = 1;
        }
    }

    // Reduce in shared memory
    __syncthreads();
    if (tid == 0) {
        for (int i = 1; i < blockDim.x; ++i) {
            smem[0] |= smem[i];
        }
        
        // Use atomic operation to update global result
        if (smem[0]) {
            atomicOr(pinned_return, 1);
        }
    }
}