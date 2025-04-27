#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalcEntropy(double *Entropy_d, double *pressure_d, double *temperature_d, double Cp, double Rd, double A, double P_Ref, double *Altitude_d, double *Altitudeh_d, double *lonlat_d, double *areasT, double *func_r_d, int num, bool DeepModel) {

    int id  = blockIdx.x * blockDim.x + threadIdx.x;
    int nv  = gridDim.y;
    int lev = blockIdx.y;

    if (id < num) {
        // Precompute values used more than once
        double kappa = Rd / Cp;
        double pressure_inv = pow(P_Ref / pressure_d[id * nv + lev], kappa);
        double potT  = temperature_d[id * nv + lev] * pressure_inv;
        double Sdens = Cp * log(potT);

        // Calculate control volume
        double zup = Altitudeh_d[lev + 1] + A;
        double zlow = Altitudeh_d[lev] + A;
        double Vol;
        if (DeepModel) {
            double zup3 = pow(zup, 3);
            double zlow3 = pow(zlow, 3);
            Vol = areasT[id] / pow(A, 2) * (zup3 - zlow3) / 3;
        }
        else {
            Vol = areasT[id] * (zup - zlow);
        }

        // Total energy in the control volume
        Entropy_d[id * nv + lev] = Sdens * Vol;
    }
}