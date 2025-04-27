#include "hip/hip_runtime.h"
#include "includes.h"
/*
* /usr/local/cuda/bin/nvcc -gencode arch=compute_20,code=compute_20 -o fw_kernel.ptx -ptx fw_kernel.cu
*/

extern "C" {


}
__global__ void fw(float *adj_array, int *next_array, int k, int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;

    if (i < N && j < N)
    {
        float check = adj_array[j * N + k] + adj_array[k * N + i];
        if (check < adj_array[j * N + i])
        {
            // Update only if a shorter path is found
            adj_array[j * N + i] = check;
            next_array[j * N + i] = next_array[j * N + k];
        }
    }
}