#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __HIPCC__
#define KERNEL_ARGS2(grid, block) <<< grid, block >>>
#define KERNEL_ARGS3(grid, block, sh_mem) <<< grid, block, sh_mem >>>
#define KERNEL_ARGS4(grid, block, sh_mem, stream) <<< grid, block, sh_mem, stream >>>
#else
#define KERNEL_ARGS2(grid, block)
#define KERNEL_ARGS3(grid, block, sh_mem)
#define KERNEL_ARGS4(grid, block, sh_mem, stream)
#endif
float a[1024][1024], b[1024][1024], c[1024][1024];

// Optimized matrix multiplication kernel
__global__ void MMul(float *m, float *d, float *p, int n) {
    int r = blockIdx.y * blockDim.y + threadIdx.y; // row
    int c = blockIdx.x * blockDim.x + threadIdx.x; // column
    if (r < n && c < n) { // Check bounds
        float p_sum = 0;
        for (int i = 0; i < n; i++) {
            p_sum += m[r * n + i] * d[i * n + c]; // Correct accumulation operator
        }
        p[r * n + c] = p_sum;
    }
}