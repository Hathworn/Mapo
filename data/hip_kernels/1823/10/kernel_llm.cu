#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Pre-compute mod values for reuse
        int idx1 = idx + 1;
        int idx2 = idx + 2;
        float as = (a[idx] + a[idx1] + a[idx2]) / 3.0f;
        float bs = (b[idx] + b[idx1] + b[idx2]) / 3.0f;
        c[idx] = (as + bs) * 0.5f; // Use multiplication instead of division for efficiency
    }
}