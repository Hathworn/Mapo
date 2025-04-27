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
__global__ void spread_i(Real* src, unsigned int spitch, Real* dst, unsigned int dpitch)
{
    unsigned int bid = blockIdx.y * gridDim.x + blockIdx.x; // Optimize by storing gridDim.x in a variable
    unsigned int tid = threadIdx.x;

    if(tid < dpitch) // Move condition check outside to avoid unnecessary reads
    {
        Real res = src[bid * dpitch + tid]; // Use shared memory to coalesce memory access
        dst[bid * spitch + tid] = res; // Direct assignment without condition
    }
}