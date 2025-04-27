#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void testKernel(float* g_idata, float* g_odata)
{
    // Use shared memory for intermediate results
    __shared__ float s_val1, s_val2;
    
    // Load global memory data into shared memory
    if (threadIdx.x == 0) {
        s_val1 = g_idata[0];
        s_val2 = g_idata[1];
    }
    __syncthreads();

    // Use registers for computation
    float result = 1.0f;
    float val1 = s_val1;
    float val2 = s_val2;

    // Perform some computations with unrolled loop
    #pragma unroll
    for (int i = 0; i < 4; ++i) { // Adjust loop count for actual workload
        result = val2 + (result * val1);
    }

    // Store result back to global memory from multiple threads reducing latency
    if (threadIdx.x == 0) {
        g_odata[0] = result;
    }
}