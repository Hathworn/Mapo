#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    // Calculate global and shared index
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int block_offset = blockIdx.x * ldi;

    // Set up pointers for input and output arrays
    float *Ar = A_in + block_offset;
    float *Aw = A_out + blockIdx.x * ldo;

    if (global_idx == 0 || global_idx >= row_length / 2) return; // Skip special case and out of bound threads

    // Optimized calculation for power spectrum excluding special cases
    float2 val = reinterpret_cast<float2 *>(Ar)[global_idx];
    float ret = val.x * val.x + val.y * val.y;
    Aw[global_idx] = use_power ? ret : sqrtf(ret);

    // Single thread block handles special case
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = use_power ? real * real : fabsf(real);
        Aw[row_length / 2] = use_power ? im * im : fabsf(im);
    }
}