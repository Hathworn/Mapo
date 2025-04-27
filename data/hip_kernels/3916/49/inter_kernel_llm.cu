#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT) {
    // Calculate the global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate additional offset based on 2D grid
    int offset = (blockIdx.y * gridDim.x) * blockDim.x;
    
    // Combine offsets to get true global index
    i += offset;

    // Avoid out-of-bounds memory access
    if (i < (NX + NY) * B) {
        int b = i / (NX + NY);  // Batch index
        int j = i % (NX + NY);  // Index within batch

        // Determine source array and index; fetch data accordingly
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}