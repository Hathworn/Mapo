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

__global__ void getNextPrimeFast(char* dev_chunk, number_type currentValue, const number_type startValue, const number_type endValue, number_type* d_ans)
{
    // Using shared memory to reduce global memory accesses
    __shared__ bool found;
    found = false;
    __syncthreads();

    // Distribute work among threads
    for (auto i = startValue + threadIdx.x + blockIdx.x * blockDim.x; i < endValue; i += blockDim.x * gridDim.x)
    {
        // Check only if not found by any thread
        if (!found && dev_chunk[i] == 1)
        {
            *d_ans = i;
            found = true; // Update shared variable
        }
        __syncthreads(); // Ensure all threads see the update
        if (found) return; // Early exit if prime found
    }
}