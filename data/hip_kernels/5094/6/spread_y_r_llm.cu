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

// optimize by using shared memory where applicable
__global__ void spread_y_r(Real* __restrict__ src, Real* __restrict__ dst)
{
    unsigned int tid = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;
    unsigned int tid1 = tid + blockDim.x * gridDim.x * blockIdx.y;

    Real res = src[tid];
    dst[tid1 + blockDim.x * gridDim.x] = res;
#ifdef DOUBLE
    dst[tid1] = 0.;
#else
    dst[tid1] = 0.f;
#endif
}