#include "hip/hip_runtime.h"
#include "includes.h"

#define DOUBLE

#ifdef DOUBLE
#define Complex  hipfftDoubleComplex
#define Real double
#define Transform HIPFFT_Z2Z
#define TransformExec hipfftExecZ2Z
#else
#define Complex  hipfftComplex
#define Real float
#define Transform HIPFFT_C2C
#define TransformExec hipfftExecC2C
#endif

#define TILE_DIM  8

// Optimize global kernel
__global__ void spread_i(Real* src, unsigned int spitch, Real* dst, unsigned int dpitch) 
{
    unsigned int bid = blockIdx.y * gridDim.x + blockIdx.x;
    unsigned int tid = threadIdx.x;

    // Use shared memory for coalesced memory access
    __shared__ Real sharedData[TILE_DIM];

    if (tid < dpitch) {
        // Coalesce reads from src into shared memory
        sharedData[tid] = src[bid * dpitch + tid];
    }
    __syncthreads();

    if (tid < dpitch) {
        // Coalesce writes from shared memory to dst
        dst[bid * spitch + tid] = sharedData[tid];
    }
}