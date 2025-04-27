#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelMissingDetection(int nVerts, int *cactive, int *cvertarr) {
    // Calculate unique global index for each thread
    int x = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check for missing sites with boundary check in a single line
    if (x < nVerts) cactive[x] = (cvertarr[x] < 0) ? 0 : cactive[x];
}