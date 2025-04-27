#include "hip/hip_runtime.h"
#include "includes.h"

#define GravConst 6.674e-11
#define EPS 1e-6
#define POINTS_SIZE 10

__device__ inline float sqr(float x) { return x * x; }

__global__ void calc(float* points, float* resPoints, int dt, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int tix = threadIdx.x;
    int steps = (size + 127) / 128;  // Calculate number of steps directly

    float fx, fy, fz;
    float x, y, z, m, vx, vy, vz, ax, ay, az;

    if (idx < size) {
        x = points[idx * POINTS_SIZE + 0];
        y = points[idx * POINTS_SIZE + 1];
        z = points[idx * POINTS_SIZE + 2];
        m = points[idx * POINTS_SIZE + 3];
        vx = points[idx * POINTS_SIZE + 4];
        vy = points[idx * POINTS_SIZE + 5];
        vz = points[idx * POINTS_SIZE + 6];
        ax = points[idx * POINTS_SIZE + 7];
        ay = points[idx * POINTS_SIZE + 8];
        az = points[idx * POINTS_SIZE + 9];

        for (int iteration = 0; iteration < steps; iteration++) {
            __shared__ float cached_points[128 * POINTS_SIZE];

            // Load data into shared memory with stride
            if (iteration * 128 + tix < size) {
                for (int i = 0; i < POINTS_SIZE; i++) {
                    cached_points[tix * POINTS_SIZE + i] = points[(iteration * 128 + tix) * POINTS_SIZE + i];
                }
            }
            __syncthreads();

            fx = fy = fz = 0;
            for (int i = 0; i < 128; i++) {
                int currentIdx = iteration * 128 + i;
                if (currentIdx < size && currentIdx != idx) {
                    float dx = cached_points[i * POINTS_SIZE] - x;
                    float dy = cached_points[i * POINTS_SIZE + 1] - y;
                    float dz = cached_points[i * POINTS_SIZE + 2] - z;
                    float dist = sqrt(dx * dx + dy * dy + dz * dz) + EPS;  // Added EPS directly
                    float F = (GravConst * m * cached_points[i * POINTS_SIZE + 3]) / (dist * dist);
                    fx += F * dx / dist;
                    fy += F * dy / dist;
                    fz += F * dz / dist;
                }
            }
            __syncthreads();  // Ensure all threads complete computation before global write

            resPoints[idx * POINTS_SIZE] = x + vx * dt + (ax * sqr(dt)) / 2;
            resPoints[idx * POINTS_SIZE + 1] = y + vy * dt + (ay * sqr(dt)) / 2;
            resPoints[idx * POINTS_SIZE + 2] = z + vz * dt + (az * sqr(dt)) / 2;
            resPoints[idx * POINTS_SIZE + 3] = m;
            resPoints[idx * POINTS_SIZE + 4] = vx + ax * dt;
            resPoints[idx * POINTS_SIZE + 5] = vy + ay * dt;
            resPoints[idx * POINTS_SIZE + 6] = vz + az * dt;
            resPoints[idx * POINTS_SIZE + 7] = fx / m;
            resPoints[idx * POINTS_SIZE + 8] = fy / m;
            resPoints[idx * POINTS_SIZE + 9] = fz / m;
        }
    }
}