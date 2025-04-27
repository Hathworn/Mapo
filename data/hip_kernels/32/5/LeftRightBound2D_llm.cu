#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LeftRightBound2D(double *Hs, double *Ztopo, double *K2e, double *K2w, int BC2D, int M, int N) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Precompute the stride to optimize access
    while (tid < M) {
        int tidN = tid * N;  // Precompute to optimize repeated memory access
        // no-flow BCs
        if (BC2D == 0) {
            Hs[tidN] = Hs[tidN + 1];
            Hs[tidN + N - 1] = Hs[tidN + N - 2];
        } else {  // Critical depth flow BCs
            Hs[tidN] = hcri + Ztopo[tidN];
            Hs[tidN + N - 1] = hcri + Ztopo[tidN + N - 1];
        }
        
        K2w[tidN] = K2w[tidN + 1];
        K2e[tidN + N - 1] = K2e[tidN + N - 2];
        tid += stride;  // Use precomputed stride
    }
}