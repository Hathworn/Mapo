#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    // Calculate the offset using lane-specific indices
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure synchronization among threads using shared memory
    extern __shared__ float shared_mem[];

    int half_length = row_length / 2;
    
    // Loop through indices and optimize memory access
    for (int idx = thread_id; idx < half_length; idx += blockDim.x * gridDim.x) {
        // Ignore special case
        if (idx == 0) continue;

        // Prefetch data into shared memory
        float2 val = reinterpret_cast<float2 *>(A_in + blockIdx.x * ldi)[idx];
        shared_mem[threadIdx.x] = val.x * val.x + val.y * val.y;

        __syncthreads(); // Ensure all threads have computed their values

        if (use_power) {
            A_out[blockIdx.x * ldo + idx] = shared_mem[threadIdx.x];
        } else {
            A_out[blockIdx.x * ldo + idx] = sqrtf(shared_mem[threadIdx.x]);
        }
    }

    // Handle special case for index 0 separately
    if (threadIdx.x == 0) {
        float real = A_in[blockIdx.x * ldi];
        float im = A_in[blockIdx.x * ldi + row_length];

        if (use_power) {
            A_out[blockIdx.x * ldo] = real * real;
            A_out[blockIdx.x * ldo + half_length] = im * im;
        } else {
            A_out[blockIdx.x * ldo] = fabs(real);
            A_out[blockIdx.x * ldo + half_length] = fabs(im);
        }
    }
}