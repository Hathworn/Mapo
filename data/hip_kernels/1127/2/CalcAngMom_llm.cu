#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void CalcAngMom(double *AngMomx_d, double *AngMomy_d, double *AngMomz_d, double *GlobalAMx_d, double *GlobalAMy_d, double *GlobalAMz_d, double *Mh_d, double *Rho_d, double  A, double  Omega, double *Altitude_d, double *Altitudeh_d, double *lonlat_d, double *areasT, double *func_r_d, int     num, bool    DeepModel) {

    int id  = blockIdx.x * blockDim.x + threadIdx.x;
    int nv  = gridDim.y;
    int lev = blockIdx.y;

    if (id < num) {
        double AMx, AMy, AMz;
        double rx, ry, rz, r;

        // Calculate control volume
        double zup, zlow, Vol;
        zup  = Altitudeh_d[lev + 1] + A;
        zlow = Altitudeh_d[lev] + A;
        if (DeepModel) {
            Vol = areasT[id] / pow(A, 2) * (pow(zup, 3) - pow(zlow, 3)) / 3;
        } else {
            Vol = areasT[id] * (zup - zlow);
        }

        // Precompute cosines and sines to avoid recalculating
        double cos_lat = cos(lonlat_d[id * 2 + 1]);
        double cos_lon = cos(lonlat_d[id * 2]);
        double sin_lon = sin(lonlat_d[id * 2]);

        // Radius vector
        r  = A + Altitude_d[lev];
        rx = r * func_r_d[id * 3 + 0];
        ry = r * func_r_d[id * 3 + 1];
        rz = r * func_r_d[id * 3 + 2];

        int index = id * 3 * nv + lev * 3;
        int rho_index = id * nv + lev;

        // Angular momentum r x p
        AMx = ry * Mh_d[index + 2] - rz * Mh_d[index + 1]
            - Rho_d[rho_index] * Omega * r * rz * cos_lat * cos_lon;
        AMy = -rx * Mh_d[index + 2] + rz * Mh_d[index + 0]
            - Rho_d[rho_index] * Omega * r * rz * cos_lat * sin_lon;
        AMz = rx * Mh_d[index + 1] - ry * Mh_d[index + 0]
            + Rho_d[rho_index] * Omega * r * r * cos_lat * cos_lat;

        // Total in control volume
        AngMomx_d[id * nv + lev] = AMx * Vol;
        AngMomy_d[id * nv + lev] = AMy * Vol;
        AngMomz_d[id * nv + lev] = AMz * Vol;
    }
}