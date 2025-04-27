#include "hip/hip_runtime.h"
#include "includes.h"

float *A, *L, *U, *input;
void arrayInit(int n);
void verifyLU(int n);
void updateLU(int n);
void freemem(int n);

__global__ void reduce(float *a, int size, int c) {
    int tid = blockIdx.x;  // Use blockIdx for row identification
    int thid = threadIdx.x; // Use threadIdx.x for column offset

    // Calculate global column index for this thread
    int global_j = c + 1 + thid; 

    // Process columns in this block with stride equal to blockDim.x
    for (; global_j < size; global_j += blockDim.x) {
        int a_idx1 = (tid + c + 1) * size + global_j;
        int a_idx2 = (tid + c + 1) * size + c;
        int a_idx3 = c * size + global_j;
        
        // Apply the reduction formula for LU decomposition
        a[a_idx1] -= a[a_idx2] * a[a_idx3];
    }
}