```c
#include "hip/hip_runtime.h"
#include "includes.h"

void printUsage(char* appName);
int parseArgs(char** argv,int* pSize,int *print,int argc);
uint64_t getTime();

__global__ void prime(int *a, int count)
{
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if the thread index is out of bounds
    if (tid >= count) return;

    // Cache the candidate number
    int can = a[tid];

    // Quick elimination for even numbers
    if (can > 2 && can % 2 == 0) 
    {
        a[tid] = 1;
        return;
    }

    // Initialize counter and calculate limit
    int counter = 3;
    float limit = sqrtf(can) + 1;

    // Loop through odd numbers only
    for (; counter <= limit; counter += 2)
    {
        if (can % counter == 0)
        {
            a[tid] = 1; // Set as non-prime
            return;
        }
    }
}