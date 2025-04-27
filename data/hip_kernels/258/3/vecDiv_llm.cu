#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecDiv(float* __restrict__ a, float* __restrict__ b, float* __restrict__ c, const int N) {
    // Use shared memory for faster access
    extern __shared__ float shared_b[];
    const int tid = threadIdx.x;
    const int i = blockIdx.x * blockDim.x + tid;

    if (i < N) {
        shared_b[tid] = b[i];  // Load b into shared memory
        __syncthreads();

        // Use shared memory for faster division
        c[i] = __fdividef(a[i], shared_b[tid]);
    }
}