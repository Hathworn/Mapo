#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using vectorized operations
__global__ void sum(float4 *a, float4 *b, int N) {
    int idx = threadIdx.x + blockDim.x * blockIdx.x;
    if (idx < N) {
        // Use vector addition directly
        a[idx].x += b[idx].x;
        a[idx].y += b[idx].y;
        a[idx].z += b[idx].z;
        a[idx].w += b[idx].w;
    }
}