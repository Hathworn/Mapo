#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void StarThetaKernel(double *Qbase, double *Rmed, int nrad, int nsec, double *dq, double dt) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < nrad && j < nsec) {
        // Optimize dxtheta calculation to avoid redundant condition
        double dxtheta = (i < nrad) ? 2.0 * PI / (double)nsec * Rmed[i] : 0.0;
        double invdxtheta = 1.0 / dxtheta;

        // Precompute indices to reduce redundant calculations
        int index = i * nsec + j;
        int indexPrev = i * nsec + ((j - 1) + nsec) % nsec;
        int indexNext = i * nsec + (j + 1) % nsec;

        double dqm = Qbase[index] - Qbase[indexPrev];
        double dqp = Qbase[indexNext] - Qbase[index];

        // Simplified condition for dq calculation
        dq[index] = (dqp * dqm > 0.0) ? (dqp * dqm / (dqp + dqm) * invdxtheta) : 0.0;
    }
}