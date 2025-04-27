#include "hip/hip_runtime.h"
#include "includes.h"

#define tam 1.0
#define dx 0.00001
#define dt 0.000001
#define T 0.01
#define kappa 0.000045

__global__ void Maximo(double *input, double *results, int n) {
    extern __shared__ double sdata[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int tx = threadIdx.x;

    // Initialize shared memory with zeros
    sdata[tx] = 0.0;
    
    // Load data into shared memory only if the index is valid
    if (idx < n) {
        sdata[tx] = input[idx];
    }
    __syncthreads();

    // Efficient reduction in shared memory
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tx < offset && idx + offset < n) {
            if (sdata[tx] < sdata[tx + offset]) {
                sdata[tx] = sdata[tx + offset];
            }
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tx == 0) {
        results[blockIdx.x] = sdata[0];
    }
}