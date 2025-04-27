#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bigstencil(int* __restrict__ in, int* __restrict__ out) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory to reduce global memory accesses
    __shared__ int temp[TILE_SIZE]; // TILE_SIZE should be defined appropriately
    temp[threadIdx.x] = in[i];
    __syncthreads();
    out[i] = temp[threadIdx.x] + 2;
}