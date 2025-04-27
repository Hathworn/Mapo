#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel to handle larger workloads
__global__ void k2_mul(float *data, float val) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx < N) { // Use a boundary check (assuming N is defined elsewhere as data size)
        data[idx] *= val;
    }
}