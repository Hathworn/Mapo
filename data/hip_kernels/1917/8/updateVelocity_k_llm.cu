#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    // Calculate global thread index for x and y directions
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    float scale = 1.f / (dx * dy); // Precompute scale factor once

    // Check bounds in the x direction
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p; // Calculate the y position in the global domain
            // Check bounds in the y direction
            if (fi < dy) {
                int fjr = fi * pdx + gtidx; // Flattened index for vx and vy
                float vxterm = vx[fjr];
                float vyterm = vy[fjr];

                // Populate the new velocity term after scaling
                float2 nvterm;
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Calculate pointer offset using pitch and transfer the normalized value
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}