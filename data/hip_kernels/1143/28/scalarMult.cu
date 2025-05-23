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
__global__ void scalarMult(double2* in, double factor, double2* out){
double2 result;
//extern __shared__ double2 tmp_in[];
unsigned int gid = getGid3d3d();
result.x = (in[gid].x * factor);
result.y = (in[gid].y * factor);
out[gid] = result;
}