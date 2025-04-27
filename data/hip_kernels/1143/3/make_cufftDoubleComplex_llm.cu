#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) +
                   (threadIdx.y * blockDim.x) +
                   (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

// Optimized kernel function for better memory throughput
__global__ void make_cufftDoubleComplex(double *in, double2 *out) {
    int gid = getGid3d3d();
    // Ensure the thread is within array bounds
    if (gid < gridDim.x * gridDim.y * gridDim.z * blockDim.x * blockDim.y * blockDim.z) {
        double value = in[gid]; // Avoid redundant memory access
        out[gid] = make_double2(value, 0.0); // Simplified assignment using make_double2
    }
}