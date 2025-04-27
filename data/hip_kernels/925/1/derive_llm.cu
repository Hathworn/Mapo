#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
                 + (threadIdx.y * blockDim.x)
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void derive(double2 *data, double2 *out, int stride, int gsize, double dx) {
    int gid = getGid3d3d();
    if (gid < gsize) {
        // Using shared memory for better memory access patterns
        __shared__ double2 sharedData[1024];  // Assumption: adjust the size based on blockDim
        sharedData[threadIdx.x] = data[gid];
        
        __syncthreads();  // Synchronize to ensure data is available
        
        double2 curVal = sharedData[threadIdx.x];

        if (gid + stride < gsize) {
            double2 nextVal = (threadIdx.x + stride < 1024) ? sharedData[threadIdx.x + stride] : data[gid + stride];
            out[gid].x = (nextVal.x - curVal.x) / dx;
            out[gid].y = (nextVal.y - curVal.y) / dx;
        } else {
            out[gid].x = curVal.x / dx;
            out[gid].y = curVal.y / dx;
        }
    }
}