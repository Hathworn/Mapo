#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

/*** Definitions ***/
// Block width for CUDA kernels
#define BW 128
#define RANDOM_SEED -1

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

__global__ void MSELossBackprop(float *grad_data, float *output, float *target, float *mask, int batch_size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= batch_size)
        return;

    // Pre-calculate value difference
    float diff = output[idx] - target[idx];

    // Use switch statement for better readability and efficiency
    switch (__float2int_rd(mask[idx])) {
        case -1:
            grad_data[idx] = 0.05f * diff;
            break;
        case 1:
            grad_data[idx] = 5.0f * diff;
            break;
        default:
            grad_data[idx] = 0.0f;
            break;
    }
}