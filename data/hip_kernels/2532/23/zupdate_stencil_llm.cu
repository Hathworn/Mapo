```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void zupdate_stencil(float *zx, float *zy, float *zoutx, float *zouty, float *g, float tau, float invlambda, int  nx, int ny)
{
    int px = blockIdx.x * blockDim.x + threadIdx.x;
    int py = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = px + py * nx;

    // Boundary check to ensure valid memory access
    if (px < nx && py < ny) {
        float a = 0, b = 0, t, DIVZ;
        float fr = 0, fc = 0, fu = 0;
        
        // Compute divergence for center
        DIVZ = 0;
        if (px < nx - 1) DIVZ += zx[idx];
        if (px > 0) DIVZ -= zx[idx - 1];
        if (py < ny - 1) DIVZ += zy[idx];
        if (py > 0) DIVZ -= zy[idx - nx];
        fc = DIVZ - g[idx] * invlambda;

        // Compute divergence for right
        if (px < nx - 1) {
            DIVZ = 0;
            int tidx = idx + 1; // Pre-calculate index for right position
            if (px < nx - 2) DIVZ += zx[tidx];
            if (px > 0) DIVZ -= zx[tidx - 1];
            if (py < ny - 1) DIVZ += zy[tidx];
            if (py > 0) DIVZ -= zy[tidx - nx];
            fr = DIVZ - g[tidx] * invlambda;
        }

        // Compute divergence for up
        if (py < ny - 1) {
            DIVZ = 0;
            int tidx = idx + nx; // Pre-calculate index for up position
            if (px < nx - 1) DIVZ += zx[tidx];
            if (px > 0) DIVZ -= zx[tidx - 1];
            if (py < ny - 2) DIVZ += zy[tidx];
            if (py > 0) DIVZ -= zy[tidx - nx];
            fu = DIVZ - g[tidx] * invlambda;
        }

        // Compute the gradient
        if (px < nx - 1) a = fr - fc;
        if (py < ny - 1) b = fu - fc;

        // Update z
        t = 1 / (1 + tau * sqrtf(a * a + b * b));
        zoutx[idx] = (zx[idx] + tau * a) * t;
        zouty[idx] = (zy[idx] + tau * b) * t;
    }
}