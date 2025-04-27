#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square1_kernel(int n, double *b, double *a, double *ct) {
    const int j2 = blockIdx.x * blockDim.x + threadIdx.x;
    const int m = n >> 1;
    const int nc = n >> 2;
    const int j = j2 << 1;

    if (j2) {
        int nminusj = n - j;
        double wkr = 0.5 - ct[nc - j2];
        double wki = ct[j2];
        double ajr = a[j];
        double aji = a[1 + j];
        double akr = a[nminusj];
        double aki = a[1 + nminusj];

        // Simplified computation of new_ajr, new_aji, new_akr, new_aki.
        double new_aji = 2.0 * ajr * aji;
        double new_ajr = (ajr - aji) * (ajr + aji);
        double new_aki = 2.0 * akr * aki;
        double new_akr = (akr - aki) * (akr + aki);

        // Simplified computation for xi and xr.
        double xr = new_ajr - new_akr;
        double xi = new_aji + new_aki;

        // Using combined computation for intermediate values of yr and yi.
        double yr = wkr * xr + wki * xi;
        double yi = wkr * xi - wki * xr;

        // Directly storing results using combined computations.
        b[j] = new_ajr - yr;
        b[1 + j] = yi - new_aji;
        b[nminusj] = new_akr + yr;
        b[1 + nminusj] = yi - new_aki;
    } else {
        // Reduced redundant computations for the case when j2 equals zero.
        double xr = a[0];
        double xi = a[1];
        b[0] = xr * xr + xi * xi;
        b[1] = -xr * xi - xi * xr;
        xr = a[m];
        xi = a[1 + m];
        b[m + 1] = -xr * xi - xi * xr;
        b[m] = xr * xr - xi * xi;
    }
}