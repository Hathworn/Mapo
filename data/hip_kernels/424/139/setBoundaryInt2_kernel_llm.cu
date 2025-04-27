#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setBoundaryInt2_kernel(int* d_boundary, int startPos, int numKey, int rLen, int2* d_boundaryRange) {
    // Assign unique thread identifier
    int pos = startPos + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y) + threadIdx.x + threadIdx.y * blockDim.x;

    // Check if the position is within the range
    if (pos < numKey) {
        // Set values for boundary range
        d_boundaryRange[pos] = make_int2(d_boundary[pos], (pos + 1 < numKey) ? d_boundary[pos + 1] : rLen);
    }
}