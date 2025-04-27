#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, const float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    const float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    
    // Using shared memory for performance improvement
    __shared__ float shared_A_in[CU1DBLOCK];
    __shared__ float shared_A_out[CU1DBLOCK];
    
    for (int idx = thread_id; idx < half_length; idx += CU1DBLOCK) {
        if (idx == 0) continue; // Avoid processing the special case in loop

        shared_A_in[thread_id] = reinterpret_cast<const float2 *>(Ar)[idx].x;
        shared_A_out[thread_id] = reinterpret_cast<const float2 *>(Ar)[idx].y;

        __syncthreads(); // Ensure all threads have loaded their data before proceeding
        
        float2 val = make_float2(shared_A_in[thread_id], shared_A_out[thread_id]);
        float ret = val.x * val.x + val.y * val.y;
        
        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
    }

    // Handle special case only once having 1 thread per block perform operation
    if (thread_id == 0) {
        float real = Ar[0];
        float im = Ar[row_length];

        if (use_power) {
            Aw[0] = real * real;
            Aw[half_length] = im * im;
        } else {
            Aw[0] = fabs(real);
            Aw[half_length] = fabs(im);
        }
    }
}