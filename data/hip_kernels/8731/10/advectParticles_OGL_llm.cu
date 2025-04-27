#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advectParticles_OGL(float2 *part, float2 *v, int dx, int dy, float dt, int lb, size_t pitch) {
    int gtidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gtidy = blockIdx.y * (lb * blockDim.y) + threadIdx.y * lb;

    // Exit early if the thread is out of bounds in x-dimension, added for clarity
    if (gtidx >= dx) return;

    for (int p = 0; p < lb; p++) {
        int fi = gtidy + p;

        // Exit early if the thread is out of bounds in y-dimension
        if (fi >= dy) return;

        int fj = fi * dx + gtidx;
        float2 pterm = part[fj];

        int xvi = min(max((int)(pterm.x * dx), 0), dx - 1); // Ensure xvi is within bounds
        int yvi = min(max((int)(pterm.y * dy), 0), dy - 1); // Ensure yvi is within bounds
        float2 vterm = *((float2*)((char*)v + yvi * pitch) + xvi);

        pterm.x = fmodf(pterm.x + dt * vterm.x, 1.f); // Optimized wrap around for pterm.x
        if (pterm.x < 0.f) pterm.x += 1.f; // Ensures positive modulus result

        pterm.y = fmodf(pterm.y + dt * vterm.y, 1.f); // Optimized wrap around for pterm.y
        if (pterm.y < 0.f) pterm.y += 1.f; // Ensures positive modulus result

        part[fj] = pterm;
    }
}