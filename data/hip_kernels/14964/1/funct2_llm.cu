#include "hip/hip_runtime.h"
#include "includes.h"

#define inf 9999

__global__ void funct2(int n, int k, float* x, int* qx) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds
    if (ix < n * n) {
        int j = ix & (n - 1);

        // Use shared memory to reduce global memory access (assuming n is not too large)
        extern __shared__ float shmem[];
        float* sh_x = shmem;
        sh_x[threadIdx.x] = x[ix - j + k];

        __syncthreads();

        float temp2 = sh_x[threadIdx.x] + x[k * n + j];

        if (x[ix] > temp2) {
            x[ix] = temp2;
            qx[ix] = k;
        }
    }
}