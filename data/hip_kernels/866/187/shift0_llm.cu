#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use a single loop and eliminate redundant calculations
    while (tid < inScalarCount) {
        int inIndex0 = tid / inStride0;
        int inIndex1 = (tid % inStride0) / inStride1;
        
        if (inIndex0 + inIndex1 < inDim0) {
            // Ensure only valid indices are processed
            out[tid + inIndex1 * inStride0] = in[tid];
        }
        
        tid += stride; // Increment tid by stride for next iteration
    }
}