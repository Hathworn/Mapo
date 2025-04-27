#include "hip/hip_runtime.h"
#include "includes.h"

#define DOUBLE

#ifdef DOUBLE
#define Complex hipfftDoubleComplex
#define Real double
#define Transform HIPFFT_Z2Z
#define TransformExec hipfftExecZ2Z
#else
#define Complex hipfftComplex
#define Real float
#define Transform HIPFFT_C2C
#define TransformExec hipfftExecC2C
#endif

#define TILE_DIM 8

// Optimized kernel to spread values
__global__ void spread_z(Real* src, Real* dst)
{
    // Calculate global thread ID
    unsigned int tid = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    // Directly access and modify the source array
    Real res = src[tid];
    src[tid + (gridDim.y * gridDim.x) * blockDim.x] = res; // Efficient indexing
#ifdef DOUBLE
    src[tid] = 0.0; // Set value
#else
    src[tid] = 0.f; // Set value
#endif
}