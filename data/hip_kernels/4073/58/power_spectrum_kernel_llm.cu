#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;
    int total_threads = gridDim.x * blockDim.x;
    const float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;

    int half_length = row_length / 2;
    for (int idx = thread_id; idx < half_length; idx += total_threads) {
        if (idx == 0) continue;  // ignore special case

        // Load complex value and calculate magnitude
        float2 val = reinterpret_cast<const float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        
        // Store calculated power or magnitude
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Handle special case only once per block
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        // Store the power or magnitude of the DC and Nyquist components
        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}