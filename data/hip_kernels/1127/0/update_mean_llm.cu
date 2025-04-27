```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void update_mean(double* pressure_mean_d, double* pressure_d, double* Rho_mean_d, double* Rho_d, double* Mh_mean_d, double* Mh_d, double* Wh_mean_d, double* Wh_d, int n_since_out, int num) {

    int id  = blockIdx.x * blockDim.x + threadIdx.x;
    int nv  = gridDim.y;
    int lev = blockIdx.y;

    if (id < num) {
        double factor = 1.0 / n_since_out;  // Reuse common factor

        int base_index = id * nv + lev;
        pressure_mean_d[base_index] = factor * (pressure_mean_d[base_index] * (n_since_out - 1) + pressure_d[base_index]);
        Rho_mean_d[base_index] = factor * (Rho_mean_d[base_index] * (n_since_out - 1) + Rho_d[base_index]);

        int mh_base_index = 3 * id * nv + 3 * lev;
        Mh_mean_d[mh_base_index] = factor * (Mh_mean_d[mh_base_index] * (n_since_out - 1) + Mh_d[mh_base_index]);
        Mh_mean_d[mh_base_index + 1] = factor * (Mh_mean_d[mh_base_index + 1] * (n_since_out - 1) + Mh_d[mh_base_index + 1]);
        Mh_mean_d[mh_base_index + 2] = factor * (Mh_mean_d[mh_base_index + 2] * (n_since_out - 1) + Mh_d[mh_base_index + 2]);

        int wh_base_index = id * (nv + 1) + lev;
        Wh_mean_d[wh_base_index] = factor * (Wh_mean_d[wh_base_index] * (n_since_out - 1) + Wh_d[wh_base_index]);

        // Ensure last level update for Wh_mean_d
        if (lev == nv - 1) {
            Wh_mean_d[wh_base_index + 1] = factor * (Wh_mean_d[wh_base_index + 1] * (n_since_out - 1) + Wh_d[wh_base_index + 1]);
        }
    }
}