#include "hip/hip_runtime.h"
#include "includes.h"

static const int n_el = 512;
static const size_t size = n_el * sizeof(float);

// function which invokes the kernel
__global__ void kernel_sum(const float* A, const float* B, float* C, int n_el)
{
    // Calculate the unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform tid-th elements addition using strided access when needed
    for (int idx = tid; idx < n_el; idx += blockDim.x * gridDim.x) {
        C[idx] = A[idx] + B[idx];
    }
}