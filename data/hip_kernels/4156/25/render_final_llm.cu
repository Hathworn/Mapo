#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void render_final(float *points3d_polar, float *selection, float *depth_render, int *img, int *render, int oh, int ow) {
    int x = blockIdx.x * TILE_DIM + threadIdx.x;
    int y = blockIdx.y * TILE_DIM + threadIdx.y;
    int w = gridDim.x * TILE_DIM;
    int h = w / 2;
    int maxsize = oh * ow;

    for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS) {
        int iw = x;
        int ih = y + j;

        // Precompute index offsets
        int index_current = (ih * w + iw) * 3;
        int index_next_w = (ih * w + iw + 1) * 3;
        int index_next_h = ((ih + 1) * w + iw) * 3;
        int index_next_wh = ((ih + 1) * w + iw + 1) * 3;

        // Precompute repeated calculations
        float half_ow = 0.5 * ow;
        float half_oh = 0.5 * oh;

        float tx_offset = ((points3d_polar[index_current + 1] + 1) / 2 * ow) - 0.5;
        float ty_offset = ((points3d_polar[index_current + 2] + 1) / 2 * oh) - 0.5;

        float dx1 = points3d_polar[index_next_w + 1] - points3d_polar[index_current + 1];
        float dy1 = points3d_polar[index_next_w + 2] - points3d_polar[index_current + 2];
        float dx2 = points3d_polar[index_next_h + 1] - points3d_polar[index_current + 1];
        float dy2 = points3d_polar[index_next_h + 2] - points3d_polar[index_current + 2];
        float dx3 = points3d_polar[index_next_wh + 1] - points3d_polar[index_current + 1];
        float dy3 = points3d_polar[index_next_wh + 2] - points3d_polar[index_current + 2];

        float tx01 = dx1 / 2 * ow;
        float ty01 = dy1 / 2 * oh;
        float tx10 = dx2 / 2 * ow;
        float ty10 = dy2 / 2 * oh;
        float tx11 = dx3 / 2 * ow;
        float ty11 = dy3 / 2 * oh;

        float t00 = tx01 * -1.0/3 + tx10 *  2.0/3 + tx11 *  1.0/3;
        float t01 = ty01 * -1.0/3 + ty10 *  2.0/3 + ty11 *  1.0/3;
        float t10 = tx01 *  2.0/3 + tx10 * -1.0/3 + tx11 *  1.0/3;
        float t11 = ty01 *  2.0/3 + ty10 * -1.0/3 + ty11 *  1.0/3;

        float det = t00 * t11 - t01 * t10 + 1e-10;
        float it00 = t11 / det;
        float it01 = -t01 / det;
        float it10 = -t10 / det;
        float it11 = t00 / det;

        int this_depth = (int)(12800 / 128 * points3d_polar[index_current]);
        int delta_add = (int)(100 * depth_render[(int)(ty_offset * ow + tx_offset)]);
        int delta00 = this_depth - delta_add;
        int delta01 = (int)(12800 / 128 * points3d_polar[index_next_w]) - delta_add;
        int delta10 = (int)(12800 / 128 * points3d_polar[index_next_h]) - delta_add;
        int delta11 = (int)(12800 / 128 * points3d_polar[index_next_wh]) - delta_add;

        int mindelta = min(min(delta00, delta01), min(delta10, delta11));
        int maxdelta = max(max(delta00, delta01), max(delta10, delta11));

        int depth00 = this_depth;
        int depth01 = (int)(12800 / 128 * points3d_polar[index_next_w]);
        int depth10 = (int)(12800 / 128 * points3d_polar[index_next_h]);
        int depth11 = (int)(12800 / 128 * points3d_polar[index_next_wh]);
        int max_depth = max(max(depth00, depth10), max(depth01, depth11));
        int min_depth = min(min(depth00, depth10), min(depth01, depth11));
        int delta_depth = max_depth - min_depth;

        int txmin = floor(tx_offset + min(min(tx01, tx11), min(tx01, tx10)));
        int txmax = ceil(tx_offset + max(max(tx01, tx11), max(tx01, tx10)));
        int tymin = floor(ty_offset + min(min(ty01, ty11), min(ty01, ty10)));
        int tymax = ceil(ty_offset + max(max(ty01, ty11), max(ty01, ty10)));

        float tolerance = max(0.1 * this_depth, 10.0f);
        float tolerance2 = max(0.05 * max_depth, 10.0f);
        float flank = 0.01;

        if ((delta_depth < tolerance2) && (y > h / 8) && (y < 7 * h / 8)) {
            if ((mindelta > -tolerance) && (maxdelta < tolerance) && (this_depth < 10000)) {
                if (((txmax - txmin) * (tymax - tymin) < 1600) && (txmax - txmin < 40) && (tymax - tymin < 40)) {
                    for (int itx = txmin; itx < txmax; itx++) {
                        for (int ity = tymin; ity < tymax; ity++) {
                            if ((0 <= itx) && (itx < ow) && (0 <= ity) && (ity < oh)) {
                                float newx = (itx - tx_offset) * it00 + it10 * (ity - ty_offset);
                                float newy = (itx - tx_offset) * it01 + it11 * (ity - ty_offset);

                                if ((newx > -flank) && (newx < 1 + flank) && (newy > -flank) && (newy < 1 + flank)) {
                                    newx = clamp(newx, 0.0f, 1.0f);
                                    newy = clamp(newy, 0.0f, 1.0f);

                                    int r = img[(ih * w + iw)] / (256 * 256) * (1-newx) * (1-newy) +
                                            img[(ih * w + iw + 1)] / (256 * 256) * (1-newx) * newy +
                                            img[((ih + 1) * w + iw)] / (256 * 256) * newx * (1-newy) +
                                            img[((ih + 1) * w + iw + 1)] / (256 * 256) * newx * newy;

                                    int g = img[(ih * w + iw)] / 256 % 256 * (1-newx) * (1-newy) +
                                            img[(ih * w + iw + 1)] / 256 % 256 * (1-newx) * newy +
                                            img[((ih + 1) * w + iw)] / 256 % 256 * newx * (1-newy) +
                                            img[((ih + 1) * w + iw + 1)] / 256 % 256 * newx * newy;

                                    int b = img[(ih * w + iw)] % 256 * (1-newx) * (1-newy) +
                                            img[(ih * w + iw + 1)] % 256 * (1-newx) * newy +
                                            img[((ih + 1) * w + iw)] % 256 * newx * (1-newy) +
                                            img[((ih + 1) * w + iw + 1)] % 256 * newx * newy;

                                    r = min(r, 255);
                                    g = min(g, 255);
                                    b = min(b, 255);

                                    if ((ity * ow + itx > 0) && (ity * ow + itx < maxsize)) {
                                        render[(ity * ow + itx)] = r * 256 * 256 + g * 256 + b;
                                        selection[(ity * ow + itx)] = 1.0 / abs(det);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}