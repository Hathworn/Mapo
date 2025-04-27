#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ int is_between(float a, float b, float c) {
#if between_method == 0
    return (b > a) != (c > a);
#elif between_method == 1
    return ((b <= a) && (c > a)) || ((b > a) && (c <= a));
#elif between_method == 2
    return ((a - b) == 0.0f) || ((a - b) * (a - c) < 0.0f);
#elif between_method == 3
    return ((a - b) * (a - c) < 0.0f) || (a - b == 0.0f);
#endif
}

__global__ void cn_pnpoly(int* bitmap, float2* points, int n) {
    int i = blockIdx.x * block_size_x * tile_size + threadIdx.x;
    if (i >= n) return; // Avoid unnecessary computation

    __shared__ int shared_c[tile_size * block_size_x];  // Use shared memory
    int* c = &shared_c[threadIdx.x * tile_size];

    float2 lpoints[tile_size];
#pragma unroll
    for (int ti = 0; ti < tile_size; ti++) {
        c[ti] = 0;
        if (i + block_size_x * ti < n) {
            lpoints[ti] = points[i + block_size_x * ti];
        }
    }

    int k = VERTICES - 1;
    for (int j = 0; j < VERTICES; k = j++) {
        float2 vj = d_vertices[j];
        float2 vk = d_vertices[k];

#if use_precomputed_slopes == 0
        float slope = (vk.x - vj.x) / (vk.y - vj.y);
#elif use_precomputed_slopes == 1
        float slope = d_slopes[j];
#endif

#pragma unroll
        for (int ti = 0; ti < tile_size; ti++) {
            float2 p = lpoints[ti];

#if use_method == 0
            c[ti] ^= (is_between(p.y, vj.y, vk.y) && (p.x < slope * (p.y - vj.y) + vj.x));
#elif use_method == 1
            int b = is_between(p.y, vj.y, vk.y);
            c[ti] += b & (p.x < vj.x + slope * (p.y - vj.y));
#endif
        }
    }

#pragma unroll
    for (int ti = 0; ti < tile_size; ti++) {
        if (i + block_size_x * ti < n) {
#if use_method == 0
            bitmap[i + block_size_x * ti] = c[ti];
#elif use_method == 1
            bitmap[i + block_size_x * ti] = c[ti] & 1;
#endif
        }
    }
}