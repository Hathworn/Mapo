#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int totalElements = (NX + NY) * B;
    
    // Ensure the index is within bounds
    if (i >= totalElements) return;

    int b = i / (NX + NY); // Batch index
    int j = i % (NX + NY); // Element index within batch

    if (j < NX) {
        if (X) atomicAdd(&X[b * NX + j], OUT[i]); // Use atomic add to avoid race conditions
    } else {
        if (Y) atomicAdd(&Y[b * NY + j - NX], OUT[i]); // Use atomic add to avoid race conditions
    }
}
```
