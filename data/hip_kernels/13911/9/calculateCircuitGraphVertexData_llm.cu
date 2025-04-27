#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateCircuitGraphVertexData(unsigned int *D, unsigned int *C, unsigned int ecount) {
    // Calculate global thread index
    unsigned int tid = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    
    if (tid < ecount) {
        unsigned int c = D[tid];
        // Use atomic operation to update C array
        atomicExch(&C[c], 1);
    }
}