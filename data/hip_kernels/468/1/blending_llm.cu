#include "hip/hip_runtime.h"
#include "includes.h"
#define num_thread 256
#define num_block 256

__global__ void blending(float *a, float *b, float *c, float *d, int width, int height, int w, float A, float error_lm, float error_mm, int class_num)
{
    const int tid = threadIdx.x;
    const int bid = blockIdx.x;
    const int Idx = num_thread * bid + tid;
    float r_LM, r_MM, r_center_LM, r_center_MM;
    int row, column;
    int i, j;
    float sum1, sum2;
    float st = 0.0;
    int judge;
    float dis;
    float wei;
    float weih, result;
    int kk = 0;
    int rmin, rmax, smin, smax;

    // Loop optimization - improve data access pattern by coalescing
    for (int kkk = Idx; kkk < width * height; kkk += num_thread * num_block)
    {
        result = 0;
        judge = 0;
        wei = 0;
        kk = 0;
        sum1 = 0;
        sum2 = 0;
        row = kkk / width;
        column = kkk % width;
        
        r_center_LM = d[kkk] - b[kkk] + error_lm;
        r_center_MM = d[kkk] - c[kkk] + 1.412 * error_mm;

        // Avoid redundant condition checks by using min/max functions
        rmin = max(0, column - w / 2);
        rmax = min(width - 1, column + w / 2);
        smin = max(0, row - w / 2);
        smax = min(height - 1, row + w / 2);

        // Memory access optimization - reduce repeated calculations
        for (i = smin; i <= smax; i++)
            for (j = rmin; j <= rmax; j++)
            {
                float bval = b[i * width + j];
                sum1 += bval * bval;
                sum2 += bval;
            }

        st = sqrtf(sum1 / (w * w) - (sum2 / (w * w)) * (sum2 / (w * w))) / class_num;

        for (i = smin; i <= smax; i++)
            for (j = rmin; j <= rmax; j++)
            {
                float bval = b[i * width + j];
                if (fabsf(b[kkk] - bval) < st)
                {
                    r_LM = d[i * width + j] - bval;
                    r_MM = d[i * width + j] - c[i * width + j];
                    if ((r_center_LM > 0 && r_LM < r_center_LM) || (r_center_LM < 0 && r_LM > r_center_LM))
                    {
                        if ((r_center_MM > 0 && r_MM < r_center_MM) || (r_center_MM < 0 && r_MM > r_center_MM))
                        {
                            r_LM = fabsf(r_LM) + 0.0001f;
                            r_MM = fabsf(r_MM) + 0.0001f;
                            if (kkk == i * width + j)
                                judge = 1;
                                
                            dis = sqrtf(float((row - i) * (row - i) + (column - j) * (column - j))) / A + 1.0f;
                            weih = 1.0f / (dis * r_LM * r_MM);
                            wei += weih;
                            result += weih * (c[i * width + j] + b[i * width + j] - d[i * width + j]);
                            kk++;
                        }
                    }
                }
            }

        if (kk == 0)
        {
            a[kkk] = fabsf(b[kkk] + c[kkk] - d[kkk]);
            wei = 10000;
        }
        else
        {
            if (judge == 0)
            {
                dis = 1.0f;
                r_LM = fabsf(d[kkk] - b[kkk]) + 0.0001f;
                r_MM = fabsf(d[kkk] - c[kkk]) + 0.0001f;
                weih = 1.0f / (dis * r_LM * r_MM);
                result += weih * (b[kkk] + c[kkk] - d[kkk]);
                wei += weih;
            }
            a[kkk] = result / wei;
        }
    }
}