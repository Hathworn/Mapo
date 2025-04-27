#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{

}

__global__ void elSq2(int N, int M, float *In, float *Out)
{
    // Use fast math operation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    if (i < N && j < M) {
        // Directly calculate index only when needed
        int index = j * N + i;
        Out[index] = __fmul_rn(In[index], In[index]);
    }
}