#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diffuseProject_k(float2 *vx, float2 *vy, int dx, int dy, float dt, float visc, int lb) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Load shared memory for vx and vy to improve memory access patterns
    extern __shared__ float2 sharedMem[];
    float2 *shared_vx = sharedMem;
    float2 *shared_vy = sharedMem + dx * lb * blockDim.y;

    if (gtidx < dx) {
        for (int p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                
                // Load data into shared memory
                shared_vx[threadIdx.y * lb + p] = vx[fj];
                shared_vy[threadIdx.y * lb + p] = vy[fj];

                __syncthreads(); // Ensure all data is loaded before processing

                float2 xterm = shared_vx[threadIdx.y * lb + p];
                float2 yterm = shared_vy[threadIdx.y * lb + p];

                int iix = gtidx;
                int iiy = (fi > dy / 2) ? (fi - dy) : fi;

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
                    xterm.x -= rkk * rkp * iix;
                    xterm.y -= rkk * ikp * iix;
                    yterm.x -= rkk * rkp * iiy;
                    yterm.y -= rkk * ikp * iiy;
                }

                // Store result from shared memory back to global memory
                vx[fj] = xterm;
                vy[fj] = yterm;
            }
            __syncthreads(); // Ensure all changes are done before next iteration
        }
    }
}