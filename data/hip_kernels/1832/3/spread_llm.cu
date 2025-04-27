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

// synchronize blocks
__global__ void spread(Real* src, unsigned int spitch, Real* dst, unsigned int dpitch)
{
    unsigned int bid = blockIdx.y * gridDim.x + blockIdx.x;
    unsigned int tid = threadIdx.x;

    // Use shared memory for better memory access patterns
    __shared__ Real sharedData[TILE_DIM];
    
    unsigned int index = bid * spitch + tid;
    if(tid < spitch) {
        sharedData[tid] = src[index];
    }
    __syncthreads();
    
    Real res = (tid >= spitch) ? sharedData[tid-spitch] : 0.0;
    if(tid < dpitch) {
        dst[bid * dpitch + tid] = res;
    }
}