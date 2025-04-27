#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    // Calculate thread index in global x and y dimensions
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Calculate scale factor once per kernel, as it is constant
    float scale = 1.f / (dx * dy);

    // Ensure thread is within domain bounds
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p; // Calculate y domain index for this thread
            if (fi < dy) {
                int fjr = fi * pdx + gtidx; // Calculate flattened index in the arrays

                // Read vx and vy values
                float vxterm = vx[fjr];
                float vyterm = vy[fjr];

                // Normalize and prepare to store results in float2 type
                float2 nvterm;
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Calculate pointer offset considering pitch and store result
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}