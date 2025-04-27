#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pre_mul_kernel(int n, double *a, double *ct) {
    const int j2 = blockIdx.x * blockDim.x + threadIdx.x;
    const int nc = n >> 2;
    
    // Optimize memory access pattern
    if (j2 < nc) {
        const int j = j2 << 1;
        const int nminusj = n - j;

        // Preload values into registers
        double wkr = 0.5 - ct[nc - j2];
        double wki = ct[j2];
        double ajr = a[j];
        double aji = a[1 + j];
        double akr = a[nminusj];
        double aki = a[1 + nminusj];

        // Perform calculations
        double xr = ajr - akr;
        double xi = aji + aki;
        double yr = wkr * xr - wki * xi;
        double yi = wkr * xi + wki * xr;

        // Update results
        a[j] = ajr - yr;
        a[1 + j] = aji - yi;
        a[nminusj] = akr + yr;
        a[1 + nminusj] = aki - yi;
    }
}