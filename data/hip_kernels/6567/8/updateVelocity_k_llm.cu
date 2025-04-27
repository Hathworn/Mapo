#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    int p;

    float vxterm, vyterm;
    float2 nvterm;
    
    // Precalculate scale factor outside loop to optimize performance
    float scale = 1.f / (dx * dy);

    // Only proceed if within domain bounds in X
    if (gtidx < dx) {
#pragma unroll
        for (p = 0; p < lb; p++) {
            // Calculate global index for Y
            int fi = gtidy + p;
            if (fi < dy) {
                // Compute absolute global memory index
                int fjr = fi * pdx + gtidx;

                // Fetch vx and vy terms
                vxterm = vx[fjr];
                vyterm = vy[fjr];

                // Scale values
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Calculate pointer to appropriate position in float2 array
                float2 *fj = (float2 *)((char *)v + fi * pitch) + gtidx;

                // Store results
                *fj = nvterm;
            }
        }
    }
}