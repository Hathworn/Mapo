#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LeftRightBound2D(double *Hs, double *Ztopo, double *K2e, double *K2w, int BC2D, int M, int N) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    while (tid < M) {
        int baseIndex = tid * N;
        int lastIndex = (tid + 1) * N - 1;
        
        // Apply boundary conditions based on BC2D value
        if (BC2D == 0) { // No-flow BCs
            Hs[baseIndex] = Hs[baseIndex + 1];
            Hs[lastIndex] = Hs[lastIndex - 1];
        } else { // Critical depth flow BCs
            Hs[baseIndex] = hcri + Ztopo[baseIndex];
            Hs[lastIndex] = hcri + Ztopo[lastIndex];
        }
        
        // Update K2w and K2e arrays
        K2w[baseIndex] = K2w[baseIndex + 1];
        K2e[lastIndex] = K2e[lastIndex - 2];
        
        tid += stride; // Move to next element in strides
    }
}