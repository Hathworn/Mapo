#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void main_set(float *data, float val) {
    // Calculate global index to handle larger arrays
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Assign value if within bounds (assuming proper data length allocation)
    data[idx] = val;
}