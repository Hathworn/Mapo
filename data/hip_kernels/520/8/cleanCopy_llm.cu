#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cleanCopy(int *S, int *D){
    // Calculate the global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform copy operation only if within array bounds
    if(idx < N) // Assuming N is the size of the array
        D[idx] = S[idx];
}