#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mul(float *A, float *B, float *C, int nx, int ny){
    // Compute ix and iy once and reuse
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    // Optimize condition check for valid index
    if (ix < nx && iy < ny) {
        int idx = ix * ny + iy;
        // Perform multiplication only for valid elements
        C[idx] = A[idx] * B[idx];
    }
}
```
