#include "hip/hip_runtime.h"
#include "includes.h"
__device__ unsigned int getGid3d3d(){
    int blockId = blockIdx.x + blockIdx.y * gridDim.x
    + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z)
    + (threadIdx.y * blockDim.x)
    + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}
__global__ void make_cufftDoubleComplex(double *in, double2 *out){
    int gid = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid to access gid
    int planeSize = blockDim.x * gridDim.x; // Calculate plane size
    int sliceOffset = blockIdx.y * gridDim.x * blockDim.x; // Calculate offset for slice
    int totalOffset = sliceOffset + gid; // Calculate total offset
    out[totalOffset].x = in[totalOffset]; // Map input to output using total offset
    out[totalOffset].y = 0;
}