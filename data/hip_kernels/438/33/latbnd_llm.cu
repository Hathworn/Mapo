#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sign(DECNUM x) {
    return ((x > 0.0f) - (x < 0.0f));
}

__device__ int mminus2(int ix, int nx) {
    return (ix <= 1) ? 0 : ix - 2;
}

__device__ int pplus(int ix, int nx) {
    return (ix == nx - 1) ? nx - 1 : ix + 1;
}

__device__ int mminus(int ix, int nx) {
    return (ix == 0) ? 0 : ix - 1;
}

__global__ void latbnd(int nx, int ny, DECNUM * uu) {
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int i = ix + iy * nx;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    __shared__ DECNUM uut[16][16];
    __shared__ DECNUM uub[16][16];

    if (ix < nx && iy < ny) {
        unsigned int yplus = pplus(iy, ny);

        // Load boundary values only on first and last rows
        uut[tx][ty] = uu[ix + yplus * nx];
        if (iy == 0) {
            uu[i] = uut[tx][ty];
        }

        if (iy == ny - 1) {
            unsigned int yminus = mminus(iy, ny);
            uub[tx][ty] = uu[ix + yminus * nx];
            uu[i] = uub[tx][ty];
        }
    }
}