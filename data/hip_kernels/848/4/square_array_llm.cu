#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *ad, int N)
{
    // Utilize shared memory for faster access
    extern __shared__ float shared_ad[];
    
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int localIdx = threadIdx.x;

    // Load data into shared memory
    if (index < N) {
        shared_ad[localIdx] = ad[index];
        __syncthreads();  // Synchronize to ensure all loads are complete

        // Square the values in shared memory
        shared_ad[localIdx] *= shared_ad[localIdx];

        // Write back to global memory
        ad[index] = shared_ad[localIdx];
    }
}