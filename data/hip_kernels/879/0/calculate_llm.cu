#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256
using namespace std;

__global__ void calculate(int *arr_in, int* arr_out, int sz, int option) {
    int ind = threadIdx.x;
    int actual_ind = blockIdx.x * blockDim.x + ind;
    extern __shared__ int shared_mem[];

    // Load data into shared memory if within bounds
    if (actual_ind < sz) {
        shared_mem[ind] = arr_in[actual_ind];
    } else {
        if (option == 0 || option == 3)
            shared_mem[ind] = 0;
        else if (option == 1) // maximum
            shared_mem[ind] = -INT_MAX;
        else // minimum
            shared_mem[ind] = INT_MAX;
    }
    __syncthreads();

    // Perform reduction using shared memory
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (ind < i) {
            if (option == 0 || option == 3)
                shared_mem[ind] += shared_mem[ind + i];
            else if (option == 1) // maximum
                shared_mem[ind] = max(shared_mem[ind], shared_mem[ind + i]);
            else // minimum
                shared_mem[ind] = min(shared_mem[ind], shared_mem[ind + i]);
        }
        __syncthreads();
    }

    // Store the result for this block in global memory
    if (ind == 0) {
        arr_out[blockIdx.x] = shared_mem[0];
    }
}