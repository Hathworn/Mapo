#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    int igpt = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    if (igpt < ngpts) {
        int idx = 2 * ghatmap[igpt];  // Pre-compute index for memory access optimization
        int pwcc_idx = 2 * igpt;      // Pre-compute index for source array
        c[idx] = scale * pwcc[pwcc_idx];
        c[idx + 1] = scale * pwcc[pwcc_idx + 1];

        if (nmaps == 2) {
            int idx2 = 2 * ghatmap[igpt + ngpts];
            c[idx2] = scale * pwcc[pwcc_idx];
            c[idx2 + 1] = -scale * pwcc[pwcc_idx + 1];
        }
    }
}