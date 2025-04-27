#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Use shared memory to optimize the access
        __shared__ float shared_a[256];
        __shared__ float shared_b[256];

        int localIdx = threadIdx.x;
        shared_a[localIdx] = a[idx];
        shared_b[localIdx] = b[idx];
        __syncthreads();

        int idx1 = (localIdx + 1) % 256;
        int idx2 = (localIdx + 2) % 256;

        float as = (shared_a[localIdx] + shared_a[idx1] + shared_a[idx2]) / 3.0f;
        float bs = (shared_b[localIdx] + shared_b[idx1] + shared_b[idx2]) / 3.0f;
        c[idx] = (as + bs) / 2;
    }
}