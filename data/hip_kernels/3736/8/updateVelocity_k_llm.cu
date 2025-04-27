#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateVelocity_k(float2 *v, float *vx, float *vy, int dx, int pdx, int dy, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * blockDim.y * lb + threadIdx.y * lb;

    // Ensure threads are within the domain boundaries
    if (gtidx < dx) {
        float scale = 1.f / (dx * dy);

        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fjr = fi * pdx + gtidx;

                // Utilize shared memory if beneficial (not implemented here, depends on memory access pattern)
                
                // Load and normalize velocity components
                float vxterm = vx[fjr];
                float vyterm = vy[fjr];

                float2 nvterm;
                nvterm.x = vxterm * scale;
                nvterm.y = vyterm * scale;

                // Use pointer offset technique for memory efficiency
                float2 *fj = (float2*)((char*)v + fi * pitch) + gtidx;
                *fj = nvterm;
            }
        }
    }
}