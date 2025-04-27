#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Unroll loop for better efficiency
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx == 0) continue; // Skip index 0 as it's a special case

        float2 val = reinterpret_cast<const float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret); // Ternary operator for concise condition
    }

    // Handle special case with thread synchronization
    __syncthreads();
    if (thread_id == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real); // Ternary operator for concise condition
        Aw[half_length] = use_power ? im * im : fabs(im); // Ternary operator for concise condition
    }
}