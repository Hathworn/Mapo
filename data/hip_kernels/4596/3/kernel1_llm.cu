```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel1(int* D, int* q, int b) {
    int i = threadIdx.x + b * THR_PER_BL;
    int j = threadIdx.y + b * THR_PER_BL;

    // Use shared memory to reduce global memory accesses
    __shared__ float sharedD[THR_PER_BL][THR_PER_BL];

    float d, f, e;
    d = D[i * N + j];
    
    for (int k = b * THR_PER_BL; k < (b + 1) * THR_PER_BL; k++) {
        // Load data into shared memory
        sharedD[threadIdx.x][threadIdx.y] = D[i * N + k];
        __syncthreads();

        f = sharedD[threadIdx.x][threadIdx.y];
        e = D[k * N + j];

        // Synchronize to ensure all threads have loaded their data
        __syncthreads();

        if (d > f + e) {
            // Perform update in register before writing to global memory
            d = f + e;
            D[i * N + j] = d;
            q[i * N + j] = k;
        }
    }
}