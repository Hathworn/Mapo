#include "hip/hip_runtime.h"
#include "includes.h"

#define TB 128
#define GS(x) (((x) - 1) / TB + 1)

__global__ void fix_border_(float *input, int pad_size, int side, int size3, int size23)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < size23) {
        int x = id % size3;
        int y = id / size3;

        // Using shared memory to reduce global memory access
        __shared__ float shared_col_start[TB];
        __shared__ float shared_col_end[TB];

        if (side == 0) {
            if (threadIdx.x < pad_size) {
                shared_col_start[threadIdx.x] = input[y * size3 + pad_size];
            }
            __syncthreads();
            
            if (x < pad_size && threadIdx.x < pad_size) {
                input[id] = shared_col_start[threadIdx.x];
            }
        } else if (side == 1) {
            if (threadIdx.x < pad_size) {
                shared_col_end[threadIdx.x] = input[y * size3 + size3 - pad_size - 1];
            }
            __syncthreads();

            if (x > size3 - pad_size - 1 && threadIdx.x < pad_size) {
                input[id] = shared_col_end[threadIdx.x];
            }
        }
    }
}