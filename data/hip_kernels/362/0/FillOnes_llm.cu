#include "hip/hip_runtime.h"
#include "includes.h"

// Block width for CUDA kernels
#define BW 128

#ifdef USE_GFLAGS

#ifndef _WIN32
#define gflags google
#endif
#else
// Constant versions of gflags
#define DEFINE_int32(flag, default_value, description) const int FLAGS_##flag = (default_value)
#define DEFINE_uint64(flag, default_value, description) const unsigned long long FLAGS_##flag = (default_value)
#define DEFINE_bool(flag, default_value, description) const bool FLAGS_##flag = (default_value)
#define DEFINE_double(flag, default_value, description) const double FLAGS_##flag = (default_value)
#define DEFINE_string(flag, default_value, description) const std::string FLAGS_##flag ((default_value))
#endif

/**
* Computes ceil(x / y) for integral nonnegative values.
*/
__global__ void FillOnes(float *vec, int size)
{
    // Optimize by using shared memory
    __shared__ float sharedVec[BW];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < size) {
        sharedVec[threadIdx.x] = 1.0f;
        vec[idx] = sharedVec[threadIdx.x];
    }
}