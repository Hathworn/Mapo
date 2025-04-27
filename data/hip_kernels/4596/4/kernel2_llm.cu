#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel2(int* D, int* q, int b) {
    // Pre-calculate index using block and thread dimensions for efficiency
    int i = (blockIdx.y == 0) ? ((blockIdx.x >= b) ? (blockIdx.x + 1) * blockDim.x + threadIdx.x : blockIdx.x * blockDim.x + threadIdx.x) 
                              : b * blockDim.y + threadIdx.y;
    int j = (blockIdx.y == 0) ? b * blockDim.y + threadIdx.y 
                              : ((blockIdx.x >= b) ? (blockIdx.x + 1) * blockDim.x + threadIdx.x : blockIdx.x * blockDim.x + threadIdx.x);

    float d, f, e;
    // Avoid global memory access for unchanged data by prefetching inside loop
    for(int k = b * THR_PER_BL; k < (b + 1) * THR_PER_BL; k++) {
        d = D[i * N + j];
        f = D[i * N + k];
        e = D[k * N + j];

        __syncthreads(); // Ensure all threads have fetched these values

        if(d > f + e) {
            D[i * N + j] = f + e; // Update only if condition is met
            q[i * N + j] = k;     // Update path with current k
        }
    }
}