#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.z * blockDim.y + threadIdx.y) * blockDim.x + threadIdx.x;
    return threadId;
}

__device__ double2 pow(double2 a, int b){
    double r = sqrt(a.x * a.x + a.y * a.y);
    double theta = atan2(a.y, a.x);  // Use atan2 for more robustness 
    return {pow(r, b) * cos(b * theta), pow(r, b) * sin(b * theta)};
}

__global__ void ktorus_wfc(double *x, double *y, double *z, double *items, double winding, double *phi, double2 *wfc){
    int gid = getGid3d3d();
    int xid = blockIdx.x * blockDim.x + threadIdx.x;
    int yid = blockIdx.y * blockDim.y + threadIdx.y;
    int zid = blockIdx.z * blockDim.z + threadIdx.z;

    if (xid < gridDim.x * blockDim.x && yid < gridDim.y * blockDim.y && zid < gridDim.z * blockDim.z) {
        double rad = sqrt((x[xid] - items[6]) * (x[xid] - items[6]) + (y[yid] - items[7]) * (y[yid] - items[7])) - 0.5 * items[0];

        double expArg = pow(rad / (items[14] * items[15] * 0.5), 2) + pow(z[zid] / (items[14] * items[17] * 0.5), 2);
        wfc[gid].x = exp(-expArg);
        wfc[gid].y = 0.0;
    }
}