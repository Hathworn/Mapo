#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    // Calculate global index using blockIdx and threadIdx
    const int igpt = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    // Ensure the thread operates within valid bounds
    if (igpt < ngpts) {
        int gmapIdx = ghatmap[igpt];
        int offset = 2 * igpt;

        // Optimize memory access by reusing computed indices
        double pwcc_real = scale * pwcc[offset];
        double pwcc_imag = scale * pwcc[offset + 1];

        c[2 * gmapIdx] = pwcc_real;
        c[2 * gmapIdx + 1] = pwcc_imag;

        // Conditional map processing
        if (nmaps == 2) {
            gmapIdx = ghatmap[igpt + ngpts];
            c[2 * gmapIdx] = pwcc_real;
            c[2 * gmapIdx + 1] = -pwcc_imag;
        }
    }
}