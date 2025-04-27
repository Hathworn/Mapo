#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constructCircuitGraphVertex(unsigned int * C, unsigned int * offset, unsigned int ecount, unsigned int * cv, unsigned int cvCount) {
    // Calculate global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use vectorized access for speedup
    const unsigned int stride = blockDim.x * gridDim.x;
    for(unsigned int i = tid; i < ecount; i += stride){
        if(C[i] != 0){
            cv[offset[i]] = i;
        }
    }
}