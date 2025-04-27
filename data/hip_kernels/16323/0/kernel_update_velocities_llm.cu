#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_update_velocities(float4* d_uv, float4* d_velocities_buffer, int numel) {
    // Calculate global thread index
    size_t col = threadIdx.x + blockIdx.x * blockDim.x;
    // Check if within bounds
    if (col >= numel) { return; }
    
    // Update velocities buffer directly without __syncthreads()
    d_velocities_buffer[col] = make_float4(d_uv[col].x, d_uv[col].y, 0, 0);
}