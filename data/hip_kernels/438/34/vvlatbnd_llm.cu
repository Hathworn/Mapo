#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int sign(DECNUM x) {
    return ((x > 0.0f) - (x < 0.0f));
}

__device__ int mminus2(int ix, int nx) {
    return (ix <= 1) ? 0 : ix - 2; // Simplified conditional return
}

__device__ int pplus(int ix, int nx) {
    return (ix == nx - 1) ? nx - 1 : ix + 1; // Simplified conditional return
}

__device__ int mminus(int ix, int nx) {
    return (ix == 0) ? 0 : ix - 1; // Simplified conditional return
}

__global__ void vvlatbnd(int nx, int ny, DECNUM *uu) {
    // Neumann_v boundary
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int i = ix + iy * nx;

    __shared__ DECNUM uut[16][16];
    __shared__ DECNUM uub[16][16];

    if (ix < nx && iy < ny) {
        unsigned int yminus = mminus(iy, ny);
        unsigned int yplus = pplus(iy, ny);

        // Use fewer shared memory accesses and simplified boundary logic
        uut[threadIdx.x][threadIdx.y] = uu[ix + yplus * nx];
        uub[threadIdx.x][threadIdx.y] = uu[ix + yminus * nx];

        if (iy == 0) {
            uu[i] = uut[threadIdx.x][threadIdx.y];
        } else if (iy == ny - 2) {
            uu[i] = uub[threadIdx.x][threadIdx.y];
        }
    }
}