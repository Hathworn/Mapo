#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    if (gtidx >= dx) return; // Early exit for threads outside domain in X

    float2 pterm, vterm;
    for (int p = 0; p < lb; p++) {
        int fi = gtidy + p;
        if (fi >= dy) break; // Early exit for rows outside domain in Y

        int fj = fi * dx + gtidx;
        pterm = part[fj];

        // Calculate velocity index using faster address computation
        int xvi = __float2int_rd(pterm.x * dx);
        int yvi = __float2int_rd(pterm.y * dy);
        vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

        // Update particle position with improved modulo operation
        pterm.x = fmodf(pterm.x + dt * vterm.x + 1.0f, 1.0f);
        pterm.y = fmodf(pterm.y + dt * vterm.y + 1.0f, 1.0f);

        part[fj] = pterm;
    }
}