#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_repmat(const float *a, float* dst, const int rowsa, const int colsa, const int rowsdst, const int colsdst, const int n) {
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Process multiple elements per thread
    for (int index = tid; index < n; index += blockDim.x * gridDim.x) {
        // Compute row and column mappings
        int c2 = index % colsdst;
        int r2 = index / colsdst;
        int ra = r2 % rowsa;
        int ca = c2 % colsa;
        // Perform the assignment
        dst[index] = a[ra * colsa + ca];
    }
}