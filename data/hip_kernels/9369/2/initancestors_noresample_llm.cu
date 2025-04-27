#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initancestors_noresample(int *ancestor, int np) {
    int ii = threadIdx.x + blockIdx.x * blockDim.x;  // Correct thread index calculation using blockDim
    int stride = blockDim.x * gridDim.x;             // Compute stride for the grid
    for(; ii < np; ii += stride) {                   // Use a for-loop with calculated stride
        ancestor[ii] = ii;                           // Assign current index to ancestor array
    }
}