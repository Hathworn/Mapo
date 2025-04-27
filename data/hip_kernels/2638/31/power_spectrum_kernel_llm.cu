#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    extern __shared__ float shared_A_in[];  // Use shared memory for input

    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Load input data into shared memory
    for (int idx = thread_id; idx < row_length; idx += blockDim.x) {
        shared_A_in[idx] = Ar[idx];
    }
    __syncthreads();  // Synchronize threads

    // Main computation
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx == 0) continue;  // Skip special case

        float2 val = reinterpret_cast<float2 *>(shared_A_in)[idx];
        float ret = val.x * val.x + val.y * val.y;
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }

    // Handle special case
    if (thread_id == 0) {
        float real = shared_A_in[0];
        float im = shared_A_in[row_length];

        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}