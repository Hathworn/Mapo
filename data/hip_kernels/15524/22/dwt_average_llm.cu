#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dwt_average(float *d_ip_v, float *d_ip_ir, int app_len) {
    // Calculate index only for threads within bounds
    const int X = blockIdx.x * blockDim.x + threadIdx.x;
    if (X >= app_len) return; // Early exit for threads out of bounds

    // Perform the operation
    d_ip_v[X] = (d_ip_v[X] + d_ip_ir[X]) * 0.5f; // Use multiplication instead of division
}