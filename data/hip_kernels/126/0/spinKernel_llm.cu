#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void spinKernel(unsigned long long timeout_clocks = 100000ULL)
{
    // Cache clock64 value to optimize loop
    register unsigned long long start_time = clock64();
  
    // Use a while condition to reduce branch instructions
    while(timeout_clocks == ~0ULL || clock64() - start_time <= timeout_clocks) {
        // Busy wait
    }
}