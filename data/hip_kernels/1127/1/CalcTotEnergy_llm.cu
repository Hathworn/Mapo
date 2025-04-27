#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalcTotEnergy(double *Etotal_d, double *GlobalE_d, double *Mh_d, double *W_d, double *Rho_d, double *temperature_d, double  Gravit, double  Cp, double  Rd, double  A, double *Altitude_d, double *Altitudeh_d, double *lonlat_d, double *areasT, double *func_r_d, int     num, bool    DeepModel) {

    int id  = blockIdx.x * blockDim.x + threadIdx.x;
    int nv  = gridDim.y;
    int lev = blockIdx.y;

    if (id < num) {
        double Ek, Eint, Eg;
        double wx, wy, wz;
        double Cv = Cp - Rd;
        double zup, zlow, Vol;

        // Pre-calculate common terms to reduce repeated calculations
        double lon_cos = cos(lonlat_d[id * 2 + 1]);
        double lon_sin = sin(lonlat_d[id * 2 + 1]);
        double lat_cos = cos(lonlat_d[id * 2]);
        double lat_sin = sin(lonlat_d[id * 2]);

        zup  = Altitudeh_d[lev + 1] + A;
        zlow = Altitudeh_d[lev] + A;

        // Optimize volume computation
        Vol = areasT[id] * (DeepModel ? ((pow(zup, 3) - pow(zlow, 3)) / (3 * pow(A, 2))) : (zup - zlow));

        // Optimize wind calculations using precomputed trigonometric values
        wx = W_d[id * nv + lev] * lon_cos * lat_cos;
        wy = W_d[id * nv + lev] * lon_cos * lat_sin;
        wz = W_d[id * nv + lev] * lon_sin;

        // Optimize energy calculations
        double rho = Rho_d[id * nv + lev];
        Ek = 0.5 * ((Mh_d[id * 3 * nv + lev * 3 + 0] + wx) * (Mh_d[id * 3 * nv + lev * 3 + 0] + wx)
                  + (Mh_d[id * 3 * nv + lev * 3 + 1] + wy) * (Mh_d[id * 3 * nv + lev * 3 + 1] + wy)
                  + (Mh_d[id * 3 * nv + lev * 3 + 2] + wz) * (Mh_d[id * 3 * nv + lev * 3 + 2] + wz)) / rho;

        Eint = Cv * temperature_d[id * nv + lev] * rho;
        Eg   = rho * Gravit * Altitude_d[lev];

        // Store total energy
        Etotal_d[id * nv + lev] = (Ek + Eint + Eg) * Vol;
    }
}