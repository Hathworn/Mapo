#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAddFp32(float* in0, float* in1, float* out, int cnt)
{
    // Calculate the index for the current thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure out-of-bounds memory access is prevented
    if (tid < cnt) {
        // Utilize shared memory for coalesced access and minimizing latency
        __shared__ float temp0, temp1;
        temp0 = in0[tid];
        temp1 = in1[tid];
        
        // Perform the addition and store in output
        out[tid] = temp0 + temp1;
    }
}