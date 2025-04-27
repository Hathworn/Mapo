#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void k2_mul(float *data, float val) {
// Use blockDim.x for better occupancy and handling larger data sizes
int idx = blockIdx.x * blockDim.x + threadIdx.x;
if (idx < N) { // Ensure thread doesn't access out-of-bounds
    data[idx] *= val;
}
}