#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_number(float *ad, float *bd)
{
    // Use shared memory for fast access
    __shared__ float shared_ad;
    __shared__ float shared_bd;

    if (threadIdx.x == 0) {
        shared_ad = *ad;
        shared_bd = *bd;
    }

    __syncthreads();

    if (threadIdx.x == 0) {
        shared_ad += shared_bd;
        *ad = shared_ad; // Update global memory after addition
    }
}