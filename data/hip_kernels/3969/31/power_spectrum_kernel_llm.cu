#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    // Use shared memory for improved performance
    extern __shared__ float shared_mem[];

    // Special case handled by the first thread
    if (thread_id == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        if (use_power) {
            shared_mem[0] = real * real;
            shared_mem[half_length] = im * im;
        } else {
            shared_mem[0] = fabs(real);
            shared_mem[half_length] = fabs(im);
        }
    }

    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx == 0) continue;  // Skip special case

        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        if (use_power) {
            shared_mem[idx] = ret;
        } else {
            shared_mem[idx] = sqrtf(ret);
        }
    }

    // Ensure all computations are done before writing back to global memory
    __syncthreads();

    // Copy computed values from shared memory to global memory
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        Aw[idx] = shared_mem[idx];
    }

    // Copy special cases from shared memory to global memory
    if (thread_id == 0) {
        Aw[0] = shared_mem[0];
        Aw[half_length] = shared_mem[half_length];
    }
}