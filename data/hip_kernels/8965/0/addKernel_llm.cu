#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel
__global__ void addKernel(int *c, const int *a) {
    int i = threadIdx.x;
    extern __shared__ int seme[];

    // Load shared memory and synchronize
    seme[i] = a[i];
    __syncthreads();

    // Use warp-level reduction for efficiency
    int lane = i % warpSize;

    // Task based on thread index
    switch(i) {
        case 0:
            c[0] = 0;
            for (int d = lane; d < 5; d += warpSize) {
                c[0] += seme[d] * seme[d];
            }
            break;
        case 1:
            c[1] = 0;
            for (int d = lane; d < 5; d += warpSize) {
                c[1] += seme[d];
            }
            break;
        case 2:
            c[2] = 1;
            for (int d = lane; d < 5; d += warpSize) {
                c[2] *= seme[d];
            }
            break;
    }
}