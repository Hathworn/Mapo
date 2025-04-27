#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FilmGradeKernelD(float* p_Input, float* p_Output, int p_Width, int p_Height, float p_Pivot, int p_Display) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Shared constants
    const float height = p_Height;
    const float width = p_Width;
    const float RES = width / 1920.0f;

    if (x < p_Width && y < p_Height) {
        const int index = (y * p_Width + x) * 4;
        const float X = x;
        const float Y = y;

        if (p_Display == 1) {
            p_Output[index] = (Y / height >= p_Pivot && Y / height <= p_Pivot + 0.005f * RES && fmodf(X, 2.0f) != 0.0f) ||
                              (p_Output[index] >= (Y - 5.0f * RES) / height && p_Output[index] <= (Y + 5.0f * RES) / height) ? 1.0f : 0.0f;
        } else if (p_Display == 2) {
            float overlay = (Y / height >= p_Pivot && Y / height <= p_Pivot + 0.005f * RES && fmodf(X, 2.0f) != 0.0f) ||
                            (p_Input[index] >= (Y - 5.0f * RES) / height && p_Input[index] <= (Y + 5.0f * RES) / height) ? 1.0f : 0.0f;
            p_Output[index] = overlay == 0.0f ? p_Output[index] : overlay;
        }
    }
}