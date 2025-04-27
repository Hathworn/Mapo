#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    int thread_id = threadIdx.x;
    int block_id = blockIdx.x;
    float *Ar = A_in + block_id * ldi;
    float *Aw = A_out + block_id * ldo;

    int half_length = row_length / 2;
    
    // Use shared memory for better performance
    __shared__ float shared_Ar[1024]; // adjust size based on requirement
    
    for (int idx = thread_id; idx < half_length; idx += blockDim.x) {
        if (idx == 0) continue; // ignore special case
        
        shared_Ar[idx] = reinterpret_cast<float2 *>(Ar)[idx].x; // load data into shared memory
        shared_Ar[idx + half_length] = reinterpret_cast<float2 *>(Ar)[idx].y; // load data into shared memory
        
        float ret = shared_Ar[idx] * shared_Ar[idx] + shared_Ar[idx + half_length] * shared_Ar[idx + half_length];
        
        if (use_power) {
            Aw[idx] = ret; // store power
        } else {
            Aw[idx] = sqrtf(ret); // store magnitude
        }
    }

    // handle special case separately
    if (threadIdx.x == 0) {
        float real = shared_Ar[0] = Ar[0];  // load real part
        float im = shared_Ar[half_length] = Ar[row_length]; // load imaginary part
        
        if (use_power) {
            Aw[0] = real * real;
            Aw[half_length] = im * im;
        } else {
            Aw[0] = fabs(real);
            Aw[half_length] = fabs(im);
        }
    }
}