```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void lineSpace (const int d, const int n, const float *l, const float *h, float *b) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Calculate delta only once per thread block
    __shared__ float sharedDelta[256]; // Assuming max 256 threads per block for simplicity
    if (j == 0 && i < d) {
        sharedDelta[threadIdx.x] = (h[i] - l[i]) / (n - 1);
    }
    __syncthreads(); // Wait for all threads to load delta

    if (i < d && j < n) {
        b[i + j * d] = l[i] + j * sharedDelta[threadIdx.x];
    }
}