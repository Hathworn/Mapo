#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        int idx1 = (idx + 1) & 255;  // use bitwise AND for modulo operation
        int idx2 = (idx + 2) & 255;  // use bitwise AND for modulo operation
        float as = (a[idx] + a[idx1] + a[idx2]) / 3.0f;
        float bs = (b[idx] + b[idx1] + b[idx2]) / 3.0f;
        c[idx] = static_cast<int>((as + bs) * 0.5f);  // use static_cast and multiply by 0.5
    }
}