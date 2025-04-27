#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread index
    int half_length = row_length / 2;

    while (thread_id < half_length) { // Loop across the row using global thread index
        if (thread_id != 0) { // Ignore special case for index 0
            float2 val = reinterpret_cast<float2 *>(A_in + blockIdx.x * ldi)[thread_id];
            float ret = val.x * val.x + val.y * val.y;

            A_out[blockIdx.x * ldo + thread_id] = use_power ? ret : sqrtf(ret);
        }
        thread_id += gridDim.x * blockDim.x; // Move to the next element
    }

    __shared__ bool is_first_thread_done;
    if (threadIdx.x == 0) { // Ensures only one thread handles the special boundary case
        float *Ar = A_in + blockIdx.x * ldi;
        float *Aw = A_out + blockIdx.x * ldo;
        float real = Ar[0];
        float im = Ar[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
        
        is_first_thread_done = true;
    }
}