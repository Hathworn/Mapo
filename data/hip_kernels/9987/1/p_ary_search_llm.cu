#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int get_index_to_check(int thread, int num_threads, int set_size, int offset) {
    return (((set_size + num_threads) / num_threads) * thread) + offset;
}

__global__ void p_ary_search(int search, int array_length, int *arr, int *ret_val) {
    const int num_threads = blockDim.x * gridDim.x;
    const int thread = blockIdx.x * blockDim.x + threadIdx.x;
    int set_size = array_length;

    if (thread == 0) {
        ret_val[0] = -1;
        ret_val[1] = 0;
    }
    __syncthreads(); // Synchronize after potential init

    while (set_size != 0) {
        int offset = ret_val[1];
        __syncthreads(); // Ensure all threads have the updated offset

        int index_to_check = get_index_to_check(thread, num_threads, set_size, offset);

        if (index_to_check < array_length) {
            int next_index_to_check = min(get_index_to_check(thread + 1, num_threads, set_size, offset), array_length - 1);

            if (search > arr[index_to_check] && search < arr[next_index_to_check]) {
                atomicExch(&ret_val[1], index_to_check); // Replace ret_val[1] safely
            } else if (search == arr[index_to_check]) {
                atomicExch(&ret_val[0], index_to_check); // Set found index atomically
            }
        }

        set_size = set_size / num_threads;
        __syncthreads(); // Sync up so no threads jump ahead
    }
}