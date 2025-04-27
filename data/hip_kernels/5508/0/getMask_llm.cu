#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getMask(unsigned int *d_in, unsigned int *d_out, unsigned int in_size, unsigned int bit_shift, unsigned int One) {
    unsigned int index = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Check if index is within bounds
    if (index < in_size) {
        // Use ternary operator for brevity
        unsigned int bit = (d_in[index] & (1 << bit_shift)) ? 1 : 0;
        
        // Use ternary operator for clarity
        d_out[index] = One ? bit : 1 - bit;
    }
}
```

