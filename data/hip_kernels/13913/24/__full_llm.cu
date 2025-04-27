#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __full(int *ir, int *ic, double *data, double *od, int nrows, int ncols, int nnz) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int totalThreads = blockDim.x * gridDim.x;
    
    // Use stride loop to ensure all non-zero elements are processed efficiently.
    for (int i = id; i < nnz; i += totalThreads) {
        double v = data[i];
        int row = ir[i];
        int col = ic[i];
        od[row + col * nrows] = v;
    }
}