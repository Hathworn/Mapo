```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void frame_encode_staircase(int *data, int *pcm, int param_k, int param_m, int w_f, int packet_size)
{
    int ps = packet_size / sizeof(int);
    int x  = threadIdx.x;
    int index = param_k + blockIdx.x; // Optimize by using block index to manage loop iterations

    if (index < param_k + param_m - 1) {
        int offset = x;
        while (offset < ps) {
            data[(index+1)*ps + offset] ^= data[index*ps + offset]; // Optimize memory access patterns
            offset += blockDim.x;
        }
    }
}