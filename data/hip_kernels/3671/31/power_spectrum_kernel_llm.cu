#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void power_spectrum_kernel(int row_length, float *A_in, int32_t ldi, float *A_out, int32_t ldo, bool use_power) {
    // Calculate thread and block index
    int thread_id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Calculate pointers with block and thread index
    float *Ar = A_in + blockIdx.x * ldi;
    float *Aw = A_out + blockIdx.x * ldo;
    
    int half_length = row_length / 2;
    
    // Optimize loop by using single thread block instead of CU1DBLOCK
    for (int idx = thread_id; idx < half_length; idx += blockDim.x * gridDim.x) {
        // Ignore special case
        if (idx == 0) continue;
        
        // Transform and process computation of the complex number
        float2 val = reinterpret_cast<float2 *>(Ar)[idx];
        float ret = val.x * val.x + val.y * val.y;
        
        // Conditional assignment for Aw array
        Aw[idx] = use_power ? ret : sqrtf(ret);
    }
    
    // Process special case within the thread block
    if (threadIdx.x == 0) {
        float real = Ar[0];
        float im = Ar[row_length];
        
        // Conditional assignment for special indices
        Aw[0] = use_power ? real * real : fabs(real);
        Aw[half_length] = use_power ? im * im : fabs(im);
    }
}