#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scatterSum(int N, float *input, float *output){
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread index is within bounds
    if(i < N) {
        // Unroll the loop for potential optimization
        for(int j=0; j<N; j+=4){
            // Atomic operations for updating output to prevent race conditions
            atomicAdd(output+j, input[i]);
            if (j+1 < N) atomicAdd(output+j+1, input[i]);
            if (j+2 < N) atomicAdd(output+j+2, input[i]);
            if (j+3 < N) atomicAdd(output+j+3, input[i]);
        }
    }
}