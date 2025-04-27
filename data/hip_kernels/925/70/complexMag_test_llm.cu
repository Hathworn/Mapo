#include "hip/hip_runtime.h"
#include "includes.h"

// Calculate the magnitude of a complex number
__device__ double complexMagnitude(double2 in) {
    return sqrt(in.x*in.x + in.y*in.y);
}

// Using grid-stride loop for improved parallelism and efficiency
__global__ void complexMag_test(double2 *in, double *out) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    for (int i = idx; i < N; i += stride) {
        out[i] = complexMagnitude(in[i]);
    }
}