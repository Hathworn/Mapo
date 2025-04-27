#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k5(int *Aux, int *S) {
    int tid = threadIdx.x;
    if(tid == 0) return;
    // Use shared memory for coalesced access
    __shared__ int sharedAux[B];
    sharedAux[tid] = Aux[tid];
    __syncthreads();
    
    S[(tid + 1) * B - 1] = sharedAux[tid];  // Improve access pattern
}