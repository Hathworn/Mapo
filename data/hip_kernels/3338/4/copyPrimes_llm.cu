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

__global__ void copyPrimes(char* dev_chunk, number_type* base_index_arr, number_type* primes_arr, const number_type startValue, const number_type endValue, const int thread_size)
{
    const auto my_thread_id = blockIdx.x * block_size + threadIdx.x;
    auto my_start_value = startValue + my_thread_id * thread_size;
    auto my_end_value = my_start_value + thread_size;

    // Limit my_end_value to endValue to avoid overflow
    if (my_end_value > endValue)
    {
        my_end_value = endValue;
    }
    unsigned long index = base_index_arr[my_thread_id];

    // Initialize prime array with first prime number 2 if start value is 0
    if (my_start_value == 0)
    {
        primes_arr[index] = 2; // add first prime 2, cause all others are odd
        index++;
        my_start_value = 3; // skip processing for 0, 1, 2
    }
    else if (my_start_value % 2 == 0) // Ensure start value is odd
    {
        my_start_value += 1;
    }

    // Iterate over odd numbers only, checking prime status
    for (auto i = my_start_value; i < my_end_value; i += 2)
    {
        const auto current_status = dev_chunk[i - startValue];
        if (current_status == 1)
        {
            primes_arr[index] = i;
            index += 1; // Increment index for next prime number
        }
    }
}