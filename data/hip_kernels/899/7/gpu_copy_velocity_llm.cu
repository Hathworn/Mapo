#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void gpu_copy_velocity(const int num_atoms, const int offset, const int* g_group_contents, 
                                  const double* g_vx_i, const double* g_vy_i, const double* g_vz_i, 
                                  float* g_vx_o, float* g_vy_o, float* g_vz_o) 
{
    const int n = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Utilize shared memory for temporary storage
    __shared__ int s_group_contents[MAX_BLOCK_SIZE];
    
    if (threadIdx.x < num_atoms) {
        s_group_contents[threadIdx.x] = g_group_contents[offset + n];
    }
    __syncthreads();

    if (n < num_atoms) {
        const int m = s_group_contents[threadIdx.x]; // Access from shared memory
        g_vx_o[n] = g_vx_i[m];
        g_vy_o[n] = g_vy_i[m];
        g_vz_o[n] = g_vz_i[m];
    }
}
```
