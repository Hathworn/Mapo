#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_update( float4* d_positions, float4* d_og_positions, float4* d_velocities, float* d_masses, size_t numel) {
    // Calculate the global index of the thread
    size_t col = threadIdx.x + blockIdx.x * blockDim.x;
    if (col >= numel) return;

    // Load velocity once to avoid redundant reads
    float4 velocity = d_velocities[col];

    // Use squared magnitude directly for optimization
    float mag = sqrtf(velocity.x * velocity.x + velocity.y * velocity.y) * 0.03f;

    // Use fminf for better performance on float data
    float pos = fminf(mag, 0.50f);

    // Directly assign the new position values
    d_positions[col] = make_float4(
        d_og_positions[col].x,
        d_og_positions[col].y,
        pos,
        0.0f
    );
}