#include "hip/hip_runtime.h"
#include "includes.h"
#define num_thread 256
#define num_block 256

__global__ void blending_pairs(float *a, float *b, float *c, float *d, float *wei, int width, int height, int w, float A, float error_lm, float error_mm, int class_num) {
    // Calculate unique index for each thread
    const int tid = threadIdx.x;
    const int bid = blockIdx.x;
    const int Idx = num_thread * bid + tid;

    // Declare variables
    float r_LM, r_MM, r_center_LM, r_center_MM;
    int row, column;
    float sum1, sum2;
    float st = 0.0;
    int judge;
    float dis;
    float weih, result;
    int kk = 0;
    int rmin, rmax, smin, smax;

    // Iterate over the pixels assigned to each thread
    for (int kkk = Idx; kkk < width * height; kkk += num_thread * num_block) {
        result = 0;
        judge = 0;
        wei[kkk] = 0;
        kk = 0;
        sum1 = 0, sum2 = 0;
        row = kkk / width;
        column = kkk % width;
        
        // Calculate central errors
        r_center_LM = d[kkk] - b[kkk] + error_lm;
        r_center_MM = d[kkk] - c[kkk] + 1.412 * error_mm;
        
        // Determine region boundaries
        rmin = max(0, column - w / 2);
        rmax = min(width - 1, column + w / 2);
        smin = max(0, row - w / 2);
        smax = min(height - 1, row + w / 2);

        // Calculate standard deviation within the region
        for (int i = smin; i <= smax; i++) {
            for (int j = rmin; j <= rmax; j++) {
                sum1 += b[i * width + j] * b[i * width + j];
                sum2 += b[i * width + j];
            }
        }
        st = sqrt(sum1 / (w * w) - (sum2 / (w * w)) * (sum2 / (w * w))) / class_num;
        
        // Iterate over region to blend pixels
        for (int i = smin; i <= smax; i++) {
            for (int j = rmin; j <= rmax; j++) {
                if (fabs(b[kkk] - b[i * width + j]) < st) {
                    r_LM = d[i * width + j] - b[i * width + j];
                    r_MM = d[i * width + j] - c[i * width + j];
                    
                    if ((r_center_LM > 0 && r_LM < r_center_LM) || (r_center_LM < 0 && r_LM > r_center_LM)) {
                        if ((r_center_MM > 0 && r_MM < r_center_MM) || (r_center_MM < 0 && r_MM > r_center_MM)) {
                            r_LM = fabs(r_LM) + 0.0001;
                            r_MM = fabs(r_MM) + 0.0001;
                            
                            if (kkk == i * width + j) judge = 1;
                            dis = sqrt(float((row - i) * (row - i) + (column - j) * (column - j))) / A + 1.0;
                            weih = 1.0 / (dis * r_LM * r_MM);
                            wei[kkk] += weih;
                            result += weih * (c[i * width + j] + b[i * width + j] - d[i * width + j]);
                            kk++;
                        }
                    }
                }
            }
        }
        
        // Assign pixel value based on blending results
        if (kk == 0) {
            a[kkk] = fabs(b[kkk] + c[kkk] - d[kkk]) * 1000;
            wei[kkk] = 1000;
        } else {
            if (judge == 0) {
                dis = 1.0;
                r_LM = fabs(d[kkk] - b[kkk]) + 0.0001;
                r_MM = fabs(d[kkk] - c[kkk]) + 0.0001;
                weih = 1.0 / (dis * r_LM * r_MM);
                result += weih * (b[kkk] + c[kkk] - d[kkk]);
                wei[kkk] += weih;
            }
            a[kkk] = result;
        }
    }
}