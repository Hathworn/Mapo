#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __full(int *ir, int *ic, float *data, float *od, int nrows, int ncols, int nnz) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use id and stride to allow multiple iterations by the same thread
    for (int i = id; i < nnz; i += stride) {
        int row = ir[i]; // Cache ir[] in register
        int col = ic[i]; // Cache ic[] in register
        float v = data[i]; // Cache data[] in register
        od[row + col * nrows] = v; // Directly assign to output
    }
}