#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + threadIdx.z * (blockDim.x * blockDim.y)
                 + threadIdx.y * blockDim.x
                 + threadIdx.x;
    return threadId;
}

__global__ void derive(double2 *data, double2 *out, int stride, int gsize, double dx) {
    int gid = getGid3d3d();
    // Ensure gid is within bounds
    if (gid < gsize) {
        double2 result;
        if (gid + stride < gsize) {
            // Compute derivative using stride
            result.x = (data[gid + stride].x - data[gid].x) / dx;
            result.y = (data[gid + stride].y - data[gid].y) / dx;
        } else {
            // Handle boundary condition
            result.x = data[gid].x / dx;
            result.y = data[gid].y / dx;
        }
        // Write result to output
        out[gid] = result;
    }
}