; ModuleID = '../data/hip_kernels/1022/0/main.cu'
source_filename = "../data/hip_kernels/1022/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9DR_kerneliiPfS_PyE5sHist = internal addrspace(3) global [720 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9DR_kerneliiPfS_Py(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i64 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = shl i32 %15, 8
  %17 = icmp slt i32 %14, %0
  br i1 %17, label %18, label %885

18:                                               ; preds = %5
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %20, label %95

20:                                               ; preds = %18, %20
  %21 = phi i32 [ %93, %20 ], [ 0, %18 ]
  %22 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %21
  store i32 0, i32 addrspace(3)* %22, align 16, !tbaa !7
  %23 = or i32 %21, 1
  %24 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %23
  store i32 0, i32 addrspace(3)* %24, align 4, !tbaa !7
  %25 = or i32 %21, 2
  %26 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %25
  store i32 0, i32 addrspace(3)* %26, align 8, !tbaa !7
  %27 = or i32 %21, 3
  %28 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %27
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !7
  %29 = add nuw nsw i32 %21, 4
  %30 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %29
  store i32 0, i32 addrspace(3)* %30, align 16, !tbaa !7
  %31 = add nuw nsw i32 %21, 5
  %32 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %31
  store i32 0, i32 addrspace(3)* %32, align 4, !tbaa !7
  %33 = add nuw nsw i32 %21, 6
  %34 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %33
  store i32 0, i32 addrspace(3)* %34, align 8, !tbaa !7
  %35 = add nuw nsw i32 %21, 7
  %36 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %35
  store i32 0, i32 addrspace(3)* %36, align 4, !tbaa !7
  %37 = add nuw nsw i32 %21, 8
  %38 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %37
  store i32 0, i32 addrspace(3)* %38, align 16, !tbaa !7
  %39 = add nuw nsw i32 %21, 9
  %40 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %39
  store i32 0, i32 addrspace(3)* %40, align 4, !tbaa !7
  %41 = add nuw nsw i32 %21, 10
  %42 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %41
  store i32 0, i32 addrspace(3)* %42, align 8, !tbaa !7
  %43 = add nuw nsw i32 %21, 11
  %44 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %43
  store i32 0, i32 addrspace(3)* %44, align 4, !tbaa !7
  %45 = add nuw nsw i32 %21, 12
  %46 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %45
  store i32 0, i32 addrspace(3)* %46, align 16, !tbaa !7
  %47 = add nuw nsw i32 %21, 13
  %48 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %47
  store i32 0, i32 addrspace(3)* %48, align 4, !tbaa !7
  %49 = add nuw nsw i32 %21, 14
  %50 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %49
  store i32 0, i32 addrspace(3)* %50, align 8, !tbaa !7
  %51 = add nuw nsw i32 %21, 15
  %52 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %51
  store i32 0, i32 addrspace(3)* %52, align 4, !tbaa !7
  %53 = add nuw nsw i32 %21, 16
  %54 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %53
  store i32 0, i32 addrspace(3)* %54, align 16, !tbaa !7
  %55 = add nuw nsw i32 %21, 17
  %56 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %55
  store i32 0, i32 addrspace(3)* %56, align 4, !tbaa !7
  %57 = add nuw nsw i32 %21, 18
  %58 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %57
  store i32 0, i32 addrspace(3)* %58, align 8, !tbaa !7
  %59 = add nuw nsw i32 %21, 19
  %60 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %59
  store i32 0, i32 addrspace(3)* %60, align 4, !tbaa !7
  %61 = add nuw nsw i32 %21, 20
  %62 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %61
  store i32 0, i32 addrspace(3)* %62, align 16, !tbaa !7
  %63 = add nuw nsw i32 %21, 21
  %64 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %63
  store i32 0, i32 addrspace(3)* %64, align 4, !tbaa !7
  %65 = add nuw nsw i32 %21, 22
  %66 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %65
  store i32 0, i32 addrspace(3)* %66, align 8, !tbaa !7
  %67 = add nuw nsw i32 %21, 23
  %68 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %67
  store i32 0, i32 addrspace(3)* %68, align 4, !tbaa !7
  %69 = add nuw nsw i32 %21, 24
  %70 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %69
  store i32 0, i32 addrspace(3)* %70, align 16, !tbaa !7
  %71 = add nuw nsw i32 %21, 25
  %72 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %71
  store i32 0, i32 addrspace(3)* %72, align 4, !tbaa !7
  %73 = add nuw nsw i32 %21, 26
  %74 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %73
  store i32 0, i32 addrspace(3)* %74, align 8, !tbaa !7
  %75 = add nuw nsw i32 %21, 27
  %76 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %75
  store i32 0, i32 addrspace(3)* %76, align 4, !tbaa !7
  %77 = add nuw nsw i32 %21, 28
  %78 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %77
  store i32 0, i32 addrspace(3)* %78, align 16, !tbaa !7
  %79 = add nuw nsw i32 %21, 29
  %80 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %79
  store i32 0, i32 addrspace(3)* %80, align 4, !tbaa !7
  %81 = add nuw nsw i32 %21, 30
  %82 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %81
  store i32 0, i32 addrspace(3)* %82, align 8, !tbaa !7
  %83 = add nuw nsw i32 %21, 31
  %84 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %83
  store i32 0, i32 addrspace(3)* %84, align 4, !tbaa !7
  %85 = add nuw nsw i32 %21, 32
  %86 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %85
  store i32 0, i32 addrspace(3)* %86, align 16, !tbaa !7
  %87 = add nuw nsw i32 %21, 33
  %88 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %87
  store i32 0, i32 addrspace(3)* %88, align 4, !tbaa !7
  %89 = add nuw nsw i32 %21, 34
  %90 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %89
  store i32 0, i32 addrspace(3)* %90, align 8, !tbaa !7
  %91 = add nuw nsw i32 %21, 35
  %92 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %91
  store i32 0, i32 addrspace(3)* %92, align 4, !tbaa !7
  %93 = add nuw nsw i32 %21, 36
  %94 = icmp eq i32 %93, 720
  br i1 %94, label %95, label %20, !llvm.loop !11

95:                                               ; preds = %20, %18
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = shl nsw i32 %14, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %2, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !13, !amdgpu.noclobber !5
  %100 = add nuw nsw i32 %96, 1
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float addrspace(1)* %2, i64 %101
  %103 = load float, float addrspace(1)* %102, align 4, !tbaa !13, !amdgpu.noclobber !5
  %104 = sub nsw i32 %1, %16
  %105 = icmp sgt i32 %104, 0
  br i1 %105, label %106, label %251

106:                                              ; preds = %95
  %107 = tail call i32 @llvm.smin.i32(i32 %104, i32 256)
  %108 = tail call float @llvm.fabs.f32(float %103)
  %109 = fcmp olt float %108, 1.310720e+05
  %110 = bitcast float %108 to i32
  %111 = lshr i32 %110, 23
  %112 = and i32 %110, 8388607
  %113 = or i32 %112, 8388608
  %114 = zext i32 %113 to i64
  %115 = mul nuw nsw i64 %114, 4266746795
  %116 = trunc i64 %115 to i32
  %117 = lshr i64 %115, 32
  %118 = mul nuw nsw i64 %114, 1011060801
  %119 = add nuw nsw i64 %117, %118
  %120 = trunc i64 %119 to i32
  %121 = lshr i64 %119, 32
  %122 = mul nuw nsw i64 %114, 3680671129
  %123 = add nuw nsw i64 %121, %122
  %124 = trunc i64 %123 to i32
  %125 = lshr i64 %123, 32
  %126 = mul nuw nsw i64 %114, 4113882560
  %127 = add nuw nsw i64 %125, %126
  %128 = trunc i64 %127 to i32
  %129 = lshr i64 %127, 32
  %130 = mul nuw nsw i64 %114, 4230436817
  %131 = add nuw nsw i64 %129, %130
  %132 = trunc i64 %131 to i32
  %133 = lshr i64 %131, 32
  %134 = mul nuw nsw i64 %114, 1313084713
  %135 = add nuw nsw i64 %133, %134
  %136 = trunc i64 %135 to i32
  %137 = lshr i64 %135, 32
  %138 = mul nuw nsw i64 %114, 2734261102
  %139 = add nuw nsw i64 %137, %138
  %140 = trunc i64 %139 to i32
  %141 = lshr i64 %139, 32
  %142 = trunc i64 %141 to i32
  %143 = add nsw i32 %111, -120
  %144 = icmp ugt i32 %143, 63
  %145 = select i1 %144, i32 %136, i32 %142
  %146 = select i1 %144, i32 %132, i32 %140
  %147 = select i1 %144, i32 %128, i32 %136
  %148 = select i1 %144, i32 %124, i32 %132
  %149 = select i1 %144, i32 %120, i32 %128
  %150 = select i1 %144, i32 %116, i32 %124
  %151 = select i1 %144, i32 -64, i32 0
  %152 = add nsw i32 %151, %143
  %153 = icmp ugt i32 %152, 31
  %154 = select i1 %153, i32 %146, i32 %145
  %155 = select i1 %153, i32 %147, i32 %146
  %156 = select i1 %153, i32 %148, i32 %147
  %157 = select i1 %153, i32 %149, i32 %148
  %158 = select i1 %153, i32 %150, i32 %149
  %159 = select i1 %153, i32 -32, i32 0
  %160 = add nsw i32 %159, %152
  %161 = icmp ugt i32 %160, 31
  %162 = select i1 %161, i32 %155, i32 %154
  %163 = select i1 %161, i32 %156, i32 %155
  %164 = select i1 %161, i32 %157, i32 %156
  %165 = select i1 %161, i32 %158, i32 %157
  %166 = select i1 %161, i32 -32, i32 0
  %167 = add nsw i32 %166, %160
  %168 = icmp eq i32 %167, 0
  %169 = sub nsw i32 32, %167
  %170 = tail call i32 @llvm.fshr.i32(i32 %162, i32 %163, i32 %169)
  %171 = tail call i32 @llvm.fshr.i32(i32 %163, i32 %164, i32 %169)
  %172 = tail call i32 @llvm.fshr.i32(i32 %164, i32 %165, i32 %169)
  %173 = select i1 %168, i32 %162, i32 %170
  %174 = select i1 %168, i32 %163, i32 %171
  %175 = select i1 %168, i32 %164, i32 %172
  %176 = lshr i32 %173, 29
  %177 = tail call i32 @llvm.fshl.i32(i32 %173, i32 %174, i32 2)
  %178 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %175, i32 2)
  %179 = tail call i32 @llvm.fshl.i32(i32 %175, i32 %165, i32 2)
  %180 = and i32 %176, 1
  %181 = sub nsw i32 0, %180
  %182 = shl i32 %176, 31
  %183 = xor i32 %177, %181
  %184 = xor i32 %178, %181
  %185 = xor i32 %179, %181
  %186 = tail call i32 @llvm.ctlz.i32(i32 %183, i1 false), !range !15
  %187 = sub nsw i32 31, %186
  %188 = tail call i32 @llvm.fshr.i32(i32 %183, i32 %184, i32 %187)
  %189 = tail call i32 @llvm.fshr.i32(i32 %184, i32 %185, i32 %187)
  %190 = shl nuw nsw i32 %186, 23
  %191 = sub nuw nsw i32 1056964608, %190
  %192 = lshr i32 %188, 9
  %193 = or i32 %192, %191
  %194 = or i32 %193, %182
  %195 = bitcast i32 %194 to float
  %196 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %189, i32 23)
  %197 = tail call i32 @llvm.ctlz.i32(i32 %196, i1 false), !range !15
  %198 = fmul float %195, 0x3FF921FB40000000
  %199 = add nuw nsw i32 %197, %186
  %200 = shl nuw nsw i32 %199, 23
  %201 = sub nuw nsw i32 855638016, %200
  %202 = sub nsw i32 31, %197
  %203 = tail call i32 @llvm.fshr.i32(i32 %196, i32 %189, i32 %202)
  %204 = lshr i32 %203, 9
  %205 = or i32 %201, %204
  %206 = or i32 %205, %182
  %207 = bitcast i32 %206 to float
  %208 = fneg float %198
  %209 = tail call float @llvm.fma.f32(float %195, float 0x3FF921FB40000000, float %208)
  %210 = tail call float @llvm.fma.f32(float %195, float 0x3E74442D00000000, float %209)
  %211 = tail call float @llvm.fma.f32(float %207, float 0x3FF921FB40000000, float %210)
  %212 = fadd float %198, %211
  %213 = lshr i32 %173, 30
  %214 = add nuw nsw i32 %180, %213
  %215 = fmul float %108, 0x3FE45F3060000000
  %216 = tail call float @llvm.rint.f32(float %215)
  %217 = tail call float @llvm.fma.f32(float %216, float 0xBFF921FB40000000, float %108)
  %218 = tail call float @llvm.fma.f32(float %216, float 0xBE74442D00000000, float %217)
  %219 = tail call float @llvm.fma.f32(float %216, float 0xBCF8469880000000, float %218)
  %220 = fptosi float %216 to i32
  %221 = bitcast float %103 to i32
  %222 = tail call i1 @llvm.amdgcn.class.f32(float %108, i32 504)
  %223 = select i1 %109, float %219, float %212
  %224 = select i1 %109, i32 %220, i32 %214
  %225 = fmul float %223, %223
  %226 = tail call float @llvm.fmuladd.f32(float %225, float 0xBF29833040000000, float 0x3F81103880000000)
  %227 = tail call float @llvm.fmuladd.f32(float %225, float %226, float 0xBFC55553A0000000)
  %228 = fmul float %225, %227
  %229 = tail call float @llvm.fmuladd.f32(float %223, float %228, float %223)
  %230 = tail call float @llvm.fmuladd.f32(float %225, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %231 = tail call float @llvm.fmuladd.f32(float %225, float %230, float 0x3FA5557EE0000000)
  %232 = tail call float @llvm.fmuladd.f32(float %225, float %231, float 0xBFE0000080000000)
  %233 = tail call float @llvm.fmuladd.f32(float %225, float %232, float 1.000000e+00)
  %234 = and i32 %224, 1
  %235 = icmp eq i32 %234, 0
  %236 = select i1 %235, float %229, float %233
  %237 = bitcast float %236 to i32
  %238 = shl i32 %224, 30
  %239 = and i32 %238, -2147483648
  %240 = xor i32 %221, %237
  %241 = xor i32 %240, %110
  %242 = xor i32 %241, %239
  %243 = bitcast i32 %242 to float
  %244 = select i1 %222, float %243, float 0x7FF8000000000000
  %245 = fneg float %229
  %246 = select i1 %235, float %233, float %245
  %247 = bitcast float %246 to i32
  %248 = xor i32 %239, %247
  %249 = bitcast i32 %248 to float
  %250 = select i1 %222, float %249, float 0x7FF8000000000000
  br label %252

251:                                              ; preds = %658, %95
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %714, label %885

252:                                              ; preds = %106, %658
  %253 = phi i32 [ 0, %106 ], [ %712, %658 ]
  %254 = shl nuw nsw i32 %253, 1
  %255 = add nsw i32 %254, %16
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds float, float addrspace(1)* %3, i64 %256
  %258 = load float, float addrspace(1)* %257, align 4, !tbaa !13, !amdgpu.noclobber !5
  %259 = or i32 %255, 1
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds float, float addrspace(1)* %3, i64 %260
  %262 = load float, float addrspace(1)* %261, align 4, !tbaa !13, !amdgpu.noclobber !5
  %263 = tail call float @llvm.fabs.f32(float %262)
  %264 = fcmp olt float %263, 1.310720e+05
  br i1 %264, label %265, label %273

265:                                              ; preds = %252
  %266 = fmul float %263, 0x3FE45F3060000000
  %267 = tail call float @llvm.rint.f32(float %266)
  %268 = tail call float @llvm.fma.f32(float %267, float 0xBFF921FB40000000, float %263)
  %269 = tail call float @llvm.fma.f32(float %267, float 0xBE74442D00000000, float %268)
  %270 = tail call float @llvm.fma.f32(float %267, float 0xBCF8469880000000, float %269)
  %271 = fptosi float %267 to i32
  %272 = bitcast float %263 to i32
  br label %379

273:                                              ; preds = %252
  %274 = bitcast float %263 to i32
  %275 = lshr i32 %274, 23
  %276 = and i32 %274, 8388607
  %277 = or i32 %276, 8388608
  %278 = zext i32 %277 to i64
  %279 = mul nuw nsw i64 %278, 4266746795
  %280 = trunc i64 %279 to i32
  %281 = lshr i64 %279, 32
  %282 = mul nuw nsw i64 %278, 1011060801
  %283 = add nuw nsw i64 %281, %282
  %284 = trunc i64 %283 to i32
  %285 = lshr i64 %283, 32
  %286 = mul nuw nsw i64 %278, 3680671129
  %287 = add nuw nsw i64 %285, %286
  %288 = trunc i64 %287 to i32
  %289 = lshr i64 %287, 32
  %290 = mul nuw nsw i64 %278, 4113882560
  %291 = add nuw nsw i64 %289, %290
  %292 = trunc i64 %291 to i32
  %293 = lshr i64 %291, 32
  %294 = mul nuw nsw i64 %278, 4230436817
  %295 = add nuw nsw i64 %293, %294
  %296 = trunc i64 %295 to i32
  %297 = lshr i64 %295, 32
  %298 = mul nuw nsw i64 %278, 1313084713
  %299 = add nuw nsw i64 %297, %298
  %300 = trunc i64 %299 to i32
  %301 = lshr i64 %299, 32
  %302 = mul nuw nsw i64 %278, 2734261102
  %303 = add nuw nsw i64 %301, %302
  %304 = trunc i64 %303 to i32
  %305 = lshr i64 %303, 32
  %306 = trunc i64 %305 to i32
  %307 = add nsw i32 %275, -120
  %308 = icmp ugt i32 %307, 63
  %309 = select i1 %308, i32 %300, i32 %306
  %310 = select i1 %308, i32 %296, i32 %304
  %311 = select i1 %308, i32 %292, i32 %300
  %312 = select i1 %308, i32 %288, i32 %296
  %313 = select i1 %308, i32 %284, i32 %292
  %314 = select i1 %308, i32 %280, i32 %288
  %315 = select i1 %308, i32 -64, i32 0
  %316 = add nsw i32 %315, %307
  %317 = icmp ugt i32 %316, 31
  %318 = select i1 %317, i32 %310, i32 %309
  %319 = select i1 %317, i32 %311, i32 %310
  %320 = select i1 %317, i32 %312, i32 %311
  %321 = select i1 %317, i32 %313, i32 %312
  %322 = select i1 %317, i32 %314, i32 %313
  %323 = select i1 %317, i32 -32, i32 0
  %324 = add nsw i32 %323, %316
  %325 = icmp ugt i32 %324, 31
  %326 = select i1 %325, i32 %319, i32 %318
  %327 = select i1 %325, i32 %320, i32 %319
  %328 = select i1 %325, i32 %321, i32 %320
  %329 = select i1 %325, i32 %322, i32 %321
  %330 = select i1 %325, i32 -32, i32 0
  %331 = add nsw i32 %330, %324
  %332 = icmp eq i32 %331, 0
  %333 = sub nsw i32 32, %331
  %334 = tail call i32 @llvm.fshr.i32(i32 %326, i32 %327, i32 %333)
  %335 = tail call i32 @llvm.fshr.i32(i32 %327, i32 %328, i32 %333)
  %336 = tail call i32 @llvm.fshr.i32(i32 %328, i32 %329, i32 %333)
  %337 = select i1 %332, i32 %326, i32 %334
  %338 = select i1 %332, i32 %327, i32 %335
  %339 = select i1 %332, i32 %328, i32 %336
  %340 = lshr i32 %337, 29
  %341 = tail call i32 @llvm.fshl.i32(i32 %337, i32 %338, i32 2)
  %342 = tail call i32 @llvm.fshl.i32(i32 %338, i32 %339, i32 2)
  %343 = tail call i32 @llvm.fshl.i32(i32 %339, i32 %329, i32 2)
  %344 = and i32 %340, 1
  %345 = sub nsw i32 0, %344
  %346 = shl i32 %340, 31
  %347 = xor i32 %341, %345
  %348 = xor i32 %342, %345
  %349 = xor i32 %343, %345
  %350 = tail call i32 @llvm.ctlz.i32(i32 %347, i1 false), !range !15
  %351 = sub nsw i32 31, %350
  %352 = tail call i32 @llvm.fshr.i32(i32 %347, i32 %348, i32 %351)
  %353 = tail call i32 @llvm.fshr.i32(i32 %348, i32 %349, i32 %351)
  %354 = shl nuw nsw i32 %350, 23
  %355 = sub nuw nsw i32 1056964608, %354
  %356 = lshr i32 %352, 9
  %357 = or i32 %356, %355
  %358 = or i32 %357, %346
  %359 = bitcast i32 %358 to float
  %360 = tail call i32 @llvm.fshl.i32(i32 %352, i32 %353, i32 23)
  %361 = tail call i32 @llvm.ctlz.i32(i32 %360, i1 false), !range !15
  %362 = fmul float %359, 0x3FF921FB40000000
  %363 = add nuw nsw i32 %361, %350
  %364 = shl nuw nsw i32 %363, 23
  %365 = sub nuw nsw i32 855638016, %364
  %366 = sub nsw i32 31, %361
  %367 = tail call i32 @llvm.fshr.i32(i32 %360, i32 %353, i32 %366)
  %368 = lshr i32 %367, 9
  %369 = or i32 %365, %368
  %370 = or i32 %369, %346
  %371 = bitcast i32 %370 to float
  %372 = fneg float %362
  %373 = tail call float @llvm.fma.f32(float %359, float 0x3FF921FB40000000, float %372)
  %374 = tail call float @llvm.fma.f32(float %359, float 0x3E74442D00000000, float %373)
  %375 = tail call float @llvm.fma.f32(float %371, float 0x3FF921FB40000000, float %374)
  %376 = fadd float %362, %375
  %377 = lshr i32 %337, 30
  %378 = add nuw nsw i32 %344, %377
  br label %379

379:                                              ; preds = %265, %273
  %380 = phi i32 [ %272, %265 ], [ %274, %273 ]
  %381 = phi float [ %270, %265 ], [ %376, %273 ]
  %382 = phi i32 [ %271, %265 ], [ %378, %273 ]
  %383 = fmul float %381, %381
  %384 = tail call float @llvm.fmuladd.f32(float %383, float 0xBF29833040000000, float 0x3F81103880000000)
  %385 = tail call float @llvm.fmuladd.f32(float %383, float %384, float 0xBFC55553A0000000)
  %386 = fmul float %383, %385
  %387 = tail call float @llvm.fmuladd.f32(float %381, float %386, float %381)
  %388 = tail call float @llvm.fmuladd.f32(float %383, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %389 = tail call float @llvm.fmuladd.f32(float %383, float %388, float 0x3FA5557EE0000000)
  %390 = tail call float @llvm.fmuladd.f32(float %383, float %389, float 0xBFE0000080000000)
  %391 = tail call float @llvm.fmuladd.f32(float %383, float %390, float 1.000000e+00)
  %392 = and i32 %382, 1
  %393 = icmp eq i32 %392, 0
  %394 = select i1 %393, float %387, float %391
  %395 = bitcast float %394 to i32
  %396 = shl i32 %382, 30
  %397 = and i32 %396, -2147483648
  %398 = bitcast float %262 to i32
  %399 = xor i32 %380, %398
  %400 = xor i32 %399, %397
  %401 = xor i32 %400, %395
  %402 = bitcast i32 %401 to float
  %403 = tail call i1 @llvm.amdgcn.class.f32(float %263, i32 504)
  %404 = select i1 %403, float %402, float 0x7FF8000000000000
  %405 = fmul contract float %244, %404
  br i1 %264, label %406, label %413

406:                                              ; preds = %379
  %407 = fmul float %263, 0x3FE45F3060000000
  %408 = tail call float @llvm.rint.f32(float %407)
  %409 = tail call float @llvm.fma.f32(float %408, float 0xBFF921FB40000000, float %263)
  %410 = tail call float @llvm.fma.f32(float %408, float 0xBE74442D00000000, float %409)
  %411 = tail call float @llvm.fma.f32(float %408, float 0xBCF8469880000000, float %410)
  %412 = fptosi float %408 to i32
  br label %519

413:                                              ; preds = %379
  %414 = bitcast float %263 to i32
  %415 = lshr i32 %414, 23
  %416 = and i32 %414, 8388607
  %417 = or i32 %416, 8388608
  %418 = zext i32 %417 to i64
  %419 = mul nuw nsw i64 %418, 4266746795
  %420 = trunc i64 %419 to i32
  %421 = lshr i64 %419, 32
  %422 = mul nuw nsw i64 %418, 1011060801
  %423 = add nuw nsw i64 %421, %422
  %424 = trunc i64 %423 to i32
  %425 = lshr i64 %423, 32
  %426 = mul nuw nsw i64 %418, 3680671129
  %427 = add nuw nsw i64 %425, %426
  %428 = trunc i64 %427 to i32
  %429 = lshr i64 %427, 32
  %430 = mul nuw nsw i64 %418, 4113882560
  %431 = add nuw nsw i64 %429, %430
  %432 = trunc i64 %431 to i32
  %433 = lshr i64 %431, 32
  %434 = mul nuw nsw i64 %418, 4230436817
  %435 = add nuw nsw i64 %433, %434
  %436 = trunc i64 %435 to i32
  %437 = lshr i64 %435, 32
  %438 = mul nuw nsw i64 %418, 1313084713
  %439 = add nuw nsw i64 %437, %438
  %440 = trunc i64 %439 to i32
  %441 = lshr i64 %439, 32
  %442 = mul nuw nsw i64 %418, 2734261102
  %443 = add nuw nsw i64 %441, %442
  %444 = trunc i64 %443 to i32
  %445 = lshr i64 %443, 32
  %446 = trunc i64 %445 to i32
  %447 = add nsw i32 %415, -120
  %448 = icmp ugt i32 %447, 63
  %449 = select i1 %448, i32 %440, i32 %446
  %450 = select i1 %448, i32 %436, i32 %444
  %451 = select i1 %448, i32 %432, i32 %440
  %452 = select i1 %448, i32 %428, i32 %436
  %453 = select i1 %448, i32 %424, i32 %432
  %454 = select i1 %448, i32 %420, i32 %428
  %455 = select i1 %448, i32 -64, i32 0
  %456 = add nsw i32 %455, %447
  %457 = icmp ugt i32 %456, 31
  %458 = select i1 %457, i32 %450, i32 %449
  %459 = select i1 %457, i32 %451, i32 %450
  %460 = select i1 %457, i32 %452, i32 %451
  %461 = select i1 %457, i32 %453, i32 %452
  %462 = select i1 %457, i32 %454, i32 %453
  %463 = select i1 %457, i32 -32, i32 0
  %464 = add nsw i32 %463, %456
  %465 = icmp ugt i32 %464, 31
  %466 = select i1 %465, i32 %459, i32 %458
  %467 = select i1 %465, i32 %460, i32 %459
  %468 = select i1 %465, i32 %461, i32 %460
  %469 = select i1 %465, i32 %462, i32 %461
  %470 = select i1 %465, i32 -32, i32 0
  %471 = add nsw i32 %470, %464
  %472 = icmp eq i32 %471, 0
  %473 = sub nsw i32 32, %471
  %474 = tail call i32 @llvm.fshr.i32(i32 %466, i32 %467, i32 %473)
  %475 = tail call i32 @llvm.fshr.i32(i32 %467, i32 %468, i32 %473)
  %476 = tail call i32 @llvm.fshr.i32(i32 %468, i32 %469, i32 %473)
  %477 = select i1 %472, i32 %466, i32 %474
  %478 = select i1 %472, i32 %467, i32 %475
  %479 = select i1 %472, i32 %468, i32 %476
  %480 = lshr i32 %477, 29
  %481 = tail call i32 @llvm.fshl.i32(i32 %477, i32 %478, i32 2)
  %482 = tail call i32 @llvm.fshl.i32(i32 %478, i32 %479, i32 2)
  %483 = tail call i32 @llvm.fshl.i32(i32 %479, i32 %469, i32 2)
  %484 = and i32 %480, 1
  %485 = sub nsw i32 0, %484
  %486 = shl i32 %480, 31
  %487 = xor i32 %481, %485
  %488 = xor i32 %482, %485
  %489 = xor i32 %483, %485
  %490 = tail call i32 @llvm.ctlz.i32(i32 %487, i1 false), !range !15
  %491 = sub nsw i32 31, %490
  %492 = tail call i32 @llvm.fshr.i32(i32 %487, i32 %488, i32 %491)
  %493 = tail call i32 @llvm.fshr.i32(i32 %488, i32 %489, i32 %491)
  %494 = shl nuw nsw i32 %490, 23
  %495 = sub nuw nsw i32 1056964608, %494
  %496 = lshr i32 %492, 9
  %497 = or i32 %496, %495
  %498 = or i32 %497, %486
  %499 = bitcast i32 %498 to float
  %500 = tail call i32 @llvm.fshl.i32(i32 %492, i32 %493, i32 23)
  %501 = tail call i32 @llvm.ctlz.i32(i32 %500, i1 false), !range !15
  %502 = fmul float %499, 0x3FF921FB40000000
  %503 = add nuw nsw i32 %501, %490
  %504 = shl nuw nsw i32 %503, 23
  %505 = sub nuw nsw i32 855638016, %504
  %506 = sub nsw i32 31, %501
  %507 = tail call i32 @llvm.fshr.i32(i32 %500, i32 %493, i32 %506)
  %508 = lshr i32 %507, 9
  %509 = or i32 %505, %508
  %510 = or i32 %509, %486
  %511 = bitcast i32 %510 to float
  %512 = fneg float %502
  %513 = tail call float @llvm.fma.f32(float %499, float 0x3FF921FB40000000, float %512)
  %514 = tail call float @llvm.fma.f32(float %499, float 0x3E74442D00000000, float %513)
  %515 = tail call float @llvm.fma.f32(float %511, float 0x3FF921FB40000000, float %514)
  %516 = fadd float %502, %515
  %517 = lshr i32 %477, 30
  %518 = add nuw nsw i32 %484, %517
  br label %519

519:                                              ; preds = %406, %413
  %520 = phi float [ %411, %406 ], [ %516, %413 ]
  %521 = phi i32 [ %412, %406 ], [ %518, %413 ]
  %522 = fmul float %520, %520
  %523 = tail call float @llvm.fmuladd.f32(float %522, float 0xBF29833040000000, float 0x3F81103880000000)
  %524 = tail call float @llvm.fmuladd.f32(float %522, float %523, float 0xBFC55553A0000000)
  %525 = fmul float %522, %524
  %526 = tail call float @llvm.fmuladd.f32(float %520, float %525, float %520)
  %527 = tail call float @llvm.fmuladd.f32(float %522, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %528 = tail call float @llvm.fmuladd.f32(float %522, float %527, float 0x3FA5557EE0000000)
  %529 = tail call float @llvm.fmuladd.f32(float %522, float %528, float 0xBFE0000080000000)
  %530 = tail call float @llvm.fmuladd.f32(float %522, float %529, float 1.000000e+00)
  %531 = fneg float %526
  %532 = and i32 %521, 1
  %533 = icmp eq i32 %532, 0
  %534 = select i1 %533, float %530, float %531
  %535 = bitcast float %534 to i32
  %536 = shl i32 %521, 30
  %537 = and i32 %536, -2147483648
  %538 = xor i32 %537, %535
  %539 = bitcast i32 %538 to float
  %540 = select i1 %403, float %539, float 0x7FF8000000000000
  %541 = fmul contract float %250, %540
  %542 = fsub contract float %99, %258
  %543 = tail call float @llvm.fabs.f32(float %542)
  %544 = fcmp olt float %543, 1.310720e+05
  br i1 %544, label %545, label %552

545:                                              ; preds = %519
  %546 = fmul float %543, 0x3FE45F3060000000
  %547 = tail call float @llvm.rint.f32(float %546)
  %548 = tail call float @llvm.fma.f32(float %547, float 0xBFF921FB40000000, float %543)
  %549 = tail call float @llvm.fma.f32(float %547, float 0xBE74442D00000000, float %548)
  %550 = tail call float @llvm.fma.f32(float %547, float 0xBCF8469880000000, float %549)
  %551 = fptosi float %547 to i32
  br label %658

552:                                              ; preds = %519
  %553 = bitcast float %543 to i32
  %554 = lshr i32 %553, 23
  %555 = and i32 %553, 8388607
  %556 = or i32 %555, 8388608
  %557 = zext i32 %556 to i64
  %558 = mul nuw nsw i64 %557, 4266746795
  %559 = trunc i64 %558 to i32
  %560 = lshr i64 %558, 32
  %561 = mul nuw nsw i64 %557, 1011060801
  %562 = add nuw nsw i64 %560, %561
  %563 = trunc i64 %562 to i32
  %564 = lshr i64 %562, 32
  %565 = mul nuw nsw i64 %557, 3680671129
  %566 = add nuw nsw i64 %564, %565
  %567 = trunc i64 %566 to i32
  %568 = lshr i64 %566, 32
  %569 = mul nuw nsw i64 %557, 4113882560
  %570 = add nuw nsw i64 %568, %569
  %571 = trunc i64 %570 to i32
  %572 = lshr i64 %570, 32
  %573 = mul nuw nsw i64 %557, 4230436817
  %574 = add nuw nsw i64 %572, %573
  %575 = trunc i64 %574 to i32
  %576 = lshr i64 %574, 32
  %577 = mul nuw nsw i64 %557, 1313084713
  %578 = add nuw nsw i64 %576, %577
  %579 = trunc i64 %578 to i32
  %580 = lshr i64 %578, 32
  %581 = mul nuw nsw i64 %557, 2734261102
  %582 = add nuw nsw i64 %580, %581
  %583 = trunc i64 %582 to i32
  %584 = lshr i64 %582, 32
  %585 = trunc i64 %584 to i32
  %586 = add nsw i32 %554, -120
  %587 = icmp ugt i32 %586, 63
  %588 = select i1 %587, i32 %579, i32 %585
  %589 = select i1 %587, i32 %575, i32 %583
  %590 = select i1 %587, i32 %571, i32 %579
  %591 = select i1 %587, i32 %567, i32 %575
  %592 = select i1 %587, i32 %563, i32 %571
  %593 = select i1 %587, i32 %559, i32 %567
  %594 = select i1 %587, i32 -64, i32 0
  %595 = add nsw i32 %594, %586
  %596 = icmp ugt i32 %595, 31
  %597 = select i1 %596, i32 %589, i32 %588
  %598 = select i1 %596, i32 %590, i32 %589
  %599 = select i1 %596, i32 %591, i32 %590
  %600 = select i1 %596, i32 %592, i32 %591
  %601 = select i1 %596, i32 %593, i32 %592
  %602 = select i1 %596, i32 -32, i32 0
  %603 = add nsw i32 %602, %595
  %604 = icmp ugt i32 %603, 31
  %605 = select i1 %604, i32 %598, i32 %597
  %606 = select i1 %604, i32 %599, i32 %598
  %607 = select i1 %604, i32 %600, i32 %599
  %608 = select i1 %604, i32 %601, i32 %600
  %609 = select i1 %604, i32 -32, i32 0
  %610 = add nsw i32 %609, %603
  %611 = icmp eq i32 %610, 0
  %612 = sub nsw i32 32, %610
  %613 = tail call i32 @llvm.fshr.i32(i32 %605, i32 %606, i32 %612)
  %614 = tail call i32 @llvm.fshr.i32(i32 %606, i32 %607, i32 %612)
  %615 = tail call i32 @llvm.fshr.i32(i32 %607, i32 %608, i32 %612)
  %616 = select i1 %611, i32 %605, i32 %613
  %617 = select i1 %611, i32 %606, i32 %614
  %618 = select i1 %611, i32 %607, i32 %615
  %619 = lshr i32 %616, 29
  %620 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %617, i32 2)
  %621 = tail call i32 @llvm.fshl.i32(i32 %617, i32 %618, i32 2)
  %622 = tail call i32 @llvm.fshl.i32(i32 %618, i32 %608, i32 2)
  %623 = and i32 %619, 1
  %624 = sub nsw i32 0, %623
  %625 = shl i32 %619, 31
  %626 = xor i32 %620, %624
  %627 = xor i32 %621, %624
  %628 = xor i32 %622, %624
  %629 = tail call i32 @llvm.ctlz.i32(i32 %626, i1 false), !range !15
  %630 = sub nsw i32 31, %629
  %631 = tail call i32 @llvm.fshr.i32(i32 %626, i32 %627, i32 %630)
  %632 = tail call i32 @llvm.fshr.i32(i32 %627, i32 %628, i32 %630)
  %633 = shl nuw nsw i32 %629, 23
  %634 = sub nuw nsw i32 1056964608, %633
  %635 = lshr i32 %631, 9
  %636 = or i32 %635, %634
  %637 = or i32 %636, %625
  %638 = bitcast i32 %637 to float
  %639 = tail call i32 @llvm.fshl.i32(i32 %631, i32 %632, i32 23)
  %640 = tail call i32 @llvm.ctlz.i32(i32 %639, i1 false), !range !15
  %641 = fmul float %638, 0x3FF921FB40000000
  %642 = add nuw nsw i32 %640, %629
  %643 = shl nuw nsw i32 %642, 23
  %644 = sub nuw nsw i32 855638016, %643
  %645 = sub nsw i32 31, %640
  %646 = tail call i32 @llvm.fshr.i32(i32 %639, i32 %632, i32 %645)
  %647 = lshr i32 %646, 9
  %648 = or i32 %644, %647
  %649 = or i32 %648, %625
  %650 = bitcast i32 %649 to float
  %651 = fneg float %641
  %652 = tail call float @llvm.fma.f32(float %638, float 0x3FF921FB40000000, float %651)
  %653 = tail call float @llvm.fma.f32(float %638, float 0x3E74442D00000000, float %652)
  %654 = tail call float @llvm.fma.f32(float %650, float 0x3FF921FB40000000, float %653)
  %655 = fadd float %641, %654
  %656 = lshr i32 %616, 30
  %657 = add nuw nsw i32 %623, %656
  br label %658

658:                                              ; preds = %545, %552
  %659 = phi float [ %550, %545 ], [ %655, %552 ]
  %660 = phi i32 [ %551, %545 ], [ %657, %552 ]
  %661 = fmul float %659, %659
  %662 = tail call float @llvm.fmuladd.f32(float %661, float 0xBF29833040000000, float 0x3F81103880000000)
  %663 = tail call float @llvm.fmuladd.f32(float %661, float %662, float 0xBFC55553A0000000)
  %664 = fmul float %661, %663
  %665 = tail call float @llvm.fmuladd.f32(float %659, float %664, float %659)
  %666 = tail call float @llvm.fmuladd.f32(float %661, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %667 = tail call float @llvm.fmuladd.f32(float %661, float %666, float 0x3FA5557EE0000000)
  %668 = tail call float @llvm.fmuladd.f32(float %661, float %667, float 0xBFE0000080000000)
  %669 = tail call float @llvm.fmuladd.f32(float %661, float %668, float 1.000000e+00)
  %670 = fneg float %665
  %671 = and i32 %660, 1
  %672 = icmp eq i32 %671, 0
  %673 = select i1 %672, float %669, float %670
  %674 = bitcast float %673 to i32
  %675 = shl i32 %660, 30
  %676 = and i32 %675, -2147483648
  %677 = xor i32 %676, %674
  %678 = bitcast i32 %677 to float
  %679 = tail call i1 @llvm.amdgcn.class.f32(float %543, i32 504)
  %680 = select i1 %679, float %678, float 0x7FF8000000000000
  %681 = fmul contract float %541, %680
  %682 = fadd contract float %405, %681
  %683 = tail call float @llvm.minnum.f32(float %682, float 1.000000e+00)
  %684 = tail call float @llvm.maxnum.f32(float %683, float -1.000000e+00)
  %685 = tail call float @llvm.fabs.f32(float %684)
  %686 = tail call float @llvm.fmuladd.f32(float %685, float -5.000000e-01, float 5.000000e-01)
  %687 = fmul float %684, %684
  %688 = fcmp ogt float %685, 5.000000e-01
  %689 = select i1 %688, float %686, float %687
  %690 = tail call float @llvm.fmuladd.f32(float %689, float 0x3FA38434E0000000, float 0x3F8BF8BB40000000)
  %691 = tail call float @llvm.fmuladd.f32(float %689, float %690, float 0x3FA0698780000000)
  %692 = tail call float @llvm.fmuladd.f32(float %689, float %691, float 0x3FA6C83620000000)
  %693 = tail call float @llvm.fmuladd.f32(float %689, float %692, float 0x3FB3337900000000)
  %694 = tail call float @llvm.fmuladd.f32(float %689, float %693, float 0x3FC5555580000000)
  %695 = fmul float %689, %694
  %696 = tail call float @llvm.sqrt.f32(float %689)
  %697 = tail call float @llvm.fmuladd.f32(float %696, float %695, float %696)
  %698 = fmul float %697, 2.000000e+00
  %699 = fsub float 0x400921FB60000000, %698
  %700 = fcmp olt float %684, 0.000000e+00
  %701 = select i1 %700, float %699, float %698
  %702 = tail call float @llvm.fmuladd.f32(float %684, float %695, float %684)
  %703 = fsub float 0x3FF921FB60000000, %702
  %704 = select i1 %688, float %701, float %703
  %705 = fmul contract float %704, 1.800000e+02
  %706 = fdiv contract float %705, 0x400921FA00000000
  %707 = fmul contract float %706, 4.000000e+00
  %708 = tail call float @llvm.floor.f32(float %707)
  %709 = fptosi float %708 to i32
  %710 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %709
  %711 = atomicrmw add i32 addrspace(3)* %710, i32 1 syncscope("agent-one-as") monotonic, align 4
  %712 = add nuw nsw i32 %253, 1
  %713 = icmp eq i32 %712, %107
  br i1 %713, label %251, label %252, !llvm.loop !16

714:                                              ; preds = %251, %714
  %715 = phi i32 [ %883, %714 ], [ 0, %251 ]
  %716 = zext i32 %715 to i64
  %717 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %716
  %718 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %715
  %719 = load i32, i32 addrspace(3)* %718, align 16, !tbaa !7
  %720 = zext i32 %719 to i64
  %721 = atomicrmw add i64 addrspace(1)* %717, i64 %720 syncscope("agent-one-as") monotonic, align 8
  %722 = or i32 %715, 1
  %723 = zext i32 %722 to i64
  %724 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %723
  %725 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %722
  %726 = load i32, i32 addrspace(3)* %725, align 4, !tbaa !7
  %727 = zext i32 %726 to i64
  %728 = atomicrmw add i64 addrspace(1)* %724, i64 %727 syncscope("agent-one-as") monotonic, align 8
  %729 = or i32 %715, 2
  %730 = zext i32 %729 to i64
  %731 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %730
  %732 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %729
  %733 = load i32, i32 addrspace(3)* %732, align 8, !tbaa !7
  %734 = zext i32 %733 to i64
  %735 = atomicrmw add i64 addrspace(1)* %731, i64 %734 syncscope("agent-one-as") monotonic, align 8
  %736 = or i32 %715, 3
  %737 = zext i32 %736 to i64
  %738 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %737
  %739 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %736
  %740 = load i32, i32 addrspace(3)* %739, align 4, !tbaa !7
  %741 = zext i32 %740 to i64
  %742 = atomicrmw add i64 addrspace(1)* %738, i64 %741 syncscope("agent-one-as") monotonic, align 8
  %743 = or i32 %715, 4
  %744 = zext i32 %743 to i64
  %745 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %744
  %746 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %743
  %747 = load i32, i32 addrspace(3)* %746, align 16, !tbaa !7
  %748 = zext i32 %747 to i64
  %749 = atomicrmw add i64 addrspace(1)* %745, i64 %748 syncscope("agent-one-as") monotonic, align 8
  %750 = or i32 %715, 5
  %751 = zext i32 %750 to i64
  %752 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %751
  %753 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %750
  %754 = load i32, i32 addrspace(3)* %753, align 4, !tbaa !7
  %755 = zext i32 %754 to i64
  %756 = atomicrmw add i64 addrspace(1)* %752, i64 %755 syncscope("agent-one-as") monotonic, align 8
  %757 = or i32 %715, 6
  %758 = zext i32 %757 to i64
  %759 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %758
  %760 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %757
  %761 = load i32, i32 addrspace(3)* %760, align 8, !tbaa !7
  %762 = zext i32 %761 to i64
  %763 = atomicrmw add i64 addrspace(1)* %759, i64 %762 syncscope("agent-one-as") monotonic, align 8
  %764 = or i32 %715, 7
  %765 = zext i32 %764 to i64
  %766 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %765
  %767 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %764
  %768 = load i32, i32 addrspace(3)* %767, align 4, !tbaa !7
  %769 = zext i32 %768 to i64
  %770 = atomicrmw add i64 addrspace(1)* %766, i64 %769 syncscope("agent-one-as") monotonic, align 8
  %771 = add nuw nsw i32 %715, 8
  %772 = zext i32 %771 to i64
  %773 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %772
  %774 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %771
  %775 = load i32, i32 addrspace(3)* %774, align 16, !tbaa !7
  %776 = zext i32 %775 to i64
  %777 = atomicrmw add i64 addrspace(1)* %773, i64 %776 syncscope("agent-one-as") monotonic, align 8
  %778 = add nuw nsw i32 %715, 9
  %779 = zext i32 %778 to i64
  %780 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %779
  %781 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %778
  %782 = load i32, i32 addrspace(3)* %781, align 4, !tbaa !7
  %783 = zext i32 %782 to i64
  %784 = atomicrmw add i64 addrspace(1)* %780, i64 %783 syncscope("agent-one-as") monotonic, align 8
  %785 = add nuw nsw i32 %715, 10
  %786 = zext i32 %785 to i64
  %787 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %786
  %788 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %785
  %789 = load i32, i32 addrspace(3)* %788, align 8, !tbaa !7
  %790 = zext i32 %789 to i64
  %791 = atomicrmw add i64 addrspace(1)* %787, i64 %790 syncscope("agent-one-as") monotonic, align 8
  %792 = add nuw nsw i32 %715, 11
  %793 = zext i32 %792 to i64
  %794 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %793
  %795 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %792
  %796 = load i32, i32 addrspace(3)* %795, align 4, !tbaa !7
  %797 = zext i32 %796 to i64
  %798 = atomicrmw add i64 addrspace(1)* %794, i64 %797 syncscope("agent-one-as") monotonic, align 8
  %799 = add nuw nsw i32 %715, 12
  %800 = zext i32 %799 to i64
  %801 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %800
  %802 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %799
  %803 = load i32, i32 addrspace(3)* %802, align 16, !tbaa !7
  %804 = zext i32 %803 to i64
  %805 = atomicrmw add i64 addrspace(1)* %801, i64 %804 syncscope("agent-one-as") monotonic, align 8
  %806 = add nuw nsw i32 %715, 13
  %807 = zext i32 %806 to i64
  %808 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %807
  %809 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %806
  %810 = load i32, i32 addrspace(3)* %809, align 4, !tbaa !7
  %811 = zext i32 %810 to i64
  %812 = atomicrmw add i64 addrspace(1)* %808, i64 %811 syncscope("agent-one-as") monotonic, align 8
  %813 = add nuw nsw i32 %715, 14
  %814 = zext i32 %813 to i64
  %815 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %814
  %816 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %813
  %817 = load i32, i32 addrspace(3)* %816, align 8, !tbaa !7
  %818 = zext i32 %817 to i64
  %819 = atomicrmw add i64 addrspace(1)* %815, i64 %818 syncscope("agent-one-as") monotonic, align 8
  %820 = add nuw nsw i32 %715, 15
  %821 = zext i32 %820 to i64
  %822 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %821
  %823 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %820
  %824 = load i32, i32 addrspace(3)* %823, align 4, !tbaa !7
  %825 = zext i32 %824 to i64
  %826 = atomicrmw add i64 addrspace(1)* %822, i64 %825 syncscope("agent-one-as") monotonic, align 8
  %827 = add nuw nsw i32 %715, 16
  %828 = zext i32 %827 to i64
  %829 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %828
  %830 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %827
  %831 = load i32, i32 addrspace(3)* %830, align 16, !tbaa !7
  %832 = zext i32 %831 to i64
  %833 = atomicrmw add i64 addrspace(1)* %829, i64 %832 syncscope("agent-one-as") monotonic, align 8
  %834 = add nuw nsw i32 %715, 17
  %835 = zext i32 %834 to i64
  %836 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %835
  %837 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %834
  %838 = load i32, i32 addrspace(3)* %837, align 4, !tbaa !7
  %839 = zext i32 %838 to i64
  %840 = atomicrmw add i64 addrspace(1)* %836, i64 %839 syncscope("agent-one-as") monotonic, align 8
  %841 = add nuw nsw i32 %715, 18
  %842 = zext i32 %841 to i64
  %843 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %842
  %844 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %841
  %845 = load i32, i32 addrspace(3)* %844, align 8, !tbaa !7
  %846 = zext i32 %845 to i64
  %847 = atomicrmw add i64 addrspace(1)* %843, i64 %846 syncscope("agent-one-as") monotonic, align 8
  %848 = add nuw nsw i32 %715, 19
  %849 = zext i32 %848 to i64
  %850 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %849
  %851 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %848
  %852 = load i32, i32 addrspace(3)* %851, align 4, !tbaa !7
  %853 = zext i32 %852 to i64
  %854 = atomicrmw add i64 addrspace(1)* %850, i64 %853 syncscope("agent-one-as") monotonic, align 8
  %855 = add nuw nsw i32 %715, 20
  %856 = zext i32 %855 to i64
  %857 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %856
  %858 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %855
  %859 = load i32, i32 addrspace(3)* %858, align 16, !tbaa !7
  %860 = zext i32 %859 to i64
  %861 = atomicrmw add i64 addrspace(1)* %857, i64 %860 syncscope("agent-one-as") monotonic, align 8
  %862 = add nuw nsw i32 %715, 21
  %863 = zext i32 %862 to i64
  %864 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %863
  %865 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %862
  %866 = load i32, i32 addrspace(3)* %865, align 4, !tbaa !7
  %867 = zext i32 %866 to i64
  %868 = atomicrmw add i64 addrspace(1)* %864, i64 %867 syncscope("agent-one-as") monotonic, align 8
  %869 = add nuw nsw i32 %715, 22
  %870 = zext i32 %869 to i64
  %871 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %870
  %872 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %869
  %873 = load i32, i32 addrspace(3)* %872, align 8, !tbaa !7
  %874 = zext i32 %873 to i64
  %875 = atomicrmw add i64 addrspace(1)* %871, i64 %874 syncscope("agent-one-as") monotonic, align 8
  %876 = add nuw nsw i32 %715, 23
  %877 = zext i32 %876 to i64
  %878 = getelementptr inbounds i64, i64 addrspace(1)* %4, i64 %877
  %879 = getelementptr inbounds [720 x i32], [720 x i32] addrspace(3)* @_ZZ9DR_kerneliiPfS_PyE5sHist, i32 0, i32 %876
  %880 = load i32, i32 addrspace(3)* %879, align 4, !tbaa !7
  %881 = zext i32 %880 to i64
  %882 = atomicrmw add i64 addrspace(1)* %878, i64 %881 syncscope("agent-one-as") monotonic, align 8
  %883 = add nuw nsw i32 %715, 24
  %884 = icmp eq i32 %883, 720
  br i1 %884, label %885, label %714, !llvm.loop !17

885:                                              ; preds = %714, %251, %5
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
