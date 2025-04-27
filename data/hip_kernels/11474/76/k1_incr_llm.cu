#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k1_incr(float *data, float val) {
    // Calculate global thread index for 1D grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    // Safeguard against accessing memory out of bounds
    if (idx < N) { // Assume N is the size of data defined elsewhere
        data[idx] += val;
    }
}