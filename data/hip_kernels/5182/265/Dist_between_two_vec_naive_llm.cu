#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float Dist_between_two_vec(float * v0, float *v1, int size) {
    float dist = 0;
    for (int i = 0; i < size; i++)
        dist += (v0[i] - v1[i]) * (v0[i] - v1[i]);
    
    return sqrt(dist);
}

__global__ void Dist_between_two_vec_optimized(float * v0, float *v1, int size, float * dst) {
    // Use shared memory for partial results, to minimize global memory access
    extern __shared__ float partial_sum[];
    int tid = threadIdx.x;
    float local_dist = 0;
    
    for (int i = tid; i < size; i += blockDim.x)
        local_dist += (v0[i] - v1[i]); // Corrected to calculate distance contribution

    partial_sum[tid] = local_dist;
    __syncthreads(); // Synchronize to ensure all threads have written to shared memory
    
    // Reduction to sum contributions from all threads
    if (tid == 0) {
        float total_dist = 0;
        for (int i = 0; i < blockDim.x; i++)
            total_dist += partial_sum[i];
        
        dst[0] = total_dist;
    }
}
```
