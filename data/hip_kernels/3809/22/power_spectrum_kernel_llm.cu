#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;

    // Calculate values for each thread
    __shared__ float shared_A[CU1DBLOCK * 2]; // Shared memory for improved access

    if (thread_id < half_length) {
        float2 val = reinterpret_cast<float2 *>(Ar)[thread_id];
        shared_A[thread_id] = val.x * val.x + val.y * val.y;
    }
    __syncthreads(); // Ensure all threads have computed their results

    // Write results back to global memory
    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        Aw[idx] = shared_A[idx];
    }

    // Handle special case using thread 0
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        Aw[0] = real * real;
        Aw[half_length] = im * im;
    }
}