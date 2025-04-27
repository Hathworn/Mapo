#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpuSum(int *prices, int *sumpricesout, int days, int seconds, int N) 
{
    // Use shared memory for better memory access efficiency
    extern __shared__ int shared_prices[];
    int currentday = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (currentday < days) 
    {
        int start = currentday * seconds;
        int end = start + seconds;

        // Load data into shared memory
        int local_totprice = 0;
        for (int j = threadIdx.x; j < seconds; j += blockDim.x) 
        {
            int index = start + j;
            if (index < end) 
            {
                shared_prices[j] = prices[index];
            }
        }
        
        __syncthreads(); // Synchronize threads after loading data to shared memory

        // Compute local total price using shared memory
        for (int j = threadIdx.x; j < seconds; j += blockDim.x) 
        {
            local_totprice += shared_prices[j];
        }

        // Use atomic addition to update the result
        atomicAdd(&sumpricesout[currentday], local_totprice);
    }
}