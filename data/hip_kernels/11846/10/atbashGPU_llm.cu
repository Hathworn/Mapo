#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void atbashGPU(char const *in, char *out, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < n) {
        // Simplified the reversal logic for clearer intention
        int targetIdx = n - 1 - i; 
        out[targetIdx] = in[i];
    }
}