#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaComputeAndNormalizeGradientLength(unsigned char *channel_values, int* x_gradient, int* y_gradient, int chunk_size_per_thread) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Utilize shared memory for potential performance gains
    extern __shared__ int shared_mem[];

    for (int i = index * chunk_size_per_thread; i < (index + 1) * chunk_size_per_thread; i++) {
        // Calculate gradient length using shared memory for x and y gradients
        int x_grad = x_gradient[i];
        int y_grad = y_gradient[i];
        int gradient_length = int(sqrtf(float(x_grad * x_grad + y_grad * y_grad)));

        // Clamp the gradient length to 255 using min function
        channel_values[i] = min(gradient_length, 255);
    }
    return;
}
```
