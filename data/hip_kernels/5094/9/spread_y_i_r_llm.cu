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
__global__ void spread_y_i_r(Real* src, Real* dst)
{
    // Efficient tile-based indexing
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int idy = blockIdx.y * gridDim.x * blockDim.x;
    
    unsigned int tid = idy + idx;
    unsigned int tid1 = idy * 2 + idx;

    // Load from contiguous memory location
    dst[tid] = src[tid1];
}