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
__global__ void thread_test(double *in, double *out){

unsigned int Gid = getGid3d3d();

// Now we set each element in the
out[Gid] = Gid;
//in[Gid] = Gid;
}