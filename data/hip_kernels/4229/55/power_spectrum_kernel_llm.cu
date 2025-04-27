#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;
    const float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;

    int half_length = row_length / 2;
    for (int idx = thread_id; idx < half_length; idx += gridDim.x * blockDim.x) {
        // Ignore special case where idx is 0
        if (idx == 0) continue;

        float2 val = reinterpret_cast<const float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret); // Assign directly using ternary operator for optimization
    }

    // Handle special case using first thread of a block
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = use_power ? real * real : fabs(real); // Simplify condition using ternary operator
        Aw[half_length] = use_power ? im * im : fabs(im); // Simplify condition using ternary operator
    }
}