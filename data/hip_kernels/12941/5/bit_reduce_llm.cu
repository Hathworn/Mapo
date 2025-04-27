#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bit_reduce(const uint32_t *input_array, uint32_t *intBuf) {
    uint32_t i = threadIdx.x + blockDim.x * blockIdx.x;
    uint32_t a = input_array[i];

    // Precompute the address offset for copying to intBuf to minimize repeated computations
    uint8_t *bufOffset = ((uint8_t *)(&intBuf[i]) + 1);

    if (a <= 0xff) {
        intBuf[i] = 1;  // Store size directly
        *(uint8_t *)bufOffset = static_cast<uint8_t>(a);  // Use direct assignment for better performance
    } else if (a <= 0xffff) {
        intBuf[i] = 2;  // Store size directly
        *(uint16_t *)bufOffset = static_cast<uint16_t>(a);  // Use direct assignment for better performance
    } else {
        intBuf[i] = 4;  // Store size directly
        *(uint32_t *)bufOffset = a;  // Use direct assignment for better performance
    }
}