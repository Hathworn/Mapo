#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.y * blockDim.x) 
                   + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__device__ double2 pow(double2 a, int b) {
    double r = sqrt(a.x * a.x + a.y * a.y);
    double theta = atan2(a.y, a.x); // atan2 for correct angle calculation
    return { pow(r, b) * cos(b * theta), pow(r, b) * sin(b * theta) };
}

__global__ void ktorus_wfc(double *x, double *y, double *z, double *items, double winding, double *phi, double2 *wfc) {
    int xid = blockIdx.x * blockDim.x + threadIdx.x;
    int yid = blockIdx.y * blockDim.y + threadIdx.y;
    int zid = blockIdx.z * blockDim.z + threadIdx.z;
    int gid = (zid * gridDim.y * gridDim.x + yid * gridDim.x + xid); // More intuitive gid calculation

    // Combine adjacent operations to reduce computation and increase clarity
    double dx = x[xid] - items[6];
    double dy = y[yid] - items[7];
    double rad = sqrt(dx * dx + dy * dy) - 0.5 * items[0];

    double rad_norm = pow(rad / (items[14] * items[15] * 0.5), 2);
    double z_norm = pow(z[zid] / (items[14] * items[17] * 0.5), 2);
    
    // Precompute normalization factor to save recalculation inside exp()
    double norm_factor = rad_norm + z_norm;

    wfc[gid].x = exp(-norm_factor);
    wfc[gid].y = 0.0;
}