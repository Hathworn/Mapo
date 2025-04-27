#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t sortWithCuda(int *a, size_t size, float* time);

typedef long long int64;
typedef unsigned long long uint64;

__global__ void swapOnKernel(int *a, int size)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x * 2;
    int cacheFirst, cacheSecond, cacheThird;

    for (int j = 0; j < size/2 + 1; j++) {

        if(i+1 < size) {
            cacheFirst = a[i];
            cacheSecond = a[i+1];

            // Swap if cacheFirst is greater than cacheSecond
            if(cacheFirst > cacheSecond) {
                int temp = cacheFirst;
                a[i] = cacheSecond;
                cacheSecond = a[i+1] = temp;
            }
        }

        if(i+2 < size) {
            cacheThird = a[i+2];
            
            // Swap if cacheSecond is greater than cacheThird
            if(cacheSecond > cacheThird) {
                int temp = cacheSecond;
                a[i+1] = cacheThird;
                a[i+2] = temp;
            }
        }

        __syncthreads();  // Synchronize threads after processing each segment
    }
}