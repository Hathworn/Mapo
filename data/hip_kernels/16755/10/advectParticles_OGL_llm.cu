#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {

    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Shared memory declaration for velocity vectors
    __shared__ float2 shared_v[blockDim.x];

    int p;
    float2 pterm, vterm;

    if (gtidx < dx) {
        for (p = 0; p < lb; p++) {
            int fi = gtidy + p;
            if (fi < dy) {
                int fj = fi * dx + gtidx;
                pterm = part[fj];

                int xvi = ((int)(pterm.x * dx));
                int yvi = ((int)(pterm.y * dy));

                // Use shared memory to reduce global memory access
                if (threadIdx.x == 0) {
                    shared_v[threadIdx.y] = *((float2*)((char*)v + yvi * pitch) + xvi);
                }
                __syncthreads();
                vterm = shared_v[threadIdx.y];
                __syncthreads();

                pterm.x += dt * vterm.x;
                pterm.x = pterm.x - (int)pterm.x;
                pterm.x += 1.f;
                pterm.x = pterm.x - (int)pterm.x;
                pterm.y += dt * vterm.y;
                pterm.y = pterm.y - (int)pterm.y;
                pterm.y += 1.f;
                pterm.y = pterm.y - (int)pterm.y;

                part[fj] = pterm;
            }
        }
    }
}