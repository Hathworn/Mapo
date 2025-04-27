#include "hip/hip_runtime.h"
#include "includes.h"

#define BS 256  // Assuming BS was defined somewhere

__global__ void kernel(float *a, size_t N)
{
    int tid = threadIdx.x;
    int blockIdx = hipBlockIdx_x;
    extern __shared__ float s[];

    // Calculate global thread ID and block count 
    int global_id = blockIdx * blockDim.x + tid;
    float local_sum = 0.0f;

    // Process elements within bounds
    for (int i = global_id; i < N; i += gridDim.x * blockDim.x) {
        s[tid] = a[i];
        __syncthreads();

        // Perform reduction
        for (int skip = BS/2; skip > 0; skip >>= 1) {
            if (tid < skip && tid + skip < N) {
                s[tid] += s[tid + skip];
            }
            __syncthreads();
        }

        if (tid == 0) {
            local_sum += s[0];
        }
    }

    // Perform atomic addition to avoid race condition
    if (tid == 0) {
        atomicAdd(&a[0], local_sum);
    }
}