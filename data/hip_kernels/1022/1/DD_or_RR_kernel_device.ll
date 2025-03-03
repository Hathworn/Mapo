; ModuleID = '../data/hip_kernels/1022/1/main.cu'
source_filename = "../data/hip_kernels/1022/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15DD_or_RR_kerneliiPfPyE5sHist = internal addrspace(3) global [720 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15DD_or_RR_kerneliiPfPy(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i64 addrspace(1)* nocapture %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = shl i32 %14, 8
  %16 = icmp slt i32 %13, %0
  %17 = add nsw i32 %15, 256
  %18 = icmp sgt i32 %17, %13
  %19 = select i1 %16, i1 %18, i1 false
  br i1 %19, label %20, label %890

20:                                               ; preds = %4
  %21 = icmp eq i32 %12, 0
  br i1 %21, label %22, label %97

22:                                               ; preds = %20, %22
  %23 = phi i32 [ %95, %22 ], [ 0, %20 ]
  %24 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %23
  store i32 0, i32 addrspace(3)* %24, align 16, !tbaa !7
  %25 = or i32 %23, 1
  %26 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %25
  store i32 0, i32 addrspace(3)* %26, align 4, !tbaa !7
  %27 = or i32 %23, 2
  %28 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %27
  store i32 0, i32 addrspace(3)* %28, align 8, !tbaa !7
  %29 = or i32 %23, 3
  %30 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %29
  store i32 0, i32 addrspace(3)* %30, align 4, !tbaa !7
  %31 = add nuw nsw i32 %23, 4
  %32 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %31
  store i32 0, i32 addrspace(3)* %32, align 16, !tbaa !7
  %33 = add nuw nsw i32 %23, 5
  %34 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %33
  store i32 0, i32 addrspace(3)* %34, align 4, !tbaa !7
  %35 = add nuw nsw i32 %23, 6
  %36 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %35
  store i32 0, i32 addrspace(3)* %36, align 8, !tbaa !7
  %37 = add nuw nsw i32 %23, 7
  %38 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %37
  store i32 0, i32 addrspace(3)* %38, align 4, !tbaa !7
  %39 = add nuw nsw i32 %23, 8
  %40 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %39
  store i32 0, i32 addrspace(3)* %40, align 16, !tbaa !7
  %41 = add nuw nsw i32 %23, 9
  %42 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %41
  store i32 0, i32 addrspace(3)* %42, align 4, !tbaa !7
  %43 = add nuw nsw i32 %23, 10
  %44 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %43
  store i32 0, i32 addrspace(3)* %44, align 8, !tbaa !7
  %45 = add nuw nsw i32 %23, 11
  %46 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %45
  store i32 0, i32 addrspace(3)* %46, align 4, !tbaa !7
  %47 = add nuw nsw i32 %23, 12
  %48 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %47
  store i32 0, i32 addrspace(3)* %48, align 16, !tbaa !7
  %49 = add nuw nsw i32 %23, 13
  %50 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %49
  store i32 0, i32 addrspace(3)* %50, align 4, !tbaa !7
  %51 = add nuw nsw i32 %23, 14
  %52 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %51
  store i32 0, i32 addrspace(3)* %52, align 8, !tbaa !7
  %53 = add nuw nsw i32 %23, 15
  %54 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %53
  store i32 0, i32 addrspace(3)* %54, align 4, !tbaa !7
  %55 = add nuw nsw i32 %23, 16
  %56 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %55
  store i32 0, i32 addrspace(3)* %56, align 16, !tbaa !7
  %57 = add nuw nsw i32 %23, 17
  %58 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %57
  store i32 0, i32 addrspace(3)* %58, align 4, !tbaa !7
  %59 = add nuw nsw i32 %23, 18
  %60 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %59
  store i32 0, i32 addrspace(3)* %60, align 8, !tbaa !7
  %61 = add nuw nsw i32 %23, 19
  %62 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %61
  store i32 0, i32 addrspace(3)* %62, align 4, !tbaa !7
  %63 = add nuw nsw i32 %23, 20
  %64 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %63
  store i32 0, i32 addrspace(3)* %64, align 16, !tbaa !7
  %65 = add nuw nsw i32 %23, 21
  %66 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %65
  store i32 0, i32 addrspace(3)* %66, align 4, !tbaa !7
  %67 = add nuw nsw i32 %23, 22
  %68 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %67
  store i32 0, i32 addrspace(3)* %68, align 8, !tbaa !7
  %69 = add nuw nsw i32 %23, 23
  %70 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %69
  store i32 0, i32 addrspace(3)* %70, align 4, !tbaa !7
  %71 = add nuw nsw i32 %23, 24
  %72 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %71
  store i32 0, i32 addrspace(3)* %72, align 16, !tbaa !7
  %73 = add nuw nsw i32 %23, 25
  %74 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %73
  store i32 0, i32 addrspace(3)* %74, align 4, !tbaa !7
  %75 = add nuw nsw i32 %23, 26
  %76 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %75
  store i32 0, i32 addrspace(3)* %76, align 8, !tbaa !7
  %77 = add nuw nsw i32 %23, 27
  %78 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %77
  store i32 0, i32 addrspace(3)* %78, align 4, !tbaa !7
  %79 = add nuw nsw i32 %23, 28
  %80 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %79
  store i32 0, i32 addrspace(3)* %80, align 16, !tbaa !7
  %81 = add nuw nsw i32 %23, 29
  %82 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %81
  store i32 0, i32 addrspace(3)* %82, align 4, !tbaa !7
  %83 = add nuw nsw i32 %23, 30
  %84 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %83
  store i32 0, i32 addrspace(3)* %84, align 8, !tbaa !7
  %85 = add nuw nsw i32 %23, 31
  %86 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %85
  store i32 0, i32 addrspace(3)* %86, align 4, !tbaa !7
  %87 = add nuw nsw i32 %23, 32
  %88 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %87
  store i32 0, i32 addrspace(3)* %88, align 16, !tbaa !7
  %89 = add nuw nsw i32 %23, 33
  %90 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %89
  store i32 0, i32 addrspace(3)* %90, align 4, !tbaa !7
  %91 = add nuw nsw i32 %23, 34
  %92 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %91
  store i32 0, i32 addrspace(3)* %92, align 8, !tbaa !7
  %93 = add nuw nsw i32 %23, 35
  %94 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %93
  store i32 0, i32 addrspace(3)* %94, align 4, !tbaa !7
  %95 = add nuw nsw i32 %23, 36
  %96 = icmp eq i32 %95, 720
  br i1 %96, label %97, label %22, !llvm.loop !11

97:                                               ; preds = %22, %20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %98 = shl nsw i32 %13, 1
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !13, !amdgpu.noclobber !5
  %102 = add nuw nsw i32 %98, 1
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !13, !amdgpu.noclobber !5
  %106 = sub nsw i32 %13, %15
  %107 = tail call i32 @llvm.smax.i32(i32 %106, i32 -1)
  %108 = sub nsw i32 %1, %15
  %109 = tail call i32 @llvm.smin.i32(i32 %108, i32 256)
  %110 = add nsw i32 %107, 1
  %111 = icmp slt i32 %110, %109
  br i1 %111, label %112, label %256

112:                                              ; preds = %97
  %113 = tail call float @llvm.fabs.f32(float %105)
  %114 = fcmp olt float %113, 1.310720e+05
  %115 = bitcast float %113 to i32
  %116 = lshr i32 %115, 23
  %117 = and i32 %115, 8388607
  %118 = or i32 %117, 8388608
  %119 = zext i32 %118 to i64
  %120 = mul nuw nsw i64 %119, 4266746795
  %121 = trunc i64 %120 to i32
  %122 = lshr i64 %120, 32
  %123 = mul nuw nsw i64 %119, 1011060801
  %124 = add nuw nsw i64 %122, %123
  %125 = trunc i64 %124 to i32
  %126 = lshr i64 %124, 32
  %127 = mul nuw nsw i64 %119, 3680671129
  %128 = add nuw nsw i64 %126, %127
  %129 = trunc i64 %128 to i32
  %130 = lshr i64 %128, 32
  %131 = mul nuw nsw i64 %119, 4113882560
  %132 = add nuw nsw i64 %130, %131
  %133 = trunc i64 %132 to i32
  %134 = lshr i64 %132, 32
  %135 = mul nuw nsw i64 %119, 4230436817
  %136 = add nuw nsw i64 %134, %135
  %137 = trunc i64 %136 to i32
  %138 = lshr i64 %136, 32
  %139 = mul nuw nsw i64 %119, 1313084713
  %140 = add nuw nsw i64 %138, %139
  %141 = trunc i64 %140 to i32
  %142 = lshr i64 %140, 32
  %143 = mul nuw nsw i64 %119, 2734261102
  %144 = add nuw nsw i64 %142, %143
  %145 = trunc i64 %144 to i32
  %146 = lshr i64 %144, 32
  %147 = trunc i64 %146 to i32
  %148 = add nsw i32 %116, -120
  %149 = icmp ugt i32 %148, 63
  %150 = select i1 %149, i32 %141, i32 %147
  %151 = select i1 %149, i32 %137, i32 %145
  %152 = select i1 %149, i32 %133, i32 %141
  %153 = select i1 %149, i32 %129, i32 %137
  %154 = select i1 %149, i32 %125, i32 %133
  %155 = select i1 %149, i32 %121, i32 %129
  %156 = select i1 %149, i32 -64, i32 0
  %157 = add nsw i32 %156, %148
  %158 = icmp ugt i32 %157, 31
  %159 = select i1 %158, i32 %151, i32 %150
  %160 = select i1 %158, i32 %152, i32 %151
  %161 = select i1 %158, i32 %153, i32 %152
  %162 = select i1 %158, i32 %154, i32 %153
  %163 = select i1 %158, i32 %155, i32 %154
  %164 = select i1 %158, i32 -32, i32 0
  %165 = add nsw i32 %164, %157
  %166 = icmp ugt i32 %165, 31
  %167 = select i1 %166, i32 %160, i32 %159
  %168 = select i1 %166, i32 %161, i32 %160
  %169 = select i1 %166, i32 %162, i32 %161
  %170 = select i1 %166, i32 %163, i32 %162
  %171 = select i1 %166, i32 -32, i32 0
  %172 = add nsw i32 %171, %165
  %173 = icmp eq i32 %172, 0
  %174 = sub nsw i32 32, %172
  %175 = tail call i32 @llvm.fshr.i32(i32 %167, i32 %168, i32 %174)
  %176 = tail call i32 @llvm.fshr.i32(i32 %168, i32 %169, i32 %174)
  %177 = tail call i32 @llvm.fshr.i32(i32 %169, i32 %170, i32 %174)
  %178 = select i1 %173, i32 %167, i32 %175
  %179 = select i1 %173, i32 %168, i32 %176
  %180 = select i1 %173, i32 %169, i32 %177
  %181 = lshr i32 %178, 29
  %182 = tail call i32 @llvm.fshl.i32(i32 %178, i32 %179, i32 2)
  %183 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %180, i32 2)
  %184 = tail call i32 @llvm.fshl.i32(i32 %180, i32 %170, i32 2)
  %185 = and i32 %181, 1
  %186 = sub nsw i32 0, %185
  %187 = shl i32 %181, 31
  %188 = xor i32 %182, %186
  %189 = xor i32 %183, %186
  %190 = xor i32 %184, %186
  %191 = tail call i32 @llvm.ctlz.i32(i32 %188, i1 false), !range !15
  %192 = sub nsw i32 31, %191
  %193 = tail call i32 @llvm.fshr.i32(i32 %188, i32 %189, i32 %192)
  %194 = tail call i32 @llvm.fshr.i32(i32 %189, i32 %190, i32 %192)
  %195 = shl nuw nsw i32 %191, 23
  %196 = sub nuw nsw i32 1056964608, %195
  %197 = lshr i32 %193, 9
  %198 = or i32 %197, %196
  %199 = or i32 %198, %187
  %200 = bitcast i32 %199 to float
  %201 = tail call i32 @llvm.fshl.i32(i32 %193, i32 %194, i32 23)
  %202 = tail call i32 @llvm.ctlz.i32(i32 %201, i1 false), !range !15
  %203 = fmul float %200, 0x3FF921FB40000000
  %204 = add nuw nsw i32 %202, %191
  %205 = shl nuw nsw i32 %204, 23
  %206 = sub nuw nsw i32 855638016, %205
  %207 = sub nsw i32 31, %202
  %208 = tail call i32 @llvm.fshr.i32(i32 %201, i32 %194, i32 %207)
  %209 = lshr i32 %208, 9
  %210 = or i32 %206, %209
  %211 = or i32 %210, %187
  %212 = bitcast i32 %211 to float
  %213 = fneg float %203
  %214 = tail call float @llvm.fma.f32(float %200, float 0x3FF921FB40000000, float %213)
  %215 = tail call float @llvm.fma.f32(float %200, float 0x3E74442D00000000, float %214)
  %216 = tail call float @llvm.fma.f32(float %212, float 0x3FF921FB40000000, float %215)
  %217 = fadd float %203, %216
  %218 = lshr i32 %178, 30
  %219 = add nuw nsw i32 %185, %218
  %220 = fmul float %113, 0x3FE45F3060000000
  %221 = tail call float @llvm.rint.f32(float %220)
  %222 = tail call float @llvm.fma.f32(float %221, float 0xBFF921FB40000000, float %113)
  %223 = tail call float @llvm.fma.f32(float %221, float 0xBE74442D00000000, float %222)
  %224 = tail call float @llvm.fma.f32(float %221, float 0xBCF8469880000000, float %223)
  %225 = fptosi float %221 to i32
  %226 = bitcast float %105 to i32
  %227 = tail call i1 @llvm.amdgcn.class.f32(float %113, i32 504)
  %228 = select i1 %114, float %224, float %217
  %229 = select i1 %114, i32 %225, i32 %219
  %230 = fmul float %228, %228
  %231 = tail call float @llvm.fmuladd.f32(float %230, float 0xBF29833040000000, float 0x3F81103880000000)
  %232 = tail call float @llvm.fmuladd.f32(float %230, float %231, float 0xBFC55553A0000000)
  %233 = fmul float %230, %232
  %234 = tail call float @llvm.fmuladd.f32(float %228, float %233, float %228)
  %235 = tail call float @llvm.fmuladd.f32(float %230, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %236 = tail call float @llvm.fmuladd.f32(float %230, float %235, float 0x3FA5557EE0000000)
  %237 = tail call float @llvm.fmuladd.f32(float %230, float %236, float 0xBFE0000080000000)
  %238 = tail call float @llvm.fmuladd.f32(float %230, float %237, float 1.000000e+00)
  %239 = and i32 %229, 1
  %240 = icmp eq i32 %239, 0
  %241 = select i1 %240, float %234, float %238
  %242 = bitcast float %241 to i32
  %243 = shl i32 %229, 30
  %244 = and i32 %243, -2147483648
  %245 = xor i32 %226, %242
  %246 = xor i32 %245, %115
  %247 = xor i32 %246, %244
  %248 = bitcast i32 %247 to float
  %249 = select i1 %227, float %248, float 0x7FF8000000000000
  %250 = fneg float %234
  %251 = select i1 %240, float %238, float %250
  %252 = bitcast float %251 to i32
  %253 = xor i32 %244, %252
  %254 = bitcast i32 %253 to float
  %255 = select i1 %227, float %254, float 0x7FF8000000000000
  br label %257

256:                                              ; preds = %663, %97
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %21, label %719, label %890

257:                                              ; preds = %112, %663
  %258 = phi i32 [ %110, %112 ], [ %717, %663 ]
  %259 = add nsw i32 %258, %15
  %260 = shl nsw i32 %259, 1
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds float, float addrspace(1)* %2, i64 %261
  %263 = load float, float addrspace(1)* %262, align 4, !tbaa !13, !amdgpu.noclobber !5
  %264 = add nuw nsw i32 %260, 1
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds float, float addrspace(1)* %2, i64 %265
  %267 = load float, float addrspace(1)* %266, align 4, !tbaa !13, !amdgpu.noclobber !5
  %268 = tail call float @llvm.fabs.f32(float %267)
  %269 = fcmp olt float %268, 1.310720e+05
  br i1 %269, label %270, label %278

270:                                              ; preds = %257
  %271 = fmul float %268, 0x3FE45F3060000000
  %272 = tail call float @llvm.rint.f32(float %271)
  %273 = tail call float @llvm.fma.f32(float %272, float 0xBFF921FB40000000, float %268)
  %274 = tail call float @llvm.fma.f32(float %272, float 0xBE74442D00000000, float %273)
  %275 = tail call float @llvm.fma.f32(float %272, float 0xBCF8469880000000, float %274)
  %276 = fptosi float %272 to i32
  %277 = bitcast float %268 to i32
  br label %384

278:                                              ; preds = %257
  %279 = bitcast float %268 to i32
  %280 = lshr i32 %279, 23
  %281 = and i32 %279, 8388607
  %282 = or i32 %281, 8388608
  %283 = zext i32 %282 to i64
  %284 = mul nuw nsw i64 %283, 4266746795
  %285 = trunc i64 %284 to i32
  %286 = lshr i64 %284, 32
  %287 = mul nuw nsw i64 %283, 1011060801
  %288 = add nuw nsw i64 %286, %287
  %289 = trunc i64 %288 to i32
  %290 = lshr i64 %288, 32
  %291 = mul nuw nsw i64 %283, 3680671129
  %292 = add nuw nsw i64 %290, %291
  %293 = trunc i64 %292 to i32
  %294 = lshr i64 %292, 32
  %295 = mul nuw nsw i64 %283, 4113882560
  %296 = add nuw nsw i64 %294, %295
  %297 = trunc i64 %296 to i32
  %298 = lshr i64 %296, 32
  %299 = mul nuw nsw i64 %283, 4230436817
  %300 = add nuw nsw i64 %298, %299
  %301 = trunc i64 %300 to i32
  %302 = lshr i64 %300, 32
  %303 = mul nuw nsw i64 %283, 1313084713
  %304 = add nuw nsw i64 %302, %303
  %305 = trunc i64 %304 to i32
  %306 = lshr i64 %304, 32
  %307 = mul nuw nsw i64 %283, 2734261102
  %308 = add nuw nsw i64 %306, %307
  %309 = trunc i64 %308 to i32
  %310 = lshr i64 %308, 32
  %311 = trunc i64 %310 to i32
  %312 = add nsw i32 %280, -120
  %313 = icmp ugt i32 %312, 63
  %314 = select i1 %313, i32 %305, i32 %311
  %315 = select i1 %313, i32 %301, i32 %309
  %316 = select i1 %313, i32 %297, i32 %305
  %317 = select i1 %313, i32 %293, i32 %301
  %318 = select i1 %313, i32 %289, i32 %297
  %319 = select i1 %313, i32 %285, i32 %293
  %320 = select i1 %313, i32 -64, i32 0
  %321 = add nsw i32 %320, %312
  %322 = icmp ugt i32 %321, 31
  %323 = select i1 %322, i32 %315, i32 %314
  %324 = select i1 %322, i32 %316, i32 %315
  %325 = select i1 %322, i32 %317, i32 %316
  %326 = select i1 %322, i32 %318, i32 %317
  %327 = select i1 %322, i32 %319, i32 %318
  %328 = select i1 %322, i32 -32, i32 0
  %329 = add nsw i32 %328, %321
  %330 = icmp ugt i32 %329, 31
  %331 = select i1 %330, i32 %324, i32 %323
  %332 = select i1 %330, i32 %325, i32 %324
  %333 = select i1 %330, i32 %326, i32 %325
  %334 = select i1 %330, i32 %327, i32 %326
  %335 = select i1 %330, i32 -32, i32 0
  %336 = add nsw i32 %335, %329
  %337 = icmp eq i32 %336, 0
  %338 = sub nsw i32 32, %336
  %339 = tail call i32 @llvm.fshr.i32(i32 %331, i32 %332, i32 %338)
  %340 = tail call i32 @llvm.fshr.i32(i32 %332, i32 %333, i32 %338)
  %341 = tail call i32 @llvm.fshr.i32(i32 %333, i32 %334, i32 %338)
  %342 = select i1 %337, i32 %331, i32 %339
  %343 = select i1 %337, i32 %332, i32 %340
  %344 = select i1 %337, i32 %333, i32 %341
  %345 = lshr i32 %342, 29
  %346 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %343, i32 2)
  %347 = tail call i32 @llvm.fshl.i32(i32 %343, i32 %344, i32 2)
  %348 = tail call i32 @llvm.fshl.i32(i32 %344, i32 %334, i32 2)
  %349 = and i32 %345, 1
  %350 = sub nsw i32 0, %349
  %351 = shl i32 %345, 31
  %352 = xor i32 %346, %350
  %353 = xor i32 %347, %350
  %354 = xor i32 %348, %350
  %355 = tail call i32 @llvm.ctlz.i32(i32 %352, i1 false), !range !15
  %356 = sub nsw i32 31, %355
  %357 = tail call i32 @llvm.fshr.i32(i32 %352, i32 %353, i32 %356)
  %358 = tail call i32 @llvm.fshr.i32(i32 %353, i32 %354, i32 %356)
  %359 = shl nuw nsw i32 %355, 23
  %360 = sub nuw nsw i32 1056964608, %359
  %361 = lshr i32 %357, 9
  %362 = or i32 %361, %360
  %363 = or i32 %362, %351
  %364 = bitcast i32 %363 to float
  %365 = tail call i32 @llvm.fshl.i32(i32 %357, i32 %358, i32 23)
  %366 = tail call i32 @llvm.ctlz.i32(i32 %365, i1 false), !range !15
  %367 = fmul float %364, 0x3FF921FB40000000
  %368 = add nuw nsw i32 %366, %355
  %369 = shl nuw nsw i32 %368, 23
  %370 = sub nuw nsw i32 855638016, %369
  %371 = sub nsw i32 31, %366
  %372 = tail call i32 @llvm.fshr.i32(i32 %365, i32 %358, i32 %371)
  %373 = lshr i32 %372, 9
  %374 = or i32 %370, %373
  %375 = or i32 %374, %351
  %376 = bitcast i32 %375 to float
  %377 = fneg float %367
  %378 = tail call float @llvm.fma.f32(float %364, float 0x3FF921FB40000000, float %377)
  %379 = tail call float @llvm.fma.f32(float %364, float 0x3E74442D00000000, float %378)
  %380 = tail call float @llvm.fma.f32(float %376, float 0x3FF921FB40000000, float %379)
  %381 = fadd float %367, %380
  %382 = lshr i32 %342, 30
  %383 = add nuw nsw i32 %349, %382
  br label %384

384:                                              ; preds = %270, %278
  %385 = phi i32 [ %277, %270 ], [ %279, %278 ]
  %386 = phi float [ %275, %270 ], [ %381, %278 ]
  %387 = phi i32 [ %276, %270 ], [ %383, %278 ]
  %388 = fmul float %386, %386
  %389 = tail call float @llvm.fmuladd.f32(float %388, float 0xBF29833040000000, float 0x3F81103880000000)
  %390 = tail call float @llvm.fmuladd.f32(float %388, float %389, float 0xBFC55553A0000000)
  %391 = fmul float %388, %390
  %392 = tail call float @llvm.fmuladd.f32(float %386, float %391, float %386)
  %393 = tail call float @llvm.fmuladd.f32(float %388, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %394 = tail call float @llvm.fmuladd.f32(float %388, float %393, float 0x3FA5557EE0000000)
  %395 = tail call float @llvm.fmuladd.f32(float %388, float %394, float 0xBFE0000080000000)
  %396 = tail call float @llvm.fmuladd.f32(float %388, float %395, float 1.000000e+00)
  %397 = and i32 %387, 1
  %398 = icmp eq i32 %397, 0
  %399 = select i1 %398, float %392, float %396
  %400 = bitcast float %399 to i32
  %401 = shl i32 %387, 30
  %402 = and i32 %401, -2147483648
  %403 = bitcast float %267 to i32
  %404 = xor i32 %385, %403
  %405 = xor i32 %404, %402
  %406 = xor i32 %405, %400
  %407 = bitcast i32 %406 to float
  %408 = tail call i1 @llvm.amdgcn.class.f32(float %268, i32 504)
  %409 = select i1 %408, float %407, float 0x7FF8000000000000
  %410 = fmul contract float %249, %409
  br i1 %269, label %411, label %418

411:                                              ; preds = %384
  %412 = fmul float %268, 0x3FE45F3060000000
  %413 = tail call float @llvm.rint.f32(float %412)
  %414 = tail call float @llvm.fma.f32(float %413, float 0xBFF921FB40000000, float %268)
  %415 = tail call float @llvm.fma.f32(float %413, float 0xBE74442D00000000, float %414)
  %416 = tail call float @llvm.fma.f32(float %413, float 0xBCF8469880000000, float %415)
  %417 = fptosi float %413 to i32
  br label %524

418:                                              ; preds = %384
  %419 = bitcast float %268 to i32
  %420 = lshr i32 %419, 23
  %421 = and i32 %419, 8388607
  %422 = or i32 %421, 8388608
  %423 = zext i32 %422 to i64
  %424 = mul nuw nsw i64 %423, 4266746795
  %425 = trunc i64 %424 to i32
  %426 = lshr i64 %424, 32
  %427 = mul nuw nsw i64 %423, 1011060801
  %428 = add nuw nsw i64 %426, %427
  %429 = trunc i64 %428 to i32
  %430 = lshr i64 %428, 32
  %431 = mul nuw nsw i64 %423, 3680671129
  %432 = add nuw nsw i64 %430, %431
  %433 = trunc i64 %432 to i32
  %434 = lshr i64 %432, 32
  %435 = mul nuw nsw i64 %423, 4113882560
  %436 = add nuw nsw i64 %434, %435
  %437 = trunc i64 %436 to i32
  %438 = lshr i64 %436, 32
  %439 = mul nuw nsw i64 %423, 4230436817
  %440 = add nuw nsw i64 %438, %439
  %441 = trunc i64 %440 to i32
  %442 = lshr i64 %440, 32
  %443 = mul nuw nsw i64 %423, 1313084713
  %444 = add nuw nsw i64 %442, %443
  %445 = trunc i64 %444 to i32
  %446 = lshr i64 %444, 32
  %447 = mul nuw nsw i64 %423, 2734261102
  %448 = add nuw nsw i64 %446, %447
  %449 = trunc i64 %448 to i32
  %450 = lshr i64 %448, 32
  %451 = trunc i64 %450 to i32
  %452 = add nsw i32 %420, -120
  %453 = icmp ugt i32 %452, 63
  %454 = select i1 %453, i32 %445, i32 %451
  %455 = select i1 %453, i32 %441, i32 %449
  %456 = select i1 %453, i32 %437, i32 %445
  %457 = select i1 %453, i32 %433, i32 %441
  %458 = select i1 %453, i32 %429, i32 %437
  %459 = select i1 %453, i32 %425, i32 %433
  %460 = select i1 %453, i32 -64, i32 0
  %461 = add nsw i32 %460, %452
  %462 = icmp ugt i32 %461, 31
  %463 = select i1 %462, i32 %455, i32 %454
  %464 = select i1 %462, i32 %456, i32 %455
  %465 = select i1 %462, i32 %457, i32 %456
  %466 = select i1 %462, i32 %458, i32 %457
  %467 = select i1 %462, i32 %459, i32 %458
  %468 = select i1 %462, i32 -32, i32 0
  %469 = add nsw i32 %468, %461
  %470 = icmp ugt i32 %469, 31
  %471 = select i1 %470, i32 %464, i32 %463
  %472 = select i1 %470, i32 %465, i32 %464
  %473 = select i1 %470, i32 %466, i32 %465
  %474 = select i1 %470, i32 %467, i32 %466
  %475 = select i1 %470, i32 -32, i32 0
  %476 = add nsw i32 %475, %469
  %477 = icmp eq i32 %476, 0
  %478 = sub nsw i32 32, %476
  %479 = tail call i32 @llvm.fshr.i32(i32 %471, i32 %472, i32 %478)
  %480 = tail call i32 @llvm.fshr.i32(i32 %472, i32 %473, i32 %478)
  %481 = tail call i32 @llvm.fshr.i32(i32 %473, i32 %474, i32 %478)
  %482 = select i1 %477, i32 %471, i32 %479
  %483 = select i1 %477, i32 %472, i32 %480
  %484 = select i1 %477, i32 %473, i32 %481
  %485 = lshr i32 %482, 29
  %486 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %483, i32 2)
  %487 = tail call i32 @llvm.fshl.i32(i32 %483, i32 %484, i32 2)
  %488 = tail call i32 @llvm.fshl.i32(i32 %484, i32 %474, i32 2)
  %489 = and i32 %485, 1
  %490 = sub nsw i32 0, %489
  %491 = shl i32 %485, 31
  %492 = xor i32 %486, %490
  %493 = xor i32 %487, %490
  %494 = xor i32 %488, %490
  %495 = tail call i32 @llvm.ctlz.i32(i32 %492, i1 false), !range !15
  %496 = sub nsw i32 31, %495
  %497 = tail call i32 @llvm.fshr.i32(i32 %492, i32 %493, i32 %496)
  %498 = tail call i32 @llvm.fshr.i32(i32 %493, i32 %494, i32 %496)
  %499 = shl nuw nsw i32 %495, 23
  %500 = sub nuw nsw i32 1056964608, %499
  %501 = lshr i32 %497, 9
  %502 = or i32 %501, %500
  %503 = or i32 %502, %491
  %504 = bitcast i32 %503 to float
  %505 = tail call i32 @llvm.fshl.i32(i32 %497, i32 %498, i32 23)
  %506 = tail call i32 @llvm.ctlz.i32(i32 %505, i1 false), !range !15
  %507 = fmul float %504, 0x3FF921FB40000000
  %508 = add nuw nsw i32 %506, %495
  %509 = shl nuw nsw i32 %508, 23
  %510 = sub nuw nsw i32 855638016, %509
  %511 = sub nsw i32 31, %506
  %512 = tail call i32 @llvm.fshr.i32(i32 %505, i32 %498, i32 %511)
  %513 = lshr i32 %512, 9
  %514 = or i32 %510, %513
  %515 = or i32 %514, %491
  %516 = bitcast i32 %515 to float
  %517 = fneg float %507
  %518 = tail call float @llvm.fma.f32(float %504, float 0x3FF921FB40000000, float %517)
  %519 = tail call float @llvm.fma.f32(float %504, float 0x3E74442D00000000, float %518)
  %520 = tail call float @llvm.fma.f32(float %516, float 0x3FF921FB40000000, float %519)
  %521 = fadd float %507, %520
  %522 = lshr i32 %482, 30
  %523 = add nuw nsw i32 %489, %522
  br label %524

524:                                              ; preds = %411, %418
  %525 = phi float [ %416, %411 ], [ %521, %418 ]
  %526 = phi i32 [ %417, %411 ], [ %523, %418 ]
  %527 = fmul float %525, %525
  %528 = tail call float @llvm.fmuladd.f32(float %527, float 0xBF29833040000000, float 0x3F81103880000000)
  %529 = tail call float @llvm.fmuladd.f32(float %527, float %528, float 0xBFC55553A0000000)
  %530 = fmul float %527, %529
  %531 = tail call float @llvm.fmuladd.f32(float %525, float %530, float %525)
  %532 = tail call float @llvm.fmuladd.f32(float %527, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %533 = tail call float @llvm.fmuladd.f32(float %527, float %532, float 0x3FA5557EE0000000)
  %534 = tail call float @llvm.fmuladd.f32(float %527, float %533, float 0xBFE0000080000000)
  %535 = tail call float @llvm.fmuladd.f32(float %527, float %534, float 1.000000e+00)
  %536 = fneg float %531
  %537 = and i32 %526, 1
  %538 = icmp eq i32 %537, 0
  %539 = select i1 %538, float %535, float %536
  %540 = bitcast float %539 to i32
  %541 = shl i32 %526, 30
  %542 = and i32 %541, -2147483648
  %543 = xor i32 %542, %540
  %544 = bitcast i32 %543 to float
  %545 = select i1 %408, float %544, float 0x7FF8000000000000
  %546 = fmul contract float %255, %545
  %547 = fsub contract float %101, %263
  %548 = tail call float @llvm.fabs.f32(float %547)
  %549 = fcmp olt float %548, 1.310720e+05
  br i1 %549, label %550, label %557

550:                                              ; preds = %524
  %551 = fmul float %548, 0x3FE45F3060000000
  %552 = tail call float @llvm.rint.f32(float %551)
  %553 = tail call float @llvm.fma.f32(float %552, float 0xBFF921FB40000000, float %548)
  %554 = tail call float @llvm.fma.f32(float %552, float 0xBE74442D00000000, float %553)
  %555 = tail call float @llvm.fma.f32(float %552, float 0xBCF8469880000000, float %554)
  %556 = fptosi float %552 to i32
  br label %663

557:                                              ; preds = %524
  %558 = bitcast float %548 to i32
  %559 = lshr i32 %558, 23
  %560 = and i32 %558, 8388607
  %561 = or i32 %560, 8388608
  %562 = zext i32 %561 to i64
  %563 = mul nuw nsw i64 %562, 4266746795
  %564 = trunc i64 %563 to i32
  %565 = lshr i64 %563, 32
  %566 = mul nuw nsw i64 %562, 1011060801
  %567 = add nuw nsw i64 %565, %566
  %568 = trunc i64 %567 to i32
  %569 = lshr i64 %567, 32
  %570 = mul nuw nsw i64 %562, 3680671129
  %571 = add nuw nsw i64 %569, %570
  %572 = trunc i64 %571 to i32
  %573 = lshr i64 %571, 32
  %574 = mul nuw nsw i64 %562, 4113882560
  %575 = add nuw nsw i64 %573, %574
  %576 = trunc i64 %575 to i32
  %577 = lshr i64 %575, 32
  %578 = mul nuw nsw i64 %562, 4230436817
  %579 = add nuw nsw i64 %577, %578
  %580 = trunc i64 %579 to i32
  %581 = lshr i64 %579, 32
  %582 = mul nuw nsw i64 %562, 1313084713
  %583 = add nuw nsw i64 %581, %582
  %584 = trunc i64 %583 to i32
  %585 = lshr i64 %583, 32
  %586 = mul nuw nsw i64 %562, 2734261102
  %587 = add nuw nsw i64 %585, %586
  %588 = trunc i64 %587 to i32
  %589 = lshr i64 %587, 32
  %590 = trunc i64 %589 to i32
  %591 = add nsw i32 %559, -120
  %592 = icmp ugt i32 %591, 63
  %593 = select i1 %592, i32 %584, i32 %590
  %594 = select i1 %592, i32 %580, i32 %588
  %595 = select i1 %592, i32 %576, i32 %584
  %596 = select i1 %592, i32 %572, i32 %580
  %597 = select i1 %592, i32 %568, i32 %576
  %598 = select i1 %592, i32 %564, i32 %572
  %599 = select i1 %592, i32 -64, i32 0
  %600 = add nsw i32 %599, %591
  %601 = icmp ugt i32 %600, 31
  %602 = select i1 %601, i32 %594, i32 %593
  %603 = select i1 %601, i32 %595, i32 %594
  %604 = select i1 %601, i32 %596, i32 %595
  %605 = select i1 %601, i32 %597, i32 %596
  %606 = select i1 %601, i32 %598, i32 %597
  %607 = select i1 %601, i32 -32, i32 0
  %608 = add nsw i32 %607, %600
  %609 = icmp ugt i32 %608, 31
  %610 = select i1 %609, i32 %603, i32 %602
  %611 = select i1 %609, i32 %604, i32 %603
  %612 = select i1 %609, i32 %605, i32 %604
  %613 = select i1 %609, i32 %606, i32 %605
  %614 = select i1 %609, i32 -32, i32 0
  %615 = add nsw i32 %614, %608
  %616 = icmp eq i32 %615, 0
  %617 = sub nsw i32 32, %615
  %618 = tail call i32 @llvm.fshr.i32(i32 %610, i32 %611, i32 %617)
  %619 = tail call i32 @llvm.fshr.i32(i32 %611, i32 %612, i32 %617)
  %620 = tail call i32 @llvm.fshr.i32(i32 %612, i32 %613, i32 %617)
  %621 = select i1 %616, i32 %610, i32 %618
  %622 = select i1 %616, i32 %611, i32 %619
  %623 = select i1 %616, i32 %612, i32 %620
  %624 = lshr i32 %621, 29
  %625 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %622, i32 2)
  %626 = tail call i32 @llvm.fshl.i32(i32 %622, i32 %623, i32 2)
  %627 = tail call i32 @llvm.fshl.i32(i32 %623, i32 %613, i32 2)
  %628 = and i32 %624, 1
  %629 = sub nsw i32 0, %628
  %630 = shl i32 %624, 31
  %631 = xor i32 %625, %629
  %632 = xor i32 %626, %629
  %633 = xor i32 %627, %629
  %634 = tail call i32 @llvm.ctlz.i32(i32 %631, i1 false), !range !15
  %635 = sub nsw i32 31, %634
  %636 = tail call i32 @llvm.fshr.i32(i32 %631, i32 %632, i32 %635)
  %637 = tail call i32 @llvm.fshr.i32(i32 %632, i32 %633, i32 %635)
  %638 = shl nuw nsw i32 %634, 23
  %639 = sub nuw nsw i32 1056964608, %638
  %640 = lshr i32 %636, 9
  %641 = or i32 %640, %639
  %642 = or i32 %641, %630
  %643 = bitcast i32 %642 to float
  %644 = tail call i32 @llvm.fshl.i32(i32 %636, i32 %637, i32 23)
  %645 = tail call i32 @llvm.ctlz.i32(i32 %644, i1 false), !range !15
  %646 = fmul float %643, 0x3FF921FB40000000
  %647 = add nuw nsw i32 %645, %634
  %648 = shl nuw nsw i32 %647, 23
  %649 = sub nuw nsw i32 855638016, %648
  %650 = sub nsw i32 31, %645
  %651 = tail call i32 @llvm.fshr.i32(i32 %644, i32 %637, i32 %650)
  %652 = lshr i32 %651, 9
  %653 = or i32 %649, %652
  %654 = or i32 %653, %630
  %655 = bitcast i32 %654 to float
  %656 = fneg float %646
  %657 = tail call float @llvm.fma.f32(float %643, float 0x3FF921FB40000000, float %656)
  %658 = tail call float @llvm.fma.f32(float %643, float 0x3E74442D00000000, float %657)
  %659 = tail call float @llvm.fma.f32(float %655, float 0x3FF921FB40000000, float %658)
  %660 = fadd float %646, %659
  %661 = lshr i32 %621, 30
  %662 = add nuw nsw i32 %628, %661
  br label %663

663:                                              ; preds = %550, %557
  %664 = phi float [ %555, %550 ], [ %660, %557 ]
  %665 = phi i32 [ %556, %550 ], [ %662, %557 ]
  %666 = fmul float %664, %664
  %667 = tail call float @llvm.fmuladd.f32(float %666, float 0xBF29833040000000, float 0x3F81103880000000)
  %668 = tail call float @llvm.fmuladd.f32(float %666, float %667, float 0xBFC55553A0000000)
  %669 = fmul float %666, %668
  %670 = tail call float @llvm.fmuladd.f32(float %664, float %669, float %664)
  %671 = tail call float @llvm.fmuladd.f32(float %666, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %672 = tail call float @llvm.fmuladd.f32(float %666, float %671, float 0x3FA5557EE0000000)
  %673 = tail call float @llvm.fmuladd.f32(float %666, float %672, float 0xBFE0000080000000)
  %674 = tail call float @llvm.fmuladd.f32(float %666, float %673, float 1.000000e+00)
  %675 = fneg float %670
  %676 = and i32 %665, 1
  %677 = icmp eq i32 %676, 0
  %678 = select i1 %677, float %674, float %675
  %679 = bitcast float %678 to i32
  %680 = shl i32 %665, 30
  %681 = and i32 %680, -2147483648
  %682 = xor i32 %681, %679
  %683 = bitcast i32 %682 to float
  %684 = tail call i1 @llvm.amdgcn.class.f32(float %548, i32 504)
  %685 = select i1 %684, float %683, float 0x7FF8000000000000
  %686 = fmul contract float %546, %685
  %687 = fadd contract float %410, %686
  %688 = tail call float @llvm.minnum.f32(float %687, float 1.000000e+00)
  %689 = tail call float @llvm.maxnum.f32(float %688, float -1.000000e+00)
  %690 = tail call float @llvm.fabs.f32(float %689)
  %691 = tail call float @llvm.fmuladd.f32(float %690, float -5.000000e-01, float 5.000000e-01)
  %692 = fmul float %689, %689
  %693 = fcmp ogt float %690, 5.000000e-01
  %694 = select i1 %693, float %691, float %692
  %695 = tail call float @llvm.fmuladd.f32(float %694, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %696 = tail call float @llvm.fmuladd.f32(float %694, float %695, float 0x3FA0698780000000)
  %697 = tail call float @llvm.fmuladd.f32(float %694, float %696, float 0x3FA6C83620000000)
  %698 = tail call float @llvm.fmuladd.f32(float %694, float %697, float 0x3FB3337900000000)
  %699 = tail call float @llvm.fmuladd.f32(float %694, float %698, float 0x3FC5555580000000)
  %700 = fmul float %694, %699
  %701 = tail call float @llvm.sqrt.f32(float %694)
  %702 = tail call float @llvm.fmuladd.f32(float %701, float %700, float %701)
  %703 = fmul float %702, 2.000000e+00
  %704 = fsub float 0x400921FB60000000, %703
  %705 = fcmp olt float %689, 0.000000e+00
  %706 = select i1 %705, float %704, float %703
  %707 = tail call float @llvm.fmuladd.f32(float %689, float %700, float %689)
  %708 = fsub float 0x3FF921FB60000000, %707
  %709 = select i1 %693, float %706, float %708
  %710 = fmul contract float %709, 1.800000e+02
  %711 = fdiv contract float %710, 0x400921FA00000000
  %712 = fmul contract float %711, 4.000000e+00
  %713 = tail call float @llvm.floor.f32(float %712)
  %714 = fptosi float %713 to i32
  %715 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %714
  %716 = atomicrmw add i32 addrspace(3)* %715, i32 2 syncscope("agent-one-as") monotonic, align 4
  %717 = add nsw i32 %258, 1
  %718 = icmp slt i32 %717, %109
  br i1 %718, label %257, label %256, !llvm.loop !16

719:                                              ; preds = %256, %719
  %720 = phi i32 [ %888, %719 ], [ 0, %256 ]
  %721 = zext i32 %720 to i64
  %722 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %721
  %723 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %720
  %724 = load i32, i32 addrspace(3)* %723, align 16, !tbaa !7
  %725 = zext i32 %724 to i64
  %726 = atomicrmw add i64 addrspace(1)* %722, i64 %725 syncscope("agent-one-as") monotonic, align 8
  %727 = or i32 %720, 1
  %728 = zext i32 %727 to i64
  %729 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %728
  %730 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %727
  %731 = load i32, i32 addrspace(3)* %730, align 4, !tbaa !7
  %732 = zext i32 %731 to i64
  %733 = atomicrmw add i64 addrspace(1)* %729, i64 %732 syncscope("agent-one-as") monotonic, align 8
  %734 = or i32 %720, 2
  %735 = zext i32 %734 to i64
  %736 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %735
  %737 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %734
  %738 = load i32, i32 addrspace(3)* %737, align 8, !tbaa !7
  %739 = zext i32 %738 to i64
  %740 = atomicrmw add i64 addrspace(1)* %736, i64 %739 syncscope("agent-one-as") monotonic, align 8
  %741 = or i32 %720, 3
  %742 = zext i32 %741 to i64
  %743 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %742
  %744 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %741
  %745 = load i32, i32 addrspace(3)* %744, align 4, !tbaa !7
  %746 = zext i32 %745 to i64
  %747 = atomicrmw add i64 addrspace(1)* %743, i64 %746 syncscope("agent-one-as") monotonic, align 8
  %748 = or i32 %720, 4
  %749 = zext i32 %748 to i64
  %750 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %749
  %751 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %748
  %752 = load i32, i32 addrspace(3)* %751, align 16, !tbaa !7
  %753 = zext i32 %752 to i64
  %754 = atomicrmw add i64 addrspace(1)* %750, i64 %753 syncscope("agent-one-as") monotonic, align 8
  %755 = or i32 %720, 5
  %756 = zext i32 %755 to i64
  %757 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %756
  %758 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %755
  %759 = load i32, i32 addrspace(3)* %758, align 4, !tbaa !7
  %760 = zext i32 %759 to i64
  %761 = atomicrmw add i64 addrspace(1)* %757, i64 %760 syncscope("agent-one-as") monotonic, align 8
  %762 = or i32 %720, 6
  %763 = zext i32 %762 to i64
  %764 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %763
  %765 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %762
  %766 = load i32, i32 addrspace(3)* %765, align 8, !tbaa !7
  %767 = zext i32 %766 to i64
  %768 = atomicrmw add i64 addrspace(1)* %764, i64 %767 syncscope("agent-one-as") monotonic, align 8
  %769 = or i32 %720, 7
  %770 = zext i32 %769 to i64
  %771 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %770
  %772 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %769
  %773 = load i32, i32 addrspace(3)* %772, align 4, !tbaa !7
  %774 = zext i32 %773 to i64
  %775 = atomicrmw add i64 addrspace(1)* %771, i64 %774 syncscope("agent-one-as") monotonic, align 8
  %776 = add nuw nsw i32 %720, 8
  %777 = zext i32 %776 to i64
  %778 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %777
  %779 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %776
  %780 = load i32, i32 addrspace(3)* %779, align 16, !tbaa !7
  %781 = zext i32 %780 to i64
  %782 = atomicrmw add i64 addrspace(1)* %778, i64 %781 syncscope("agent-one-as") monotonic, align 8
  %783 = add nuw nsw i32 %720, 9
  %784 = zext i32 %783 to i64
  %785 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %784
  %786 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %783
  %787 = load i32, i32 addrspace(3)* %786, align 4, !tbaa !7
  %788 = zext i32 %787 to i64
  %789 = atomicrmw add i64 addrspace(1)* %785, i64 %788 syncscope("agent-one-as") monotonic, align 8
  %790 = add nuw nsw i32 %720, 10
  %791 = zext i32 %790 to i64
  %792 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %791
  %793 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %790
  %794 = load i32, i32 addrspace(3)* %793, align 8, !tbaa !7
  %795 = zext i32 %794 to i64
  %796 = atomicrmw add i64 addrspace(1)* %792, i64 %795 syncscope("agent-one-as") monotonic, align 8
  %797 = add nuw nsw i32 %720, 11
  %798 = zext i32 %797 to i64
  %799 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %798
  %800 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %797
  %801 = load i32, i32 addrspace(3)* %800, align 4, !tbaa !7
  %802 = zext i32 %801 to i64
  %803 = atomicrmw add i64 addrspace(1)* %799, i64 %802 syncscope("agent-one-as") monotonic, align 8
  %804 = add nuw nsw i32 %720, 12
  %805 = zext i32 %804 to i64
  %806 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %805
  %807 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %804
  %808 = load i32, i32 addrspace(3)* %807, align 16, !tbaa !7
  %809 = zext i32 %808 to i64
  %810 = atomicrmw add i64 addrspace(1)* %806, i64 %809 syncscope("agent-one-as") monotonic, align 8
  %811 = add nuw nsw i32 %720, 13
  %812 = zext i32 %811 to i64
  %813 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %812
  %814 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %811
  %815 = load i32, i32 addrspace(3)* %814, align 4, !tbaa !7
  %816 = zext i32 %815 to i64
  %817 = atomicrmw add i64 addrspace(1)* %813, i64 %816 syncscope("agent-one-as") monotonic, align 8
  %818 = add nuw nsw i32 %720, 14
  %819 = zext i32 %818 to i64
  %820 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %819
  %821 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %818
  %822 = load i32, i32 addrspace(3)* %821, align 8, !tbaa !7
  %823 = zext i32 %822 to i64
  %824 = atomicrmw add i64 addrspace(1)* %820, i64 %823 syncscope("agent-one-as") monotonic, align 8
  %825 = add nuw nsw i32 %720, 15
  %826 = zext i32 %825 to i64
  %827 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %826
  %828 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %825
  %829 = load i32, i32 addrspace(3)* %828, align 4, !tbaa !7
  %830 = zext i32 %829 to i64
  %831 = atomicrmw add i64 addrspace(1)* %827, i64 %830 syncscope("agent-one-as") monotonic, align 8
  %832 = add nuw nsw i32 %720, 16
  %833 = zext i32 %832 to i64
  %834 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %833
  %835 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %832
  %836 = load i32, i32 addrspace(3)* %835, align 16, !tbaa !7
  %837 = zext i32 %836 to i64
  %838 = atomicrmw add i64 addrspace(1)* %834, i64 %837 syncscope("agent-one-as") monotonic, align 8
  %839 = add nuw nsw i32 %720, 17
  %840 = zext i32 %839 to i64
  %841 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %840
  %842 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %839
  %843 = load i32, i32 addrspace(3)* %842, align 4, !tbaa !7
  %844 = zext i32 %843 to i64
  %845 = atomicrmw add i64 addrspace(1)* %841, i64 %844 syncscope("agent-one-as") monotonic, align 8
  %846 = add nuw nsw i32 %720, 18
  %847 = zext i32 %846 to i64
  %848 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %847
  %849 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %846
  %850 = load i32, i32 addrspace(3)* %849, align 8, !tbaa !7
  %851 = zext i32 %850 to i64
  %852 = atomicrmw add i64 addrspace(1)* %848, i64 %851 syncscope("agent-one-as") monotonic, align 8
  %853 = add nuw nsw i32 %720, 19
  %854 = zext i32 %853 to i64
  %855 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %854
  %856 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %853
  %857 = load i32, i32 addrspace(3)* %856, align 4, !tbaa !7
  %858 = zext i32 %857 to i64
  %859 = atomicrmw add i64 addrspace(1)* %855, i64 %858 syncscope("agent-one-as") monotonic, align 8
  %860 = add nuw nsw i32 %720, 20
  %861 = zext i32 %860 to i64
  %862 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %861
  %863 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %860
  %864 = load i32, i32 addrspace(3)* %863, align 16, !tbaa !7
  %865 = zext i32 %864 to i64
  %866 = atomicrmw add i64 addrspace(1)* %862, i64 %865 syncscope("agent-one-as") monotonic, align 8
  %867 = add nuw nsw i32 %720, 21
  %868 = zext i32 %867 to i64
  %869 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %868
  %870 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %867
  %871 = load i32, i32 addrspace(3)* %870, align 4, !tbaa !7
  %872 = zext i32 %871 to i64
  %873 = atomicrmw add i64 addrspace(1)* %869, i64 %872 syncscope("agent-one-as") monotonic, align 8
  %874 = add nuw nsw i32 %720, 22
  %875 = zext i32 %874 to i64
  %876 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %875
  %877 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %874
  %878 = load i32, i32 addrspace(3)* %877, align 8, !tbaa !7
  %879 = zext i32 %878 to i64
  %880 = atomicrmw add i64 addrspace(1)* %876, i64 %879 syncscope("agent-one-as") monotonic, align 8
  %881 = add nuw nsw i32 %720, 23
  %882 = zext i32 %881 to i64
  %883 = getelementptr inbounds i64, i64 addrspace(1)* %3, i64 %882
  %884 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ15DD_or_RR_kerneliiPfPyE5sHist, i32 0, i32 %881
  %885 = load i32, i32 addrspace(3)* %884, align 4, !tbaa !7
  %886 = zext i32 %885 to i64
  %887 = atomicrmw add i64 addrspace(1)* %883, i64 %886 syncscope("agent-one-as") monotonic, align 8
  %888 = add nuw nsw i32 %720, 24
  %889 = icmp eq i32 %888, 720
  br i1 %889, label %890, label %719, !llvm.loop !17

890:                                              ; preds = %719, %256, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = !{!14, !14, i64 0}
!14 = !{!"float", !9, i64 0}
!15 = !{i32 0, i32 33}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
