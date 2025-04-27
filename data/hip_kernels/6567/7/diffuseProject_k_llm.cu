#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy_start = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Unrolling the loop for improved performance
    #pragma unroll
    for (int p = 0; p < lb; p++) {
        int fi = gtidy_start + p;
        
        // Use shared memory to cache data for coalesced memory access
        __shared__ float2 s_vx[32];  // Adjust size according to block dimensions
        __shared__ float2 s_vy[32];

        if (gtidx < dx && fi < dy) {
            int fj = fi * dx + gtidx;
            
            // Load data into shared memory
            s_vx[threadIdx.x] = vx[fj];
            s_vy[threadIdx.x] = vy[fj];

            float2 xterm = s_vx[threadIdx.x];
            float2 yterm = s_vy[threadIdx.x];

            int iix = gtidx;
            int iiy = (fi > dy / 2) ? (fi - dy) : fi;

            float kk = (float)(iix * iix + iiy * iiy); // k^2
            float diff = 1.f / (1.f + visc * dt * kk);
            xterm.x *= diff; xterm.y *= diff;
            yterm.x *= diff; yterm.y *= diff;

            if (kk > 0.f) {
                float rkk = 1.f / kk;
                float rkp = (iix * xterm.x + iiy * yterm.x);
                float ikp = (iix * xterm.y + iiy * yterm.y);
                xterm.x -= rkk * rkp * iix;
                xterm.y -= rkk * ikp * iix;
                yterm.x -= rkk * rkp * iiy;
                yterm.y -= rkk * ikp * iiy;
            }

            // Write back the results
            vx[fj] = xterm;
            vy[fj] = yterm;
        }
    }
}