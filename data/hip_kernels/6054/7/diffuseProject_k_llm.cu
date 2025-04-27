#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Unroll loops to increase parallelism and reduce overhead
    for (int p = 0; p < lb; p++) {
        int fi = gtidy + p;
        if (gtidx < dx && fi < dy) { // Combine condition checks to reduce branching
            int fj = fi * dx + gtidx;
            float2 xterm = vx[fj];
            float2 yterm = vy[fj];

            int iix = gtidx;
            int iiy = (fi > dy / 2) ? (fi - dy) : fi;

            // Pre-calculate values to reuse them
            float kk = (float)(iix * iix + iiy * iiy);
            float diff = 1.f / (1.f + visc * dt * kk);
            xterm.x *= diff;
            xterm.y *= diff;
            yterm.x *= diff;
            yterm.y *= diff;

            if (kk > 0.f) {
                float rkk = 1.f / kk;
                float rkp = (iix * xterm.x + iiy * yterm.x);
                float ikp = (iix * xterm.y + iiy * yterm.y);
                float common_x = rkk * iix;
                float common_y = rkk * iiy;

                // Reduce redundant calculations
                xterm.x -= common_x * rkp;
                xterm.y -= common_x * ikp;
                yterm.x -= common_y * rkp;
                yterm.y -= common_y * ikp;
            }

            vx[fj] = xterm;
            vy[fj] = yterm;
        }
    }
}