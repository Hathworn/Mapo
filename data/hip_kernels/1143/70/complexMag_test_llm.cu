#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double complexMagnitude(double2 in) {
    return sqrt(in.x * in.x + in.y * in.y);
}

__global__ void complexMag_test(double2 *in, double *out) {
    // Use block and thread indices for efficient parallel processing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that only valid indices process data
    if (idx < 1) {
        out[idx] = complexMagnitude(in[idx]);
    }
}