#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void print_details_of_warps()
{
int gid = blockIdx.y * gridDim.x * blockDim.x
+ blockIdx.x * blockDim.x + threadIdx.x;

int warp_id = threadIdx.x / 32;

int gbid = blockIdx.y * gridDim.x + blockIdx.x;

printf("tid : %d, bid.x : %d, bid.y : %d, gid : %d, warp_id : %d, gbid : %d \n",
threadIdx.x, blockIdx.x, blockIdx.y, gid, warp_id, gbid);
}