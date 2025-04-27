#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void loop()
{
    // Use of 'const' and 'unsigned int' as index won't change
    const unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Minimize printf calls; Uncomment if printing is necessary
    // printf("%d\n", i);
}
```
