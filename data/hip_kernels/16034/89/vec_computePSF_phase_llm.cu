#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_computePSF_phase(int n, double *realOutput, double *imagOutput, double *kx, double *ky, double *kz, double *pupil, double *phase, double dx, double dy, double dz)
{
    // Calculate global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    // Ensure thread operates within bounds
    if (id < n)
    {
        // Precompute terms to reduce redundant calculations
        double kx_dx = kx[id] * dx;
        double ky_dy = ky[id] * dy;
        double kz_dz = kz[id] * dz;
        
        // Calculate phase and corresponding outputs
        double x = kx_dx + ky_dy + kz_dz + phase[id];
        double cos_x = cos(x);
        double sin_x = sin(x);

        // Store outputs
        realOutput[id] = pupil[id] * cos_x;
        imagOutput[id] = pupil[id] * sin_x;
    }
}