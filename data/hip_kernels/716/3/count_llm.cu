#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void count(int *A, int *B, int n) {
    
    // Calculate block and thread specific parameters
    int b_id = blockIdx.x;
    int t_id = threadIdx.x;
    int t_num = blockDim.x;
    
    // Declare shared memory for counting
    __shared__ int count[MAX_VALUE];
    
    // Initialize shared memory counts to zero
    for (int i = t_id; i < MAX_VALUE; i += t_num) {
        count[i] = 0;
    }
    
    __syncthreads(); // Synchronize after initialization
    
    // Calculate the portion each thread will handle
    int b_size = (n + gridDim.x - 1) / gridDim.x; // ceil(n / b_num)
    int b_offset = b_id * b_size;
    
    for (int i = b_offset + t_id; i < n && i < b_offset + b_size; i += t_num) {
        atomicAdd(&count[A[i]], 1);
    }
    
    __syncthreads(); // Synchronize after counting phase
    
    // Copy counts from shared memory to global memory
    for (int i = t_id; i < MAX_VALUE; i += t_num) {
        B[b_id * MAX_VALUE + i] = count[i];
    }

}