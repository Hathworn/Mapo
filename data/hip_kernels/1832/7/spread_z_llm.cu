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
__global__ void spread_z(Real* src, Real* dst)
{
    unsigned int tid = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    // Utilize shared memory to reduce global memory access latency
    __shared__ Real tile[TILE_DIM];

    // Load data into shared memory
    tile[threadIdx.x] = src[tid];
    __syncthreads();

    // Write data to global memory from shared memory
    src[tid + (gridDim.y * gridDim.x) * blockDim.x] = tile[threadIdx.x];
    
    // Set the current location in source to zero
    #ifdef DOUBLE
    src[tid] = 0.0;
    #else
    src[tid] = 0.f;
    #endif
}