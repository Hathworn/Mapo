#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __initSeq2(int *A, int nrows, int ncols) {
    int idx = blockIdx.x + gridDim.x * blockIdx.y; // 2D block index
    int tid = threadIdx.x; // Thread index within a block
    int blockSize = blockDim.x * gridDim.x * gridDim.y; // Total threads
    int i = tid + blockDim.x * idx; // Linear index

    // Unroll loop for better performance
    int stride = blockSize;
    while (i < nrows * ncols) {
        A[i] = i / nrows;
        i += stride;
    }
}