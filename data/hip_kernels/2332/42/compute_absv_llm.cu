```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_absv(const unsigned int nSpheres, const float* velX, const float* velY, const float* velZ, float* d_absv) {
    unsigned int my_sphere = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we only process valid elements
    if (my_sphere < nSpheres) {
        // Load data into registers for faster access
        float vx = velX[my_sphere];
        float vy = velY[my_sphere];
        float vz = velZ[my_sphere];

        // Compute absolute velocity using registers
        d_absv[my_sphere] = sqrtf(vx * vx + vy * vy + vz * vz);
    }
}