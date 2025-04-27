#include "hip/hip_runtime.h"
#include "includes.h"

#define number_type unsigned long long

const int block_size = 1024; // 2**10 threads
const int thread_size = 32768 * 2 * 2; // 2**15 max elements per thread always keep even number
const number_type max_chunk_size = pow(2, 31) + pow(2, 30); // 2**31 items cause reduce ram use else failed allocations, always keep even number

hipError_t find_primes_cuda(number_type n, number_type r);

void set_one(char* dev_arr, unsigned int size);
template <typename T>
void reset(T* dev_arr, size_t count);

template <typename T>
T* device(size_t count);
template <typename T>
T* host(size_t count);
void confirmCudaNoError();
void cudaWait();
template <typename T>
T* to_host(const T* dev_ptr, size_t count, T* host_ptr = nullptr);
template <typename T>
T* to_device(const T* host_ptr, size_t count, T* dev_ptr = nullptr);

__global__ void getNextPrime(number_type* dev_temp_min_primes, int size, number_type* d_ans)
{
    // Use shared memory to reduce global memory access
    __shared__ number_type shared_mem[block_size];
    int threadId = threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Load elements into shared memory
    for (int i = threadId; i < size; i += stride) {
        shared_mem[threadId] = dev_temp_min_primes[i];
        __syncthreads();

        // Find the first non-zero element
        if (threadId == 0) {
            for (int j = 0; j < blockDim.x; ++j) {
                if (shared_mem[j] != 0) {
                    *d_ans = shared_mem[j];
                    return;
                }
            }
        }
    }
}