#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void kharmonic_V(double *x, double *y, double *z, double* items, double *Ax, double *Ay, double *Az, double *V) {

    int gid = getGid3d3d();
    int xid = blockDim.x * blockIdx.x + threadIdx.x;
    int yid = blockDim.y * blockIdx.y + threadIdx.y;
    int zid = blockDim.z * blockIdx.z + threadIdx.z;

    // Load items variables into registers to reduce global memory access
    double item3 = items[3];
    double item4 = items[4];
    double item5 = items[5];
    double item6 = items[6];
    double item7 = items[7];
    double item8 = items[8];
    double item9 = items[9];
    double item10 = items[10];
    double item11 = items[11];

    // Calculate potential energy components
    double V_x = item3 * (x[xid] + item6);
    double V_y = item10 * item4 * (y[yid] + item7);
    double V_z = item11 * item5 * (z[zid] + item8);

    // Compute the total potential energy with reduced operations
    double potential_energy = V_x * V_x + V_y * V_y + V_z * V_z;
    double magnetic_energy = Ax[gid] * Ax[gid] + Ay[gid] * Ay[gid] + Az[gid] * Az[gid];

    V[gid] = 0.5 * item9 * (potential_energy + magnetic_energy);
}