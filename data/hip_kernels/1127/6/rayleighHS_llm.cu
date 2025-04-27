```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rayleighHS(double *Mh_d, double *pressure_d, double *Rho_d, double *Altitude_d, double surf_drag, double bl_sigma, double Gravit, double time_step, int num) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int nv = gridDim.y;
    int lev = blockIdx.y;

    if (id < num) {
        double sigma;
        double sigmab = bl_sigma;
        double kf = surf_drag;
        double kv_hs;
        double ps, pre;
        double psm1;

        // Calculate surface pressure
        psm1 = __fma_rn(-Rho_d[id * nv + 0], Gravit, pressure_d[id * nv + 1] - (Altitude_d[0] + Altitude_d[1]));
        ps = 0.5 * (pressure_d[id * nv + 0] + psm1);

        pre = pressure_d[id * nv + lev];
        // Use fast reciprocal operation for sigma as pre / ps
        sigma = __frcp_rn(ps) * pre;

        // Momentum dissipation constant using max intrinsic
        kv_hs = __dmul_rn(kf, fmax(0.0, (sigma - sigmab) / (1.0 - sigmab)));

        // Update momenta using loop unrolling
        #pragma unroll
        for (int k = 0; k < 3; ++k) {
            Mh_d[id * 3 * nv + lev * 3 + k] /= (1.0 + __dmul_rn(kv_hs, time_step));
        }
    }
}