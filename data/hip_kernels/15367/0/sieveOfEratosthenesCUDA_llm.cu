#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void sieveOfEratosthenesCUDA(char *primes, uint64_t max)
{
    __shared__ int shared_flag;  // Use shared memory to store a flag

    if (threadIdx.x == 0 && threadIdx.y == 0) 
    {
        primes[0] = 1;
        primes[1] = 1;
        
        for (int j = 4; j < max; j += 2)
        {
            primes[j] = 1;
        }
    }
    else
    {
        int index = blockIdx.x * blockDim.x + threadIdx.x;
        const uint64_t maxRoot = sqrt((double)max);
        
        if (index < maxRoot && primes[index] == 0 && index > 1)
        {
            for (int j = index * index; j < max; j += index)
            {
                if (j % blockDim.x == 0) 
                {
                    if (threadIdx.x == 0)
                    {
                        shared_flag = 1;  // Set flag in shared memory
                    }
                    __syncthreads();  // Synchronize threads
                }
                
                primes[j] = 1;
            }
        }
    }
}