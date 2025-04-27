#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void RELU(int *ip, int N, int C, int H, int W){
    unsigned int input_id = blockDim.x * blockIdx.x + threadIdx.x;
    if (input_id < N * C * H * W) {  // Ensure within bounds
        int offset = input_id;
        int i = offset / (C * H * W);
        offset %= (C * H * W);
        int j = offset / (H * W);
        offset %= (H * W);
        int k = offset / W;
        int l = offset % W;

        int* addr = ip + i * C * H * W + j * H * W + k * W + l;
        int temp = *addr;
        if (temp < 0)
            *addr = 0;
    }
}