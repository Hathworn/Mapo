#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalcMass(double *Mass_d, double *GlobalMass_d, double *Rho_d, double A, double *Altitudeh_d, double *lonlat_d, double *areasT, int num, bool DeepModel) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int nv = gridDim.y;
    int lev = blockIdx.y;

    if (id < num) {
        // Pre-calculate and store repeated terms
        double zup = Altitudeh_d[lev + 1] + A;
        double zlow = Altitudeh_d[lev] + A;
        double deltaZ = zup - zlow;

        // Use ternary operator for concise conditional expression
        double Vol = DeepModel ?
                     (areasT[id] / (A * A) * (zup * zup * zup - zlow * zlow * zlow) / 3) :
                     (areasT[id] * deltaZ);

        // Calculate mass
        Mass_d[id * nv + lev] = Rho_d[id * nv + lev] * Vol;
    }
}