#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    // Use shared memory for performance improvement
    extern __shared__ float shared_A_in[];

    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    
    // Load input data into shared memory
    for (int idx = thread_id; idx < row_length; idx += blockDim.x) {
        shared_A_in[idx] = Ar[idx];
    }
    __syncthreads(); // Ensure all data is loaded before computation

    for (int idx = thread_id + 1; idx < half_length; idx += blockDim.x) { // Start loop from idx = 1

        float2 val = reinterpret_cast<float2 *>(shared_A_in)[idx]; // Use shared memory
        float ret = val.x * val.x + val.y * val.y;

        if (use_power) {
            Aw[idx] = ret;
        } else {
            Aw[idx] = sqrtf(ret);
        }
    }

    // Handle special case with thread 0
    if (thread_id == 0) {
        float real = shared_A_in[0];
        float im = shared_A_in[row_length];

        if (use_power) {
            Aw[0] = real * real;
            Aw[half_length] = im * im;
        } else {
            Aw[0] = fabs(real);
            Aw[half_length] = fabs(im);
        }
    }
}