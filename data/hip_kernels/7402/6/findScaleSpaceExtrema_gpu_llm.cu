#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void addpoint() {}

__device__ unsigned int d_PointCounter[1];
__device__ float *pd[60];
__device__ float *pgpyr[72];
__device__ int temsize;
__constant__ int d_oIndex[36];

static const int BLOCK_SIZE_ONE_DIM = 32;
static const int Descript_BLOCK_SIZE = 32;

__global__ void test_gpu(int pitch, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (y < height)
    {
        pgpyr[0][y*pitch + x] += 100;
    }
    if (y*pitch + x < 5)
    {
        printf("%f\n", pd[0][y*pitch + x]);
    }
}

__global__ void findScaleSpaceExtrema_gpu(float *d_point, int p_pitch, int s, int width, int pitch, int height, const int threshold, const int nOctaveLayers, const int maxNum)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Border checks
    if (y >= height - SIFT_IMG_BORDER || x >= width - SIFT_IMG_BORDER || x < SIFT_IMG_BORDER || y < SIFT_IMG_BORDER)
        return;

    float *currptr = pd[s] + y * pitch + x;
    float *prevptr = pd[s - 1] + y * pitch + x;
    float *nextptr = pd[s + 1] + y * pitch + x;

    float val = *currptr;
    int step = pitch;

    // Neighborhood comparison for extrema
    if (std::abs(val) > threshold &&
        ((val > 0 && \
        val >= max(currptr[-1], currptr[1], currptr[-step-1], currptr[-step], currptr[-step+1], currptr[step-1], currptr[step], currptr[step+1], \
        nextptr[0], nextptr[-1], nextptr[1], nextptr[-step-1], nextptr[-step], nextptr[-step+1], nextptr[step-1], nextptr[step], nextptr[step+1], \
        prevptr[0], prevptr[-1], prevptr[1], prevptr[-step-1], prevptr[-step], prevptr[-step+1], prevptr[step-1], prevptr[step], prevptr[step+1])) || \
        (val < 0 && \
        val <= min(currptr[-1], currptr[1], currptr[-step-1], currptr[-step], currptr[-step+1], currptr[step-1], currptr[step], currptr[step+1], \
        nextptr[0], nextptr[-1], nextptr[1], nextptr[-step-1], nextptr[-step], nextptr[-step+1], nextptr[step-1], nextptr[step], nextptr[step+1], \
        prevptr[0], prevptr[-1], prevptr[1], prevptr[-step-1], prevptr[-step], prevptr[-step+1], prevptr[step-1], prevptr[step], prevptr[step+1]))))
    {
        // Use shared memory for repeated parameters
        const float img_scale = 1.f / (255 * SIFT_FIXPT_SCALE);
        const float deriv_scale = img_scale * 0.5f;
        const float second_deriv_scale = img_scale;
        const float cross_deriv_scale = img_scale * 0.25f;

        int j = 0, layer;
        float dx, dy, ds, dxx, dyy, dxy;
        float Vs = 0, Vx = 0, Vy = 0, contr = 0;

        for (; j < SIFT_MAX_INTERP_STEPS; j++)
        {
            currptr = pd[s] + y * pitch + x;
            prevptr = pd[s - 1] + y * pitch + x;
            nextptr = pd[s + 1] + y * pitch + x;

            // Calculate derivatives
            dx = (currptr[1] - currptr[-1]) * deriv_scale;
            dy = (currptr[pitch] - currptr[-pitch]) * deriv_scale;
            ds = (nextptr[0] - prevptr[0]) * deriv_scale;
            float v2 = currptr[0] * 2;

            dxx = (currptr[1] + currptr[-1] - v2) * second_deriv_scale;
            dyy = (currptr[pitch] + currptr[-pitch] - v2) * second_deriv_scale;
            float dss = (nextptr[0] + prevptr[0] - v2) * second_deriv_scale;
            dxy = (currptr[pitch+1] - currptr[1-pitch] - currptr[-1+pitch] + currptr[-pitch-1]) * cross_deriv_scale;

            float dxs = (nextptr[1] - nextptr[-1] - prevptr[1] + prevptr[-1]) * cross_deriv_scale;
            float dys = (nextptr[pitch] - nextptr[-pitch] - prevptr[pitch] + prevptr[-pitch]) * cross_deriv_scale;

            // Precompute some values
            float idxx = dyy * dss - dys * dys;
            float idxy = dys * dxs - dxy * dss;
            float idxs = dxy * dys - dyy * dxs;
            float idet = __fdividef(1.0f, idxx * dxx + idxy * dxy + idxs * dxs);
            float idyy = dxx * dss - dxs * dxs;
            float idys = dxy * dxs - dxx * dys;
            float idss = dxx * dyy - dxy * dxy;

            // Calculate offsets
            float pdx = idet * (idxx * dx + idxy * dy + idxs * ds);
            float pdy = idet * (idxy * dx + idyy * dy + idys * ds);
            float pds = idet * (idxs * dx + idys * dy + idss * ds);

            Vx = -pdx; Vy = -pdy; Vs = -pds;

            // Break condition if offsets are within 0.5
            if (std::abs(Vs) < 0.5f && std::abs(Vx) < 0.5f && std::abs(Vy) < 0.5f)
                break;

            // Update positions
            x += int(Vx > 0 ? (Vx + 0.5) : (Vx - 0.5));
            y += int(Vy > 0 ? (Vy + 0.5) : (Vy - 0.5));
            s += int(Vs > 0 ? (Vs + 0.5) : (Vs - 0.5));

            layer = s - o * (nOctaveLayers + 2);
            if (layer < 1 || layer > nOctaveLayers || y < SIFT_IMG_BORDER || y >= height - SIFT_IMG_BORDER || x < SIFT_IMG_BORDER || x >= width - SIFT_IMG_BORDER)
                return;
        }
        if (j >= SIFT_MAX_INTERP_STEPS)
            return;

        // Contrast and curvature checks
        float t = dx * Vx + dy * Vy + ds * Vs;
        contr = currptr[0] * img_scale + t * 0.5f;
        if (std::abs(contr) * nOctaveLayers < 0.04)
            return;

        float tr = dxx + dyy;
        float det = dxx * dyy - dxy * dxy;
        if (det <= 0 || tr * tr * 10 >= (10 + 1) * (10 + 1) * det)
            return;

        // Store keypoints
        unsigned int idx = atomicInc(d_PointCounter, 0x7fffffff);
        idx = (idx >= maxNum ? maxNum - 1 : idx);

        d_point[idx] = (x + Vx) * (1 << o);
        d_point[idx + p_pitch * 1] = (y + Vy) * (1 << o);
        d_point[idx + p_pitch * 2] = o + (layer<<8) + ((int)(((Vs + 0.5) * 255) + 0.5) << 16);
        float size = 1.6 * __powf(2.f, (layer + Vs) / nOctaveLayers) * (1 << o) * 2;
        d_point[idx + p_pitch * 3] = size;
        d_point[idx + p_pitch * 4] = std::abs(contr);
    }
}