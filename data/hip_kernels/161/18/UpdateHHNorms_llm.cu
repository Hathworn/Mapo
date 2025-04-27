#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void UpdateHHNorms(int cols, float *dV, float *dNorms) {
    int colIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (colIndex < cols) {
        // Use shared memory for better performance if possible
        float val = dV[colIndex];
        // Direct computation for norm update
        atomicAdd(&dNorms[colIndex], -val * val);
    }
}