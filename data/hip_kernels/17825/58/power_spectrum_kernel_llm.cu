#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate start pointers based on blockIdx.x
    const float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;

    int half_length = row_length / 2;

    // Optimize loop to skip unnecessary iterations
    for (int idx = thread_id; idx < half_length; idx += gridDim.x * blockDim.x) {
        if (idx == 0) continue; // Skip special case handled separately

        float2 val = reinterpret_cast<const float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Efficiently process special case using one thread per block
    if (thread_id == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}