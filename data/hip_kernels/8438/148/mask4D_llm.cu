#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use while loop for potential better optimization by certain compilers
    while (tid < scalarCount) {
        int linearIndex = tid;
        int xindex0 = linearIndex / xstrides0;
        linearIndex = linearIndex % xstrides0; // Use modulo operator for clearer intent
        int xindex1 = linearIndex / xstrides1;
        linearIndex = linearIndex % xstrides1; // Use modulo operator for clearer intent
        int xindex2 = linearIndex / xstrides2;
        int xindex3 = linearIndex % xstrides2; // Use modulo operator for clearer intent
        
        // Use temporary variable to reduce repeated memory access
        int mask_val = mask[xindex0];
        if (xindex3 >= mask_val) {
            in[tid] = 0;
        }
        
        tid += stride;
    }
}