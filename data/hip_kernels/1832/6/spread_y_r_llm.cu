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

// Global kernel function to spread elements in y-direction with optimization
__global__ void spread_y_r(Real* src, Real* dst)
{
    // Calculate the unique thread index across the grid
    unsigned int tid = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;
    unsigned int tid1 = tid + blockIdx.y * gridDim.x * blockDim.x;

    // Load source value into register for faster access
    Real res = src[tid];

    // Write source value to destination with an offset
    dst[tid1 + blockDim.x * gridDim.x] = res;

    // Set appropriate type of zero to other destination index
    dst[tid1] = (Real)0;
}