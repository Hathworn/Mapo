#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_absv(const unsigned int nSpheres, const float* velX, const float* velY, const float* velZ, float* d_absv) {
    unsigned int my_sphere = blockIdx.x * blockDim.x + threadIdx.x;
    if (my_sphere < nSpheres) {
        // Direct computation without extra array 'v'
        float vx = velX[my_sphere];
        float vy = velY[my_sphere];
        float vz = velZ[my_sphere];
        d_absv[my_sphere] = sqrtf(vx * vx + vy * vy + vz * vz); // Use sqrtf for float optimization
    }
}