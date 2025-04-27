#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized to support parallelism and more efficient memory access
__global__ void getValue(float *outdata, float *indata) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global index
    if (idx < 1) {  // Boundary check for the array size
        outdata[idx] = indata[idx] + 3.0f;
    }
}