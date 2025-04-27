#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;
    
    // Check if gtidx is within bounds once
    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            // Compute fi and check within bounds
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;

                float2 xterm = vx[fj];
                float2 yterm = vy[fj];

                int iix = gtidx;
                int iiy = (fi > dy / 2) ? (fi - dy) : fi;

                // Precompute common factors
                float kk = static_cast<float>(iix * iix + iiy * iiy); // k^2
                float diff = 1.f / (1.f + visc * dt * kk);

                // Apply diffusion to velocity components
                xterm.x *= diff; xterm.y *= diff;
                yterm.x *= diff; yterm.y *= diff;

                // Projection logic if kk is greater than 0
                if (kk > 0.f) {
                    float rkk = 1.f / kk;
                    float rkp = (iix * xterm.x + iiy * yterm.x);
                    float ikp = (iix * xterm.y + iiy * yterm.y);

                    // Simplified projection calculations
                    float iix_rkk = iix * rkk;
                    float iiy_rkk = iiy * rkk;

                    xterm.x -= iix_rkk * rkp;
                    xterm.y -= iix_rkk * ikp;
                    yterm.x -= iiy_rkk * rkp;
                    yterm.y -= iiy_rkk * ikp;
                }

                vx[fj] = xterm;
                vy[fj] = yterm;
            }
        }
    }
}