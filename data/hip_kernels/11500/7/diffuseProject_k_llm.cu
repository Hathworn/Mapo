#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                float2 xterm = vx[fj];
                float2 yterm = vy[fj];

                int iix = gtidx;
                int iiy = (fi > dy / 2) ? (fi - dy) : fi;

                float kk = (float)(iix * iix + iiy * iiy);  // k^2
                float diff = 1.f / (1.f + visc * dt * kk);
                xterm.x *= diff; xterm.y *= diff;
                yterm.x *= diff; yterm.y *= diff;

                // Velocity projection
                if (kk > 0.f) {
                    float rkk = 1.f / kk;
                    float rkp = (iix * xterm.x + iiy * yterm.x);
                    float ikp = (iix * xterm.y + iiy * yterm.y);
                    // Subtract projection component
                    xterm.x -= rkk * rkp * iix;
                    xterm.y -= rkk * ikp * iix;
                    yterm.x -= rkk * rkp * iiy;
                    yterm.y -= rkk * ikp * iiy;
                }

                vx[fj] = xterm;
                vy[fj] = yterm;
            }
        }
    }
}