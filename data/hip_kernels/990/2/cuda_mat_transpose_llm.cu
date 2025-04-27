#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_mat_transpose(const double* __restrict__ src, double* __restrict__ dst, int colssrc, int colsdst, int n) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;

    // Loop handling using stride
    for (int idx = tid; idx < n; idx += total_threads) {
        // Calculate row and column indices for source and destination
        int cdst = idx % colsdst;
        int rdst = idx / colsdst;
        int rsrc = cdst;
        int csrc = rdst;
        
        // Perform matrix transpose
        dst[idx] = src[rsrc * colssrc + csrc];
    }
}